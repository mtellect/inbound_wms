import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/products/models/product.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';

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

  final AdminResource _resource = const AdminResource(
    key: 'products',
    tableName: 'Products',
    singularName: 'Product',
    columns: [
      AdminColumn(key: 'sku', label: 'SKU', flex: 2),
      AdminColumn(key: 'name', label: 'Name', flex: 3),
      AdminColumn(key: 'category', label: 'Category', flex: 2),
      AdminColumn(key: 'tracking', label: 'Tracking', flex: 2, type: AdminColumnType.pill),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final records = _products.map((p) {
      final tracking = [
        if (p.requiresLot) 'Lot',
        if (p.requiresSerial) 'Serial',
        if (p.requiresExpiry) 'Expiry'
      ].join(', ');

      return TableRowData<String>(
        id: p.id,
        uid: p.id,
        cells: {
          'sku': TableCellData(value: p.sku),
          'name': TableCellData(value: p.name),
          'category': TableCellData(value: p.category ?? '-'),
          'tracking': TableCellData(
            value: tracking.isEmpty ? 'None' : tracking,
            type: AdminColumnType.pill,
          ),
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
