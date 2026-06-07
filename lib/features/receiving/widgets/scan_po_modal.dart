import 'dart:async';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';

import 'package:inbound_ms/features/dashboard/providers/dashboard_provider.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';

import 'package:inbound_ms/features/receiving/widgets/po_context_header.dart';
import 'package:inbound_ms/features/receiving/widgets/scan_metrics_row.dart';
import 'package:inbound_ms/features/receiving/widgets/session_manifest_table.dart';

class ScanPoModal extends StatefulWidget {
  final PurchaseOrder? initialPo;

  const ScanPoModal({super.key, this.initialPo});

  @override
  State<ScanPoModal> createState() => _ScanPoModalState();
}

class _ScanPoModalState extends State<ScanPoModal> {
  final TextEditingController _scanController = TextEditingController();
  final FocusNode _scanFocusNode = FocusNode();

  PurchaseOrder? _selectedPo;
  List<PoItem> _currentManifest = [];
  final Map<String, int> _scannedQuantities = {};
  int _unexpectedScans = 0;
  Timer? _autoSaveTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<PurchaseOrderProvider>().loadActiveOrders();
      if (widget.initialPo != null && mounted) {
        _onPoSelected(widget.initialPo!.id);
      }
    });
  }

  @override
  void dispose() {
    _scanController.dispose();
    _scanFocusNode.dispose();
    _autoSaveTimer?.cancel();
    super.dispose();
  }

  void _triggerAutoSave() {
    _autoSaveTimer?.cancel();
    _autoSaveTimer = Timer(const Duration(milliseconds: 1500), () {
      if (_selectedPo == null || !mounted) return;
      context.read<PurchaseOrderProvider>().autoSaveReceivingSession(
        po: _selectedPo!,
        scannedQuantities: _scannedQuantities,
      );
    });
  }

  void _onPoSelected(String? poId) {
    if (poId == null) return;
    final provider = context.read<PurchaseOrderProvider>();
    setState(() {
      _selectedPo = provider.activeOrders.firstWhere((po) => po.id == poId);

      _currentManifest = _selectedPo!.items;

      _scannedQuantities.clear();
      _unexpectedScans = 0;
      for (var item in _currentManifest) {
        if (item.product != null) {
          _scannedQuantities[item.product!.sku.toUpperCase()] = item.receivedQuantity;
        }
      }
    });
    // Give focus to scanner
    Future.delayed(const Duration(milliseconds: 100), () {
      if (mounted) _scanFocusNode.requestFocus();
    });
  }

  void _onScan() {
    final barcode = _scanController.text.trim().toUpperCase();
    if (barcode.isEmpty) return;

    _scanController.clear();
    _scanFocusNode.requestFocus();

    // 1. Try to auto-select PO
    debugPrint("--- SCAN ATTEMPT: $barcode ---");
    if (_tryAutoSelectPo(barcode)) {
      debugPrint("Matched as PO number!");
      return;
    }

    // 2. Validate session
    if (_selectedPo == null) {
      ToastUtils.showError(context, message: 'Please select or scan a PO first.');
      return;
    }

    // 3. Process item scan
    _processItemScan(barcode);
  }

  bool _tryAutoSelectPo(String barcode) {
    final poProvider = context.read<PurchaseOrderProvider>();
    try {
      final matchedPo = poProvider.activeOrders.firstWhere(
        (p) => p.poNumber.toUpperCase() == barcode,
      );
      if (_selectedPo?.id != matchedPo.id) {
        _onPoSelected(matchedPo.id);
        ToastUtils.showSuccess(context, message: 'Auto-selected PO: ${matchedPo.poNumber}');
      } else {
        ToastUtils.showSuccess(context, message: 'PO already selected: ${matchedPo.poNumber}');
      }
      return true;
    } catch (_) {
      return false; // Not a PO number
    }
  }

  void _processItemScan(String barcode) {
    setState(() {
      if (_scannedQuantities.containsKey(barcode)) {
        final expected = _currentManifest
            .firstWhere((item) => item.product?.sku.toUpperCase() == barcode)
            .expectedQuantity;
        final scanned = _scannedQuantities[barcode] ?? 0;
        
        if (scanned < expected) {
          _scannedQuantities[barcode] = scanned + 1;
          _triggerAutoSave();
          debugPrint("Success: Incremented quantity for $barcode");
          ToastUtils.showSuccess(context, message: 'Scanned 1x $barcode');
        } else {
          ToastUtils.showError(context, message: 'Over scan prevented: $barcode already at max ($expected)');
        }
      } else {
        _unexpectedScans++;
        _triggerAutoSave();
        debugPrint("Error: Unexpected SKU $barcode");
        ToastUtils.showError(context, message: 'Unexpected SKU: $barcode not on PO!');
      }
    });
  }

  void _updateQuantity(String sku, int newQuantity) {
    setState(() {
      _scannedQuantities[sku] = newQuantity;
    });
    _triggerAutoSave();
  }

  void _handleSaveSession(bool isComplete) {
    _autoSaveTimer?.cancel();
    if (_selectedPo == null) {
      Navigator.of(context).pop();
      return;
    }

    final authProvider = context.read<AuthProvider>();
    final operatorId = authProvider.currentUserId ?? '00000000-0000-0000-0000-000000000000';

    context.read<PurchaseOrderProvider>().saveReceivingSession(
      po: _selectedPo!,
      scannedQuantities: _scannedQuantities,
      isComplete: isComplete,
      operatorId: operatorId,
      onSuccess: () async {
        if (mounted) {
          ToastUtils.showSuccess(
            context,
            message: isComplete ? 'Receiving completed!' : 'Session paused.',
          );
          context.read<DashboardProvider>().loadDashboardData();
          Navigator.of(context).pop();
        }
      },
      onError: (err) {
        if (mounted) {
          ToastUtils.showError(context, message: 'Failed to save: $err');
        }
      },
    );
  }

  int get _totalExpected {
    if (_selectedPo == null) return 0;
    return _currentManifest.fold(0, (sum, item) => sum + item.expectedQuantity);
  }

  int get _totalScanned {
    return _scannedQuantities.values.fold(0, (sum, qty) => sum + qty);
  }

  int get _mismatches {
    if (_selectedPo == null) return 0;
    int overages = 0;
    for (var item in _currentManifest) {
      if (item.product == null) continue;
      final scanned = _scannedQuantities[item.product!.sku.toUpperCase()] ?? 0;
      if (scanned > item.expectedQuantity) {
        overages += (scanned - item.expectedQuantity);
      }
    }
    return overages;
  }

  @override
  Widget build(BuildContext context) {
    // Aggressively maintain focus if tapped outside but inside dialog
    return GestureDetector(
      onTap: () {
        if (_selectedPo != null) _scanFocusNode.requestFocus();
      },
      child: Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(48),
        child: Container(
          width: 1100,
          decoration: BoxDecoration(
            color: AppColors.backgroundLight,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Receive PO Session',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textPrimaryLight,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: AppColors.textSecondaryLight),
                      onPressed: () => _handleSaveSession(false),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Top Meta Data (Context Selection)
                PoContextHeader(selectedPo: _selectedPo, onPoSelected: _onPoSelected),
                const SizedBox(height: 24),

                // Scanner Input
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _scanController,
                        focusNode: _scanFocusNode,
                        enabled: _selectedPo != null,
                        autofocus: true,
                        onSubmitted: (_) => _onScan(),
                        style: const TextStyle(color: AppColors.textPrimaryLight),
                        decoration: InputDecoration(
                          hintText: _selectedPo != null
                              ? 'Scan barcode — press Enter'
                              : 'Select a PO to begin scanning',
                          hintStyle: const TextStyle(color: AppColors.textSecondaryLight),
                          prefixIcon: const Icon(
                            Icons.qr_code_scanner,
                            color: AppColors.textSecondaryLight,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: AppColors.separatorColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: AppColors.separatorColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: AppColors.primary, width: 2),
                          ),
                          filled: true,
                          fillColor: _selectedPo != null
                              ? AppColors.surfaceLight
                              : AppColors.separatorColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: _selectedPo != null ? _onScan : null,
                      icon: const Icon(Icons.camera_alt),
                      label: const Text('Scan'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: AppColors.textPrimaryDark,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Metrics
                ScanMetricsRow(
                  totalExpected: _totalExpected,
                  totalScanned: _totalScanned,
                  mismatches: _mismatches,
                  unexpectedScans: _unexpectedScans,
                ),
                const SizedBox(height: 32),

                // Session Table (Consolidated Manifest)
                SessionManifestTable(
                  selectedPo: _selectedPo,
                  currentManifest: _currentManifest,
                  scannedQuantities: _scannedQuantities,
                  onUpdateQuantity: _updateQuantity,
                  onPause: () => _handleSaveSession(false),
                  onComplete: () => _handleSaveSession(true),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
