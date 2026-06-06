import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/receiving/widgets/meta_field.dart';
import 'package:inbound_ms/features/receiving/widgets/session_manifest_table.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';

class PurchaseOrderDetailsModal extends StatelessWidget {
  final PurchaseOrder po;

  const PurchaseOrderDetailsModal({
    super.key,
    required this.po,
  });

  int get _totalExpected {
    return po.items.fold(0, (sum, item) => sum + item.expectedQuantity);
  }

  int get _totalReceived {
    return po.items.fold(0, (sum, item) => sum + item.receivedQuantity);
  }

  Color _getStatusColor() {
    switch (po.status.toLowerCase()) {
      case 'completed':
        return AppColors.success;
      case 'receiving':
        return AppColors.warning;
      case 'pending':
      default:
        return AppColors.info;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(48),
      child: Container(
        width: 1000,
        height: 800,
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
                  Row(
                    children: [
                      Text('Purchase Order: ${po.poNumber}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              color: AppColors.textPrimaryLight)),
                      const SizedBox(width: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getStatusColor().withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: _getStatusColor().withValues(alpha: 0.2)),
                        ),
                        child: Text(
                          po.status.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _getStatusColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      OutlinedButton.icon(
                        icon: const Icon(Icons.download, size: 16),
                        label: const Text('Export CSV'),
                        onPressed: () {
                          context.read<PurchaseOrderProvider>().exportPoToCsv(
                            po: po,
                            onSuccess: () {
                              ToastUtils.showSuccess(context, message: 'CSV Exported successfully.');
                            },
                            onError: (err) {
                              ToastUtils.showError(context, message: err);
                            },
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: const Icon(Icons.close, color: AppColors.textSecondaryLight),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Meta Data Row
              Row(
                children: [
                  Expanded(
                    child: MetaField(
                      label: 'SUPPLIER',
                      value: po.supplierName ?? po.supplierId ?? 'Unknown',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: MetaField(
                      label: 'CREATED AT',
                      value: po.createdAt?.toIso8601String().split('T')[0] ?? '---',
                      isDate: true,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: MetaField(
                      label: 'TOTAL UNITS',
                      value: '$_totalReceived / $_totalExpected',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Manifest List
              SessionManifestTable(
                selectedPo: po,
                currentManifest: po.items,
                isReadOnly: true,
                scannedQuantities: {
                  for (var item in po.items)
                    if (item.product != null)
                      item.product!.sku.toUpperCase(): item.receivedQuantity
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
