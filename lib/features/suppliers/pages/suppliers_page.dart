import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/suppliers/models/supplier.dart';

@RoutePage()
class SuppliersPage extends StatefulWidget {
  const SuppliersPage({super.key});

  @override
  State<SuppliersPage> createState() => _SuppliersPageState();
}

class _SuppliersPageState extends State<SuppliersPage> {
  final List<Supplier> _suppliers = [
    const Supplier(id: '1', code: 'SUP-001', name: 'Acme Corp', contactName: 'John Doe', email: 'john@acme.com', phone: '555-0101'),
    const Supplier(id: '2', code: 'SUP-002', name: 'Global Tech', contactName: 'Jane Smith', email: 'jane@globaltech.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suppliers Master'),
        actions: [
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Add Supplier'),
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
                  DataColumn(label: Text('Code')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Contact')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Phone')),
                  DataColumn(label: Text('Actions')),
                ],
                rows: _suppliers.map((s) {
                  return DataRow(
                    cells: [
                      DataCell(Text(s.code)),
                      DataCell(Text(s.name)),
                      DataCell(Text(s.contactName ?? '-')),
                      DataCell(Text(s.email ?? '-')),
                      DataCell(Text(s.phone ?? '-')),
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
