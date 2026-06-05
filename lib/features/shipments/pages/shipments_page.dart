import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/shipments/models/shipment.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';

@RoutePage()
class ShipmentsPage extends StatefulWidget {
  const ShipmentsPage({super.key});

  @override
  State<ShipmentsPage> createState() => _ShipmentsPageState();
}

class _ShipmentsPageState extends State<ShipmentsPage> {
  final List<Shipment> _shipments = [
    Shipment(id: '1', trackingNumber: 'SHP-998811', poId: 'PO-2024-001', carrierName: 'FedEx', status: 'in_transit', arrivalTime: DateTime.now().add(const Duration(days: 1))),
    Shipment(id: '2', trackingNumber: 'SHP-998822', poId: 'PO-2024-002', carrierName: 'UPS', status: 'arrived', arrivalTime: DateTime.now()),
    Shipment(id: '3', trackingNumber: 'SHP-998833', poId: 'PO-2024-003', carrierName: 'DHL', status: 'receiving', arrivalTime: DateTime.now().subtract(const Duration(hours: 2))),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    _resource = AdminResource(
      key: 'shipments',
      tableName: 'Shipments',
      subtitle: 'Track physical shipments arriving at the dock.',
      singularName: 'Shipment',
      columns: const [
        AdminColumn(key: 'shipmentId', label: 'Shipment ID', flex: 2),
        AdminColumn(key: 'poId', label: 'Linked PO', flex: 2),
        AdminColumn(key: 'carrier', label: 'Carrier', flex: 2),
        AdminColumn(key: 'date', label: 'Est. Arrival', flex: 2),
        AdminColumn(key: 'status', label: 'Status', flex: 2, type: AdminColumnType.pill),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final records = _shipments.map((s) {
      return TableRowData<String>(
        id: s.id,
        uid: s.id,
        cells: {
          'shipmentId': TableCellData(value: s.trackingNumber ?? '-'),
          'poId': TableCellData(value: s.poId),
          'carrier': TableCellData(value: s.carrierName ?? '-'),
          'date': TableCellData(value: s.arrivalTime?.toIso8601String().split('T')[0] ?? '-'),
          'status': TableCellData(value: s.status, type: AdminColumnType.pill),
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
