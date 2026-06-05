import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';

@RoutePage()
class PurchaseOrdersPage extends StatefulWidget {
  const PurchaseOrdersPage({super.key});

  @override
  State<PurchaseOrdersPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrdersPage> {
  final List<PurchaseOrder> _orders = [
    PurchaseOrder(id: '1', poNumber: 'PO-2024-001', supplierId: 'SUP-001', createdAt: DateTime.now().add(const Duration(days: 2)), status: 'draft'),
    PurchaseOrder(id: '2', poNumber: 'PO-2024-002', supplierId: 'SUP-002', createdAt: DateTime.now().add(const Duration(days: 5)), status: 'issued'),
    PurchaseOrder(id: '3', poNumber: 'PO-2024-003', supplierId: 'SUP-003', createdAt: DateTime.now().subtract(const Duration(days: 1)), status: 'partially_received'),
    PurchaseOrder(id: '4', poNumber: 'PO-2024-004', supplierId: 'SUP-004', createdAt: DateTime.now().subtract(const Duration(days: 3)), status: 'closed'),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
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
    final records = _orders.map((o) {
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

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: AppTableView<String>(
                resource: _resource,
                records: records,
                isLoading: false,
                totalRecords: records.length,
                onAdd: () {},
                onEdit: (record) {},
                onDelete: (record) {},
                onView: (record) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
