import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';

@RoutePage()
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final List<AppUser> _users = [
    AppUser(id: '1', username: 'manager', displayName: 'System Manager', role: 'manager', status: 'active', lastLogin: DateTime.now().subtract(const Duration(minutes: 5))),
    AppUser(id: '2', username: 'jdoe', displayName: 'John Doe', role: 'staff', status: 'active', lastLogin: DateTime.now().subtract(const Duration(hours: 2))),
    AppUser(id: '3', username: 'msmith', displayName: 'Mary Smith', role: 'staff', status: 'offline', lastLogin: DateTime.now().subtract(const Duration(days: 1))),
  ];

  late final AdminResource _resource;

  @override
  void initState() {
    super.initState();
    _resource = AdminResource(
      key: 'users',
      tableName: 'Users',
      columns: [
        AdminColumn(key: 'user', label: 'USER', type: AdminColumnType.imageText, flex: 3),
        AdminColumn(key: 'username', label: 'USERNAME', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'role', label: 'ROLE', type: AdminColumnType.pill, flex: 2),
        AdminColumn(key: 'status', label: 'STATUS', type: AdminColumnType.pill, flex: 2),
        AdminColumn(key: 'lastLogin', label: 'LAST LOGIN', type: AdminColumnType.text, flex: 2),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final records = _users.map((u) {
      return TableRowData<String>(
        id: u.id,
        uid: u.id,
        cells: {
          'user': TableCellData(value: u.displayName, subValue: u.role),
          'username': TableCellData(value: '@${u.username}'),
          'role': TableCellData(value: u.role.toUpperCase(), type: AdminColumnType.pill),
          'status': TableCellData(value: u.status, type: AdminColumnType.pill),
          'lastLogin': TableCellData(value: u.lastLogin?.toString().split('.')[0] ?? 'Never'),
        },
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PageHeader(
            title: 'Team Management',
            subtitle: 'Manage staff accounts, roles, and system access.',
            actions: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Add User'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: AppTableView<String>(
              resource: _resource,
              records: records,
              isLoading: false,
              totalRecords: records.length,
              onEdit: (record) {},
            ),
          ),
        ],
      ),
    );
  }
}
