import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/table/app_table_view.dart';
import 'package:inbound_ms/core/widgets/table/table_resource.dart';
import 'package:inbound_ms/features/users/providers/user_provider.dart';
import 'package:inbound_ms/features/users/widgets/user_details_modal.dart';
import 'package:provider/provider.dart';


@RoutePage()
class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserProvider>().fetchUsers();
    });
  }

  final AdminResource _resource = AdminResource(
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
      AdminColumn(key: 'email', label: 'EMAIL', type: AdminColumnType.text, flex: 2),
      AdminColumn(key: 'role', label: 'ROLE', type: AdminColumnType.pill, flex: 2),
      AdminColumn(key: 'status', label: 'STATUS', type: AdminColumnType.pill, flex: 2),
      AdminColumn(key: 'lastLogin', label: 'LAST LOGIN', type: AdminColumnType.text, flex: 2),
    ],
  );

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          final records = provider.users.map((u) {
            return TableRowData<String>(
              id: u.id,
              uid: u.id,
              cells: {
                'user': TableCellData(value: u.displayName, subValue: u.role.displayName),
                'email': TableCellData(value: u.email),
                'role': TableCellData(value: u.role.name.toUpperCase(), type: AdminColumnType.pill),
                'status': TableCellData(value: u.status, type: AdminColumnType.pill),
                'lastLogin': TableCellData(value: u.lastLogin?.toString().split('.')[0] ?? 'Never'),
              },
            );
          }).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: AppTableView<String>(
                    resource: _resource,
                    records: records,
                    isLoading: provider.isLoading,
                    totalRecords: records.length,
                    onEdit: (record) {
                      final user = provider.users.firstWhere((u) => u.id == record.id);
                      showDialog(
                        context: context,
                        builder: (_) => UserDetailsModal(user: user),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
