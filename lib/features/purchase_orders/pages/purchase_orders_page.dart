import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/widgets/po_import_view.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/core/widgets/app_data_table.dart';

@RoutePage()
class PurchaseOrdersPage extends StatefulWidget {
  const PurchaseOrdersPage({super.key});

  @override
  State<PurchaseOrdersPage> createState() => _PurchaseOrdersPageState();
}

class _PurchaseOrdersPageState extends State<PurchaseOrdersPage> {
  final List<PurchaseOrder> _pos = [
    PurchaseOrder(id: '1', poNumber: 'PO-2024-001', supplierId: 'Global Tech', status: 'pending', createdAt: DateTime.now().subtract(const Duration(days: 2))),
    PurchaseOrder(id: '2', poNumber: 'PO-2024-002', supplierId: 'Acme Corp', status: 'received', blindReceiving: true, createdAt: DateTime.now().subtract(const Duration(days: 5))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            title: 'Purchase Orders',
            subtitle: 'Track incoming purchase orders and their receiving status.',
            actions: [
              OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const POImportView(),
                  );
                },
                icon: const Icon(Icons.file_upload),
                label: const Text('Import CSV / EDI'),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Create PO'),
              ),
            ],
          ),
          Expanded(
            child: AppDataTable(
              columns: const [
                AppDataColumn(label: 'PO Number', flex: 2),
                AppDataColumn(label: 'Supplier', flex: 2),
                AppDataColumn(label: 'Status', flex: 2),
                AppDataColumn(label: 'Blind Receiving', flex: 2),
                AppDataColumn(label: 'Date Created', flex: 2),
                AppDataColumn(label: 'Actions', flex: 2),
              ],
              rows: _pos.map((po) {
                return AppDataRow(
                  id: po.id,
                  cells: [
                    Text(po.poNumber, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    Text(po.supplierId ?? '-', style: const TextStyle(fontSize: 14)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: po.status == 'pending' ? Colors.orange.withValues(alpha: 0.1) : Colors.green.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        po.status.toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          color: po.status == 'pending' ? Colors.orange[800] : Colors.green[800],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(po.blindReceiving ? 'Yes' : 'No', style: const TextStyle(fontSize: 14)),
                    Text('${po.createdAt?.toLocal() ?? '-'}'.split(' ')[0], style: const TextStyle(fontSize: 14)),
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
