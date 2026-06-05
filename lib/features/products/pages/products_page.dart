import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/products/models/product.dart';

@RoutePage()
class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  final List<Product> _products = [
    const Product(id: '1', sku: 'SKU-001', name: 'Widget A', category: 'Widgets', requiresLot: true),
    const Product(id: '2', sku: 'SKU-002', name: 'Gadget B', category: 'Gadgets', requiresSerial: true),
    const Product(id: '3', sku: 'SKU-003', name: 'Thing C', category: 'Things'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Master'),
        actions: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.upload_file),
            label: const Text('Import CSV'),
          ),
          const SizedBox(width: 8),
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Product'),
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
                  DataColumn(label: Text('SKU')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Category')),
                  DataColumn(label: Text('Tracking')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: _products.map((p) {
                  final tracking = [
                    if (p.requiresLot) 'Lot',
                    if (p.requiresSerial) 'Serial',
                    if (p.requiresExpiry) 'Expiry'
                  ].join(', ');
                  
                  return DataRow(
                    cells: [
                      DataCell(Text(p.sku)),
                      DataCell(Text(p.name)),
                      DataCell(Text(p.category ?? '-')),
                      DataCell(Text(tracking.isEmpty ? 'None' : tracking)),
                      DataCell(Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_outlined, size: 20),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
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
