import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/suppliers/models/supplier.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/core/widgets/app_data_table.dart';

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
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PageHeader(
            title: 'Suppliers Master',
            subtitle: 'Manage your vendors and supplier contacts.',
            actions: [
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add Supplier'),
              ),
            ],
          ),
          Expanded(
            child: AppDataTable(
              columns: const [
                AppDataColumn(label: 'Code', flex: 1),
                AppDataColumn(label: 'Name', flex: 2),
                AppDataColumn(label: 'Contact', flex: 2),
                AppDataColumn(label: 'Email', flex: 3),
                AppDataColumn(label: 'Actions', flex: 1),
              ],
              rows: _suppliers.map((s) {
                return AppDataRow(
                  id: s.id,
                  cells: [
                    Text(s.code, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                    Text(s.name, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    Text(s.contactName ?? '-', style: const TextStyle(fontSize: 14)),
                    Text(s.email ?? '-', style: const TextStyle(fontSize: 14)),
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
