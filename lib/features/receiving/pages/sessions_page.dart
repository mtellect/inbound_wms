import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/receiving/models/scan_session.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';

@RoutePage()
class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  final List<ScanSession> _sessions = [
    ScanSession(id: 'SES-001', shipmentId: 'SHP-12001', supplierName: 'Acme Corp Electronics', operatorId: 'jdoe', totalUnitsExpected: 150, totalUnitsScanned: 150, discrepancies: 0, startTime: DateTime.now().subtract(const Duration(hours: 4)), endTime: DateTime.now().subtract(const Duration(hours: 3)), status: 'completed'),
    ScanSession(id: 'SES-002', shipmentId: 'SHP-12002', supplierName: 'Global Tech Imports', operatorId: 'msmith', totalUnitsExpected: 50, totalUnitsScanned: 48, discrepancies: 2, startTime: DateTime.now().subtract(const Duration(hours: 2)), endTime: DateTime.now().subtract(const Duration(hours: 1)), status: 'completed_with_errors'),
    ScanSession(id: 'SES-003', shipmentId: 'SHP-12003', supplierName: 'Apex Furniture Co', operatorId: 'manager', totalUnitsExpected: 12, totalUnitsScanned: 5, discrepancies: 0, startTime: DateTime.now().subtract(const Duration(minutes: 15)), status: 'active'),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    _resource = AdminResource(
      key: 'sessions',
      tableName: 'Sessions',
      columns: [
        AdminColumn(key: 'session', label: 'SESSION ID', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'shipment', label: 'SHIPMENT', type: AdminColumnType.imageText, flex: 3),
        AdminColumn(key: 'operator', label: 'OPERATOR', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'progress', label: 'PROGRESS', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'discrepancy', label: 'ERRORS', type: AdminColumnType.text, flex: 1),
        AdminColumn(key: 'status', label: 'STATUS', type: AdminColumnType.pill, flex: 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final records = _sessions.map((s) {
      return TableRowData<String>(
        id: s.id,
        uid: s.id,
        cells: {
          'session': TableCellData(value: s.id),
          'shipment': TableCellData(value: s.shipmentId, subValue: s.supplierName),
          'operator': TableCellData(value: '@${s.operatorId}'),
          'progress': TableCellData(value: '${s.totalUnitsScanned} / ${s.totalUnitsExpected}'),
          'discrepancy': TableCellData(value: s.discrepancies.toString()),
          'status': TableCellData(value: s.status, type: AdminColumnType.pill),
        },
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Scan Sessions',
            subtitle: 'View active and historical receiving sessions.',
            actions: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('New Scan'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: AppTableView<String>(
              resource: _resource,
              records: records,
              isLoading: false,
              totalRecords: records.length,
              onView: (record) {},
            ),
          ),
        ],
      ),
    );
  }
}
