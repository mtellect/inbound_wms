import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/dashboard/providers/dashboard_provider.dart';
import 'package:inbound_ms/core/widgets/dotted_border.dart';
import 'package:desktop_drop/desktop_drop.dart';
import 'package:file_picker/file_picker.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/features/purchase_orders/services/import_orders_service.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/widgets/app_input_field.dart';
import 'package:inbound_ms/core/widgets/app_button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cross_file/cross_file.dart';

class ImportOrdersModal extends StatefulWidget {
  const ImportOrdersModal({super.key});

  @override
  State<ImportOrdersModal> createState() => _ImportOrdersModalState();
}

class _ImportOrdersModalState extends State<ImportOrdersModal> {
  final _vendorController = TextEditingController();
  bool _isDragging = false;
  bool _isParsing = false;
  XFile? _selectedFile;

  @override
  void initState() {
    super.initState();
    _vendorController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _vendorController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['csv', 'xlsx'],
      withData: kIsWeb,
    );
    if (result != null && result.files.isNotEmpty) {
      final f = result.files.first;
      setState(() {
        if (kIsWeb) {
          _selectedFile = XFile.fromData(f.bytes!, name: f.name);
        } else {
          _selectedFile = XFile(f.path!);
        }
      });
    }
  }

  Future<void> _processImport() async {
    if (_selectedFile == null) {
      ToastUtils.showError(context, message: 'Please select or drop a file first.');
      return;
    }

    setState(() => _isParsing = true);

    try {
      final bytes = await _selectedFile!.readAsBytes();
      final ext = _selectedFile!.name.split('.').last;

      final vendorName = _vendorController.text.trim();
      if (vendorName.isEmpty) {
        ToastUtils.showError(context, message: 'Vendor Name is required.');
        setState(() => _isParsing = false);
        return;
      }

      final orders = ImportOrdersService.parseOrdersBytes(
        bytes: bytes,
        extension: ext,
        defaultSupplierId: vendorName,
      );

      if (mounted) {
        if (orders.isEmpty) {
          ToastUtils.showError(context, message: 'No valid orders found in file.');
          setState(() => _isParsing = false);
          return;
        }

        await context.read<PurchaseOrderProvider>().importCsvOrders(
              orders: orders,
              onSuccess: () {
                if (mounted) {
                  context.router.maybePop();
                  context.read<DashboardProvider>().loadDashboardData();
                  ToastUtils.showSuccess(context,
                      message: 'Imported ${orders.length} orders successfully');
                }
              },
              onError: (error) {
                if (mounted) {
                  ToastUtils.showError(context, message: 'Failed to import orders: $error');
                }
              },
            );
      }
    } catch (e) {
      if (mounted) {
        ToastUtils.showError(context, message: 'Error parsing file: $e');
      }
    } finally {
      if (mounted) {
        setState(() => _isParsing = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Import Purchase Orders',
                style:
                    Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              AppInputField(
                controller: _vendorController,
                labelText: 'Vendor Name (Required)',
                hintText: 'Enter the supplier or vendor name',
              ),
              const SizedBox(height: 24),
              DropTarget(
                onDragDone: (detail) {
                  if (detail.files.isNotEmpty) {
                    final file = detail.files.first;
                    final ext = file.name.split('.').last.toLowerCase();
                    if (ext == 'csv' || ext == 'xlsx') {
                      setState(() => _selectedFile = file);
                    } else {
                      ToastUtils.showError(context,
                          message: 'Only .csv and .xlsx files are supported');
                    }
                  }
                },
                onDragEntered: (detail) => setState(() => _isDragging = true),
                onDragExited: (detail) => setState(() => _isDragging = false),
                child: GestureDetector(
                  onTap: _pickFile,
                  child: DottedBorder(
                    color: _isDragging ? Theme.of(context).primaryColor : Colors.grey.shade400,
                    strokeWidth: 2,
                    dashPattern: const [8, 4],
                    borderType: BorderType.rRect,
                    radius: const Radius.circular(12),
                    padding: EdgeInsets.zero,
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: _isDragging
                            ? Theme.of(context).primaryColor.withOpacity(0.1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            _selectedFile != null ? Icons.insert_drive_file : Icons.cloud_upload,
                            size: 48,
                            color: _selectedFile != null
                                ? Theme.of(context).primaryColor
                                : Colors.grey.shade500,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _selectedFile != null
                                ? _selectedFile!.name
                                : 'Drag & Drop CSV or Excel file here\nor click to browse',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight:
                                  _selectedFile != null ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: _isParsing ? null : () => context.router.maybePop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  SizedBox(
                    width: 140,
                    child: AppButton(
                      label: 'Import',
                      onPressed: (_selectedFile == null || _vendorController.text.trim().isEmpty) ? null : _processImport,
                      isLoading: _isParsing,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
