import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';
import 'package:inbound_ms/features/receiving/providers/session_provider.dart';
import 'package:inbound_ms/features/receiving/widgets/session_details_modal.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/receiving/utils/time_utils.dart';

@RoutePage()
class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SessionProvider>().fetchSessions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final resource = AdminResource(
      key: 'sessions',
      tableName: 'Scan Sessions',
      subtitle: 'View active and historical receiving sessions.',
      columns: const [
        AdminColumn(key: 'session', label: 'SESSION ID', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'started', label: 'STARTED', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'shipment', label: 'SHIPMENT', type: AdminColumnType.imageText, flex: 3),
        AdminColumn(key: 'operator', label: 'OPERATOR', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'progress', label: 'PROGRESS', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'discrepancy', label: 'ERRORS', type: AdminColumnType.text, flex: 1),
        AdminColumn(key: 'status', label: 'STATUS', type: AdminColumnType.pill, flex: 2),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<SessionProvider>(
        builder: (context, provider, child) {
          final records = provider.sessions.map((s) {
            return TableRowData<String>(
              id: s.id,
              uid: s.id,
              cells: {
                'session': TableCellData(value: s.sessionNumber),
                'started': TableCellData(value: formatSessionTime(s.startTime)),
                'shipment': TableCellData(value: s.shipmentId ?? 'N/A', subValue: s.supplierName),
                'operator': TableCellData(value: '@${s.operatorName}'),
                'progress': TableCellData(value: '${s.totalScanned} / ${s.totalExpected}'),
                'discrepancy': TableCellData(value: s.discrepancies.toString()),
                'status': TableCellData(value: s.status, type: AdminColumnType.pill),
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
                    resource: resource,
                    records: records,
                    isLoading: provider.isLoading,
                    totalRecords: records.length,
                    onView: (record) {
                      final session = provider.sessions.firstWhere((s) => s.id == record.id);
                      showDialog(
                        context: context,
                        builder: (_) => SessionDetailsModal(session: session),
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
