import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';
import 'package:inbound_ms/features/purchase_orders/widgets/purchase_order_details_modal.dart';
import 'package:inbound_ms/core/utils/dialog_utils.dart';
import 'package:inbound_ms/features/dashboard/providers/dashboard_provider.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/widgets/confirmation_dialog.dart';

@RoutePage()
class PurchaseOrdersPage extends StatefulWidget {
  const PurchaseOrdersPage({super.key});

  @override
  State<PurchaseOrdersPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrdersPage> {
  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PurchaseOrderProvider>().loadActiveOrders();
    });

    _resource = AdminResource(
      key: 'purchase_orders',
      tableName: 'Purchase Orders',
      subtitle: 'Manage expected inbound shipments and PO lifecycle.',
      singularName: 'PO',
      columns: const [
        AdminColumn(key: 'poNumber', label: 'PO Number', flex: 2),
        AdminColumn(key: 'supplier', label: 'Supplier ID', flex: 2),
        AdminColumn(key: 'date', label: 'Expected Date', flex: 2),
        AdminColumn(key: 'status', label: 'Status', flex: 2, type: AdminColumnType.pill),
      ],
      headerActions: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
          label: const Text('Filters'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<PurchaseOrderProvider>(
        builder: (context, provider, child) {
          final records = provider.activeOrders.map((o) {
            return TableRowData<String>(
              id: o.id,
              uid: o.id,
              cells: {
                'poNumber': TableCellData(value: o.poNumber),
                'supplier': TableCellData(value: o.supplierId ?? '-'),
                'date': TableCellData(value: o.createdAt?.toIso8601String().split('T')[0] ?? '-'),
                'status': TableCellData(value: o.status, type: AdminColumnType.pill),
              },
            );
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: AppTableView<String>(
                    resource: _resource,
                    records: records,
                    isLoading: provider.isLoading,
                    loadingRecordIds: provider.loadingOrderIds,
                    totalRecords: records.length,
                    onAdd: () {},
                    onEdit: (record) {},
                    onDelete: (record) {
                      ConfirmationDialog.show(
                        context,
                        title: 'Delete Purchase Order',
                        message:
                            'Are you sure you want to delete this purchase order? This action cannot be undone and will delete all associated line items.',
                        confirmLabel: 'Delete',
                        isDestructive: true,
                        onConfirm: () {
                          context.read<PurchaseOrderProvider>().deleteOrder(
                                id: record.id,
                                onSuccess: () {
                                  if (mounted) {
                                    ToastUtils.showSuccess(context,
                                        message: 'Order deleted successfully');
                                    context.read<DashboardProvider>().loadDashboardData();
                                  }
                                },
                                onError: (error) => ToastUtils.showError(context,
                                    message: 'Failed to delete order: $error'),
                              );
                        },
                      );
                    },
                    onView: (record) {
                      final po = provider.activeOrders.firstWhere((o) => o.id == record.id);
                      DialogUtils.showDialog(
                        context: context,
                        builder: (_) => PurchaseOrderDetailsModal(po: po),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
