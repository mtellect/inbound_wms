import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/discrepancies/models/discrepancy.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discrepancy Triage'),
        actions: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.filter_list),
            label: const Text('Filter'),
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
                  DataColumn(label: Text('PO / SKU')),
                  DataColumn(label: Text('Expected')),
                  DataColumn(label: Text('Actual')),
                  DataColumn(label: Text('Variance')),
                  DataColumn(label: Text('Reason')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: _discrepancies.map((disc) {
                  final variance = disc.actualQty - disc.expectedQty;
                  
                  return DataRow(
                    cells: [
                      DataCell(Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(disc.poId, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                          Text(disc.productId, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                        ],
                      )),
                      DataCell(Text(disc.expectedQty.toString())),
                      DataCell(Text(disc.actualQty.toString(), style: const TextStyle(fontWeight: FontWeight.bold))),
                      DataCell(Text(
                        '${variance > 0 ? '+' : ''}$variance',
                        style: TextStyle(
                          color: variance > 0 ? Colors.blue : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      DataCell(Text(disc.reason)),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: disc.status == 'open' ? Colors.red.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            disc.status.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: disc.status == 'open' ? Colors.red[800] : Colors.orange[800],
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
                            child: const Text('Resolve'),
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
