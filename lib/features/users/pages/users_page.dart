import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/features/auth/models/user_role.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';


@RoutePage()
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final List<AppUser> _users = [
    AppUser(id: '1', username: 'manager', displayName: 'System Manager', role: UserRole.manager, status: 'active', lastLogin: DateTime.now().subtract(const Duration(minutes: 5))),
    AppUser(id: '2', username: 'jdoe', displayName: 'John Doe', role: UserRole.staff, status: 'active', lastLogin: DateTime.now().subtract(const Duration(hours: 2))),
    AppUser(id: '3', username: 'msmith', displayName: 'Mary Smith', role: UserRole.staff, status: 'offline', lastLogin: DateTime.now().subtract(const Duration(days: 1))),
  ];

 

  @override
  Widget build(BuildContext context) {
    final records = _users.map((u) {
      return TableRowData<String>(
        id: u.id,
        uid: u.id,
        cells: {
          'user': TableCellData(value: u.displayName, subValue: u.role.displayName),
          'username': TableCellData(value: '@${u.username}'),
          'role': TableCellData(value: u.role.name.toUpperCase(), type: AdminColumnType.pill),
          'status': TableCellData(value: u.status, type: AdminColumnType.pill),
          'lastLogin': TableCellData(value: u.lastLogin?.toString().split('.')[0] ?? 'Never'),
        },
      );
    }).toList();

    final resource = AdminResource(
      key: 'users',
      tableName: 'Team Management',
      subtitle: 'Manage staff accounts, roles, and system access.',
      headerActions: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Add User'),
        ),
      ],
      columns: const [
        AdminColumn(key: 'user', label: 'USER', type: AdminColumnType.imageText, flex: 3),
        AdminColumn(key: 'username', label: 'USERNAME', type: AdminColumnType.text, flex: 2),
        AdminColumn(key: 'role', label: 'ROLE', type: AdminColumnType.pill, flex: 2),
        AdminColumn(key: 'status', label: 'STATUS', type: AdminColumnType.pill, flex: 2),
        AdminColumn(key: 'lastLogin', label: 'LAST LOGIN', type: AdminColumnType.text, flex: 2),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: AppTableView<String>(
                resource: resource,
                records: records,
                isLoading: false,
                totalRecords: records.length,
                onEdit: (record) {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
