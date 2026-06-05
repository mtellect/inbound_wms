import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/products/models/product.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/core/widgets/app_data_table.dart';

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
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            title: 'Products Master',
            subtitle: 'Manage your product catalog and tracking requirements.',
            actions: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.upload_file),
                label: const Text('Import CSV'),
              ),
              const SizedBox(width: 12),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Product'),
              ),
            ],
          ),
          Expanded(
            child: AppDataTable(
              columns: const [
                AppDataColumn(label: 'SKU', flex: 2),
                AppDataColumn(label: 'Name', flex: 3),
                AppDataColumn(label: 'Category', flex: 2),
                AppDataColumn(label: 'Tracking', flex: 2),
                AppDataColumn(label: 'Actions', flex: 1),
              ],
              rows: _products.map((p) {
                final tracking = [
                  if (p.requiresLot) 'Lot',
                  if (p.requiresSerial) 'Serial',
                  if (p.requiresExpiry) 'Expiry'
                ].join(', ');
                
                return AppDataRow(
                  id: p.id,
                  cells: [
                    Text(p.sku, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    Text(p.name, style: const TextStyle(fontSize: 14)),
                    Text(p.category ?? '-', style: const TextStyle(fontSize: 14)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: tracking.isEmpty ? Colors.grey.withValues(alpha: 0.1) : Colors.blue.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tracking.isEmpty ? 'None' : tracking,
                        style: TextStyle(
                          fontSize: 12,
                          color: tracking.isEmpty ? Colors.grey[700] : Colors.blue[700],
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_outlined, size: 20, color: Colors.grey[600]),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete_outline, size: 20, color: Colors.red),
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
