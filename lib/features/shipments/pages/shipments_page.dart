import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/shipments/models/shipment.dart';

@RoutePage()
class ShipmentsPage extends StatefulWidget {
  const ShipmentsPage({super.key});

  @override
  State<ShipmentsPage> createState() => _ShipmentsPageState();
}

class _ShipmentsPageState extends State<ShipmentsPage> {
  final List<Shipment> _shipments = [
    Shipment(id: '1', poId: 'PO-2024-001', carrierName: 'FedEx', trackingNumber: 'FX123456789', dockDoor: 'Door 1', status: 'expected', arrivalTime: DateTime.now().add(const Duration(hours: 4))),
    Shipment(id: '2', poId: 'PO-2024-002', carrierName: 'UPS', trackingNumber: '1Z9999999999999999', dockDoor: 'Door 3', status: 'arrived', arrivalTime: DateTime.now().subtract(const Duration(hours: 1))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbound Shipments'),
        actions: [
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Schedule Shipment'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Tracking / ASN')),
                  DataColumn(label: Text('PO Number')),
                  DataColumn(label: Text('Carrier')),
                  DataColumn(label: Text('ETA / Arrival')),
                  DataColumn(label: Text('Dock Door')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: _shipments.map((ship) {
                  return DataRow(
                    cells: [
                      DataCell(Text(ship.trackingNumber ?? '-', style: const TextStyle(fontWeight: FontWeight.bold))),
                      DataCell(Text(ship.poId)),
                      DataCell(Text(ship.carrierName ?? '-')),
                      DataCell(Text(ship.arrivalTime != null ? '${ship.arrivalTime!.hour}:${ship.arrivalTime!.minute.toString().padLeft(2, '0')}' : '-')),
                      DataCell(Text(ship.dockDoor ?? '-')),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: ship.status == 'arrived' ? Colors.blue.withValues(alpha: 0.1) : Colors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            ship.status.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: ship.status == 'arrived' ? Colors.blue[800] : Colors.grey[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataCell(Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FilledButton.tonal(
                            onPressed: () {},
                            child: const Text('Receive'),
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
