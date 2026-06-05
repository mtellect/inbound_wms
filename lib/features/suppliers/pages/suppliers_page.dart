import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/suppliers/models/supplier.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';

@RoutePage()
class SuppliersPage extends StatefulWidget {
  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  final List<Supplier> _suppliers = [
    const Supplier(id: '1', code: 'SUP-001', name: 'Acme Corp Electronics', contactName: 'John Doe', email: 'john@acmecorp.com'),
    const Supplier(id: '2', code: 'SUP-002', name: 'Global Tech Imports', contactName: 'Jane Smith', email: 'jane@globaltech.com'),
    const Supplier(id: '3', code: 'SUP-003', name: 'Nature Valley Foods', contactName: 'Michael Chen', email: 'mchen@naturevalley.com'),
    const Supplier(id: '4', code: 'SUP-004', name: 'Apex Furniture Co', contactName: 'Sarah Williams', email: 'swilliams@apexfurniture.com'),
    const Supplier(id: '5', code: 'SUP-005', name: 'HealthPlus Supplements', contactName: 'David Miller', email: 'dmiller@healthplus.com'),
    const Supplier(id: '6', code: 'SUP-006', name: 'Stellar Accessories', contactName: 'Emily Davis', email: 'edavis@stellar.com'),
    const Supplier(id: '7', code: 'SUP-007', name: 'Quantum Computing Supplies', contactName: 'Robert Wilson', email: 'rwilson@quantum.com'),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    _resource = AdminResource(
      key: 'suppliers',
      tableName: 'Suppliers Master',
      subtitle: 'Manage your vendors and supplier contacts.',
      singularName: 'Supplier',
      columns: const [
        AdminColumn(key: 'code', label: 'Code', flex: 1),
        AdminColumn(key: 'name', label: 'Name', flex: 2),
        AdminColumn(key: 'contact', label: 'Contact', flex: 2),
        AdminColumn(key: 'email', label: 'Email', flex: 2),
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
    final records = _suppliers.map((s) {
      return TableRowData<String>(
        id: s.id,
        uid: s.id,
        cells: {
          'code': TableCellData(value: s.code),
          'name': TableCellData(value: s.name),
          'contact': TableCellData(value: s.contactName ?? '-'),
          'email': TableCellData(value: s.email ?? '-'),
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
