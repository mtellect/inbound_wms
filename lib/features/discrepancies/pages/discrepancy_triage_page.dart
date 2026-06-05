import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/discrepancies/models/discrepancy.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';

@RoutePage()
class DiscrepancyTriagePage extends StatefulWidget {
  const DiscrepancyTriagePage({super.key});

  @override
  State<DiscrepancyTriagePage> createState() => _DiscrepancyTriagePageState();
}

class _DiscrepancyTriagePageState extends State<DiscrepancyTriagePage> {
  final List<Discrepancy> _discrepancies = [
    Discrepancy(id: '1', poId: 'PO-2024-001', productId: 'SKU-001', expectedQty: 100, actualQty: 95, reason: 'Shortage', status: 'open', createdAt: DateTime.now().subtract(const Duration(hours: 2))),
    Discrepancy(id: '2', poId: 'PO-2024-002', productId: 'SKU-002', expectedQty: 50, actualQty: 52, reason: 'Overage', status: 'investigating', createdAt: DateTime.now().subtract(const Duration(days: 1))),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    _resource = AdminResource(
      key: 'discrepancies',
      tableName: 'Discrepancy Triage',
      subtitle: 'Resolve overages, shortages, and damages from inbound shipments.',
      singularName: 'Discrepancy',
      columns: const [
        AdminColumn(key: 'poId', label: 'PO / Ref', flex: 2),
        AdminColumn(key: 'productId', label: 'SKU', flex: 2),
        AdminColumn(key: 'variance', label: 'Variance', flex: 1),
        AdminColumn(key: 'reason', label: 'Reason', flex: 2),
        AdminColumn(key: 'status', label: 'Status', flex: 2, type: AdminColumnType.pill),
      ],
      headerActions: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.filter_list),
          label: const Text('Filter'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final records = _discrepancies.map((d) {
      final variance = d.actualQty - d.expectedQty;

      return TableRowData<String>(
        id: d.id,
        uid: d.id,
        cells: {
          'poId': TableCellData(value: d.poId),
          'productId': TableCellData(value: d.productId),
          'variance': TableCellData(
            value: variance > 0 ? '+$variance' : '$variance',
          ),
          'reason': TableCellData(value: d.reason),
          'status': TableCellData(
            value: d.status, 
            type: AdminColumnType.pill,
          ),
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
                onView: (record) {},
                onEdit: (record) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
