import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/shipments/models/shipment.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/core/widgets/app_data_table.dart';

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
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            title: 'Inbound Shipments',
            subtitle: 'Track incoming deliveries, ASNs, and dock schedules.',
            actions: [
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Schedule Shipment'),
              ),
            ],
          ),
          Expanded(
            child: AppDataTable(
              columns: const [
                AppDataColumn(label: 'Tracking', flex: 2),
                AppDataColumn(label: 'Carrier', flex: 2),
                AppDataColumn(label: 'PO / ASN', flex: 2),
                AppDataColumn(label: 'Status', flex: 2),
                AppDataColumn(label: 'ETA', flex: 2),
                AppDataColumn(label: 'Dock Door', flex: 2),
                AppDataColumn(label: 'Actions', flex: 2),
              ],
              rows: _shipments.map((s) {
                return AppDataRow(
                  id: s.id,
                  cells: [
                    Text(s.trackingNumber ?? '-', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    Text(s.carrierName ?? '-', style: const TextStyle(fontSize: 14)),
                    Text(s.poId, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: s.status == 'in_transit' ? Colors.blue.withValues(alpha: 0.1) : Colors.purple.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        s.status.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: s.status == 'in_transit' ? Colors.blue[800] : Colors.purple[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text('${s.arrivalTime?.toLocal() ?? '-'}'.split(' ')[0], style: const TextStyle(fontSize: 14)),
                    Text(s.dockDoor ?? '-', style: const TextStyle(fontSize: 14)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FilledButton.tonal(
                          onPressed: () {},
                          child: const Text('Process'),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: Icon(Icons.more_vert, size: 20, color: Colors.grey[600]),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
