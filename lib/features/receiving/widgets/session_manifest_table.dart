import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';

class SessionManifestTable extends StatelessWidget {
  final PurchaseOrder? selectedPo;
  final List<PoItem> currentManifest;
  final Map<String, int> scannedQuantities;
  final void Function(String sku, int newQuantity)? onUpdateQuantity;
  final bool isReadOnly;

  const SessionManifestTable({
    super.key,
    required this.selectedPo,
    required this.currentManifest,
    required this.scannedQuantities,
    this.onUpdateQuantity,
    this.isReadOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  if (!isReadOnly)
                    Row(
                      children: [
                        TextButton.icon(
                          onPressed: selectedPo != null
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
                          onPressed: selectedPo != null
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
              child: selectedPo == null
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.assignment,
                              size: 48, color: AppColors.separatorColor),
                          SizedBox(height: 16),
                          Text('Select a PO to view manifest',
                              style: TextStyle(color: AppColors.textSecondaryLight)),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: currentManifest.length,
                      separatorBuilder: (_, __) =>
                          const Divider(color: AppColors.separatorColor),
                      itemBuilder: (context, index) {
                        final item = currentManifest[index];
                        final scanned = scannedQuantities[
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
                            if (!isReadOnly)
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline,
                                        color: AppColors.textSecondaryLight),
                                    tooltip: 'Undo last scan',
                                    onPressed: scanned > 0
                                        ? () {
                                            onUpdateQuantity?.call(
                                                item.product!.sku.toUpperCase(),
                                                scanned - 1);
                                          }
                                        : null,
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline,
                                        color: AppColors.textSecondaryLight),
                                    tooltip: 'Manual entry',
                                    onPressed: () {
                                      onUpdateQuantity?.call(
                                          item.product!.sku.toUpperCase(),
                                          scanned + 1);
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
    );
  }
}
