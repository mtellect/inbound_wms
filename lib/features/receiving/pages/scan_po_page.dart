import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/app_dropdown_button.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';

import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:provider/provider.dart';

class ScanPoPage extends StatefulWidget {
  const ScanPoPage({super.key});

  @override
  State<ScanPoPage> createState() => _ScanPoPageState();
}

class _ScanPoPageState extends State<ScanPoPage> {
  final TextEditingController _scanController = TextEditingController();
  final FocusNode _scanFocusNode = FocusNode();

  PurchaseOrder? _selectedPo;
  List<PoItem> _currentManifest = [];
  final Map<String, int> _scannedQuantities = {};
  int _unexpectedScans = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PurchaseOrderProvider>().loadActiveOrders();
    });
  }

  @override
  void dispose() {
    _scanController.dispose();
    _scanFocusNode.dispose();
    super.dispose();
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
          _scannedQuantities[item.product!.sku.toUpperCase()] = 0;
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
      final matchedPo =
          poProvider.activeOrders.firstWhere((p) => p.poNumber.toUpperCase() == barcode);
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
        _scannedQuantities[barcode] = (_scannedQuantities[barcode] ?? 0) + 1;
        debugPrint("Success: Incremented quantity for $barcode");
        ToastUtils.showSuccess(context, message: 'Scanned 1x $barcode');
      } else {
        _unexpectedScans++;
        debugPrint("Error: Unexpected SKU $barcode");
        ToastUtils.showError(context, message: 'Unexpected SKU: $barcode not on PO!');
      }
    });
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
      child: Consumer<PurchaseOrderProvider>(
        builder: (context, provider, child) {
          return Dialog(
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
                        const Text('Receive PO Session',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w900,
                                color: AppColors.textPrimaryLight)),
                        IconButton(
                          icon: const Icon(Icons.close, color: AppColors.textSecondaryLight),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Top Meta Data (Context Selection)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('SELECT PO #',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textSecondaryLight)),
                              const SizedBox(height: 8),
                              AppDropDownButton<String>(
                                value: _selectedPo?.id,
                                hint: const Text('Select a Purchase Order'),
                                isSearchable: true,
                                searchHint: 'Search PO...',
                                items: provider.activeOrders
                                    .map((po) => DropdownMenuItem(
                                          value: po.id,
                                          child: Text(po.poNumber),
                                        ))
                                    .toList(),
                                onChanged: _onPoSelected,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: _buildMetaField('SUPPLIER', _selectedPo?.supplierId ?? '---'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          flex: 1,
                          child: _buildMetaField('DATE',
                              _selectedPo?.createdAt?.toIso8601String().split('T')[0] ?? '---',
                              isDate: true),
                        ),
                      ],
                    ),
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
                              prefixIcon: const Icon(Icons.qr_code_scanner,
                                  color: AppColors.textSecondaryLight),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: AppColors.separatorColor)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: AppColors.separatorColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(color: AppColors.primary, width: 2)),
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
                    Row(
                      children: [
                        Expanded(
                            child: _buildMetricCard('PROGRESS', '$_totalScanned / $_totalExpected',
                                Icons.inventory_2, AppColors.info)),
                        const SizedBox(width: 16),
                        Expanded(
                            child: _buildMetricCard(
                                'OVERAGES', '$_mismatches', Icons.warning, AppColors.warning)),
                        const SizedBox(width: 16),
                        Expanded(
                            child: _buildMetricCard(
                                'UNEXPECTED', '$_unexpectedScans', Icons.cancel, AppColors.error)),
                      ],
                    ),
                    const SizedBox(height: 32),

                    // Session Table (Consolidated Manifest)
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.surfaceLight,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.separatorColor),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Consolidated Manifest',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.textPrimaryLight)),
                                  Row(
                                    children: [
                                      TextButton.icon(
                                        onPressed: _selectedPo != null
                                            ? () {
                                                ToastUtils.showSuccess(context,
                                                    message: 'Session paused.');
                                                Navigator.of(context).pop();
                                              }
                                            : null,
                                        icon: const Icon(Icons.pause),
                                        label: const Text('Pause'),
                                        style: TextButton.styleFrom(
                                            foregroundColor: AppColors.textSecondaryLight),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton.icon(
                                        onPressed: _selectedPo != null
                                            ? () {
                                                ToastUtils.showSuccess(context,
                                                    message: 'Receiving completed.');
                                                Navigator.of(context).pop();
                                              }
                                            : null,
                                        icon: const Icon(Icons.check_circle),
                                        label: const Text('Complete Receiving'),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.primary,
                                          foregroundColor: AppColors.textPrimaryDark,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Divider(height: 1, color: AppColors.separatorColor),
                            Expanded(
                              child: _selectedPo == null
                                  ? const Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.assignment,
                                              size: 48, color: AppColors.separatorColor),
                                          SizedBox(height: 16),
                                          Text('Select a PO to view manifest',
                                              style:
                                                  TextStyle(color: AppColors.textSecondaryLight)),
                                        ],
                                      ),
                                    )
                                  : ListView.separated(
                                      padding: const EdgeInsets.all(16),
                                      itemCount: _currentManifest.length,
                                      separatorBuilder: (_, __) =>
                                          const Divider(color: AppColors.separatorColor),
                                      itemBuilder: (context, index) {
                                        final item = _currentManifest[index];
                                        final scanned = _scannedQuantities[
                                                (item.product?.sku ?? '').toUpperCase()] ??
                                            0;
                                        final variance = scanned - item.expectedQuantity;

                                        Color statusColor = AppColors.separatorColor;
                                        IconData statusIcon = Icons.pending;

                                        if (scanned > 0) {
                                          if (variance == 0) {
                                            statusColor = AppColors.success;
                                            statusIcon = Icons.check_circle;
                                          } else if (variance > 0) {
                                            statusColor = AppColors.warning;
                                            statusIcon = Icons.warning;
                                          } else {
                                            statusColor = AppColors.info;
                                            statusIcon = Icons.incomplete_circle;
                                          }
                                        }

                                        return Row(
                                          children: [
                                            Icon(statusIcon, color: statusColor),
                                            const SizedBox(width: 16),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(item.product?.sku ?? 'Unknown SKU',
                                                      style: const TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          color: AppColors.textPrimaryLight)),
                                                  Text(item.product?.name ?? 'Unknown Product',
                                                      style: const TextStyle(
                                                          color: AppColors.textSecondaryLight,
                                                          fontSize: 12)),
                                                ],
                                              ),
                                            ),
                                            Expanded(
                                              child: Text('Expected: ${item.expectedQuantity}',
                                                  style: const TextStyle(
                                                      color: AppColors.textSecondaryLight)),
                                            ),
                                            Expanded(
                                              child: Text('Scanned: $scanned',
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColors.textPrimaryLight)),
                                            ),
                                            Expanded(
                                              child: Text(
                                                  variance > 0
                                                      ? '+$variance (Over)'
                                                      : variance < 0
                                                          ? '$variance (Short)'
                                                          : 'Matched',
                                                  style: TextStyle(
                                                    color: variance > 0
                                                        ? AppColors.warning
                                                        : variance < 0
                                                            ? AppColors.error
                                                            : AppColors.success,
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                  icon: const Icon(Icons.remove_circle_outline,
                                                      color: AppColors.textSecondaryLight),
                                                  tooltip: 'Undo last scan',
                                                  onPressed: scanned > 0
                                                      ? () {
                                                          setState(() {
                                                            _scannedQuantities[item.product!.sku
                                                                .toUpperCase()] = scanned - 1;
                                                          });
                                                        }
                                                      : null,
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.add_circle_outline,
                                                      color: AppColors.textSecondaryLight),
                                                  tooltip: 'Manual entry',
                                                  onPressed: () {
                                                    setState(() {
                                                      _scannedQuantities[item.product!.sku] =
                                                          scanned + 1;
                                                    });
                                                  },
                                                ),
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMetaField(String label, String value, {bool isDate = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.textSecondaryLight)),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.separatorColor),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: AppColors.textPrimaryLight)),
              if (isDate && value != '---')
                const Icon(Icons.calendar_today, size: 16, color: AppColors.textSecondaryLight),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.separatorColor),
        boxShadow: [
          BoxShadow(
              color: AppColors.textPrimaryLight.withValues(alpha: 0.02),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 12),
              Text(label,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondaryLight)),
            ],
          ),
          Text(value, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: color)),
        ],
      ),
    );
  }
}
