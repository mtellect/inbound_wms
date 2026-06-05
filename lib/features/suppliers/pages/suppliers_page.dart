import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/suppliers/models/supplier.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
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
    const Supplier(id: '1', code: 'SUP-001', name: 'Acme Corp', contactName: 'John Doe', email: 'john@acme.com'),
    const Supplier(id: '2', code: 'SUP-002', name: 'Global Tech', contactName: 'Jane Smith', email: 'jane@globaltech.com'),
  ];

  final AdminResource _resource = const AdminResource(
    key: 'suppliers',
    tableName: 'Suppliers Master',
    singularName: 'Supplier',
    columns: [
      AdminColumn(key: 'code', label: 'Code', flex: 1),
      AdminColumn(key: 'name', label: 'Name', flex: 2),
      AdminColumn(key: 'contact', label: 'Contact', flex: 2),
      AdminColumn(key: 'email', label: 'Email', flex: 2),
    ],
  );

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
