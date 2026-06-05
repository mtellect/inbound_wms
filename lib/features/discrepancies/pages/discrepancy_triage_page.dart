import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/discrepancies/models/discrepancy.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/core/widgets/app_data_table.dart';

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
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            title: 'Discrepancy Triage',
            subtitle: 'Resolve overages, shortages, and damages from inbound shipments.',
            actions: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.filter_list),
                label: const Text('Filter'),
              ),
            ],
          ),
          Expanded(
            child: AppDataTable(
              columns: const [
                AppDataColumn(label: 'PO / Ref', flex: 2),
                AppDataColumn(label: 'SKU', flex: 2),
                AppDataColumn(label: 'Variance', flex: 1),
                AppDataColumn(label: 'Reason', flex: 2),
                AppDataColumn(label: 'Status', flex: 2),
                AppDataColumn(label: 'Actions', flex: 2),
              ],
              rows: _discrepancies.map((d) {
                return AppDataRow(
                  id: d.id,
                  cells: [
                    Text(d.poId, style: TextStyle(color: Colors.grey[600], fontSize: 14, fontWeight: FontWeight.w600)),
                    Text(d.productId, style: const TextStyle(fontSize: 14)),
                    Text(
                      '${d.actualQty - d.expectedQty}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: (d.actualQty - d.expectedQty) > 0 ? Colors.green[700] : Colors.red[700],
                      ),
                    ),
                    Text(d.reason, style: const TextStyle(fontSize: 14)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: d.status == 'unresolved' ? Colors.red.withValues(alpha: 0.1) : Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        d.status.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: d.status == 'unresolved' ? Colors.red[800] : Colors.blue[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FilledButton.tonal(
                          onPressed: () {},
                          child: const Text('Triage'),
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
