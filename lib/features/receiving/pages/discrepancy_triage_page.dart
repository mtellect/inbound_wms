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
    const Discrepancy(id: '1', poId: 'PO-2024-001', productId: 'PROD-001', expectedQty: 100, actualQty: 95, reason: 'shortage', status: 'open'),
    const Discrepancy(id: '2', poId: 'PO-2024-002', productId: 'PROD-005', expectedQty: 50, actualQty: 55, reason: 'overage', status: 'investigating'),
    const Discrepancy(id: '3', poId: 'PO-2024-003', productId: 'PROD-008', expectedQty: 20, actualQty: 18, reason: 'damage', status: 'resolved'),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    _resource = AdminResource(
      key: 'triage',
      tableName: 'Discrepancy Triage',
      subtitle: 'Review and resolve receiving variances and damages.',
      singularName: 'Discrepancy',
      columns: const [
        AdminColumn(key: 'poId', label: 'PO', flex: 1),
        AdminColumn(key: 'sku', label: 'SKU', flex: 2),
        AdminColumn(key: 'variance', label: 'Variance', flex: 1),
        AdminColumn(key: 'type', label: 'Type', flex: 2, type: AdminColumnType.pill),
        AdminColumn(key: 'status', label: 'Status', flex: 2, type: AdminColumnType.pill),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final records = _discrepancies.map((d) {
      final variance = d.actualQty - d.expectedQty;
      final varianceStr = variance > 0 ? '+$variance' : '$variance';
      
      return TableRowData<String>(
        id: d.id,
        uid: d.id,
        cells: {
          'poId': TableCellData(value: d.poId),
          'sku': TableCellData(value: d.productId),
          'variance': TableCellData(value: varianceStr),
          'type': TableCellData(value: d.reason, type: AdminColumnType.pill),
          'status': TableCellData(value: d.status, type: AdminColumnType.pill),
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
