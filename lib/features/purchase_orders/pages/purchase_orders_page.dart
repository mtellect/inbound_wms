import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/widgets/po_import_view.dart';

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
      appBar: AppBar(
        title: const Text('Purchase Orders'),
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
          const SizedBox(width: 8),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Create PO'),
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
                  DataColumn(label: Text('PO Number')),
                  DataColumn(label: Text('Supplier')),
                  DataColumn(label: Text('Date Created')),
                  DataColumn(label: Text('Status')),
                  DataColumn(label: Text('Blind Recv')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: _pos.map((po) {
                  return DataRow(
                    cells: [
                      DataCell(Text(po.poNumber, style: const TextStyle(fontWeight: FontWeight.bold))),
                      DataCell(Text(po.supplierId ?? '-')),
                      DataCell(Text('${po.createdAt?.year}-${po.createdAt?.month.toString().padLeft(2, '0')}-${po.createdAt?.day.toString().padLeft(2, '0')}')),
                      DataCell(
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: po.status == 'received' ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            po.status.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: po.status == 'received' ? Colors.green[800] : Colors.orange[800],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      DataCell(Icon(
                        po.blindReceiving ? Icons.visibility_off : Icons.visibility,
                        size: 20,
                        color: po.blindReceiving ? Colors.blue : Colors.grey,
                      )),
                      DataCell(Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_red_eye_outlined, size: 20),
                            tooltip: 'View Details',
                            onPressed: () {},
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
