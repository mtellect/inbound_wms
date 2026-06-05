import 'package:flutter/material.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/features/dashboard/providers/dashboard_provider.dart';
import 'package:inbound_ms/features/dashboard/widgets/section_card.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/features/purchase_orders/widgets/purchase_order_details_modal.dart';
import 'package:provider/provider.dart';

class RecentActivityList extends StatelessWidget {
  const RecentActivityList({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();
    final recentActivity = dashboardProvider.recentActivity;

    return SectionCard(
      title: 'Recent Activity',
      child: recentActivity.isEmpty
          ? _buildEmptyState(context)
          : Column(
              children: recentActivity.map((activity) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        if (activity.poNumber != null) {
                          final poProvider = context.read<PurchaseOrderProvider>();
                          final matchedPo = poProvider.activeOrders.cast<PurchaseOrder?>().firstWhere(
                            (po) => po?.poNumber == activity.poNumber,
                            orElse: () => null,
                          );
                          if (matchedPo != null) {
                            showDialog(
                              context: context,
                              builder: (context) => PurchaseOrderDetailsModal(po: matchedPo),
                            );
                          } else {
                            ToastUtils.showInfo(context, message: 'PO details are not currently loaded.');
                          }
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.withValues(alpha: 0.1)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: activity.iconColor.withValues(alpha: 0.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(activity.icon, color: activity.iconColor, size: 20),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    activity.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    activity.timeAgo,
                                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.chevron_right, color: Colors.grey),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_toggle_off, size: 64, color: Colors.grey[300]),
          const SizedBox(height: 16),
          Text(
            'No Recent Activity',
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.grey[600], fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Activities will appear here once you\nstart receiving or managing POs.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[500]),
          ),
        ],
      ),
    );
  }
}
