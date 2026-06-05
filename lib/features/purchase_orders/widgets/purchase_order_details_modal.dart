import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/receiving/widgets/meta_field.dart';

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
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textSecondaryLight),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Meta Data Row
              Row(
                children: [
                  Expanded(
                    child: MetaField(
                      label: 'SUPPLIER ID',
                      value: po.supplierId ?? '---',
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
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceLight,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.separatorColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Item Manifest',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textPrimaryLight)),
                      ),
                      const Divider(height: 1, color: AppColors.separatorColor),
                      Expanded(
                        child: po.items.isEmpty
                            ? const Center(
                                child: Text('No items in this purchase order.',
                                    style: TextStyle(color: AppColors.textSecondaryLight)),
                              )
                            : ListView.separated(
                                padding: const EdgeInsets.all(16),
                                itemCount: po.items.length,
                                separatorBuilder: (_, __) =>
                                    const Divider(color: AppColors.separatorColor),
                                itemBuilder: (context, index) {
                                  final item = po.items[index];
                                  return Row(
                                    children: [
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
                                        child: Text('Received: ${item.receivedQuantity}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: item.receivedQuantity > 0
                                                    ? AppColors.success
                                                    : AppColors.textSecondaryLight)),
                                      ),
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
  }
}
