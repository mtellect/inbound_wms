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
    const Product(id: '1', sku: 'SKU-001', name: 'Premium Wireless Headphones', category: 'Electronics', requiresLot: false, requiresSerial: true),
    const Product(id: '2', sku: 'SKU-002', name: 'Ergonomic Office Chair', category: 'Furniture', requiresLot: false, requiresSerial: false),
    const Product(id: '3', sku: 'SKU-003', name: 'Organic Arabica Coffee Beans', category: 'Food & Bev', requiresLot: true, requiresExpiry: true),
    const Product(id: '4', sku: 'SKU-004', name: 'Mechanical Keyboard Switch Set', category: 'Electronics', requiresLot: true),
    const Product(id: '5', sku: 'SKU-005', name: 'Vitamin C Supplement', category: 'Health', requiresLot: true, requiresExpiry: true),
    const Product(id: '6', sku: 'SKU-006', name: 'Stainless Steel Water Bottle', category: 'Accessories'),
    const Product(id: '7', sku: 'SKU-007', name: 'Gaming Laptop RTX 4070', category: 'Electronics', requiresSerial: true),
    const Product(id: '8', sku: 'SKU-008', name: 'LED Desk Lamp', category: 'Furniture'),
    const Product(id: '9', sku: 'SKU-009', name: 'Protein Powder Vanilla', category: 'Health', requiresLot: true, requiresExpiry: true),
    const Product(id: '10', sku: 'SKU-010', name: 'Bluetooth Speaker Portable', category: 'Electronics', requiresSerial: true),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    _resource = AdminResource(
      key: 'products',
      tableName: 'Products Master',
      subtitle: 'Manage your product catalog and tracking requirements.',
      singularName: 'Product',
      columns: const [
        AdminColumn(key: 'sku', label: 'SKU', flex: 2),
        AdminColumn(key: 'name', label: 'Name', flex: 3),
        AdminColumn(key: 'category', label: 'Category', flex: 2),
        AdminColumn(key: 'tracking', label: 'Tracking', flex: 2, type: AdminColumnType.pill),
      ],
      headerActions: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.upload_file),
          label: const Text('Import CSV'),
        ),
      ],
    );
  }

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
