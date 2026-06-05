import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/core/widgets/app_dropdown_button.dart';
import 'package:inbound_ms/features/auth/models/user_role.dart';
import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/features/users/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class UserDetailsModal extends StatefulWidget {
  final AppUser user;

  const UserDetailsModal({super.key, required this.user});

  @override
  State<UserDetailsModal> createState() => _UserDetailsModalState();
}

class _UserDetailsModalState extends State<UserDetailsModal> {
  late UserRole _selectedRole;
  late String _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.user.role;
    _selectedStatus = widget.user.status;
  }

  void _save() {
    final provider = context.read<UserProvider>();
    if (_selectedRole != widget.user.role) {
      provider.updateUserRole(widget.user.id, _selectedRole.name);
    }
    if (_selectedStatus != widget.user.status) {
      provider.updateUserStatus(widget.user.id, _selectedStatus);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(48),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: AppColors.backgroundLight,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('User Details',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: AppColors.textPrimaryLight)),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textSecondaryLight),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Display Name: ${widget.user.displayName}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 8),
              Text('Email: ${widget.user.email}', style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 24),
              const Text('Role', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppDropDownButton<UserRole>(
                value: _selectedRole,
                items: UserRole.values.map((r) => DropdownItem<UserRole>(
                  value: r,
                  child: Text(r.displayName),
                )).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedRole = val);
                },
                hint: const Text('Select Role'),
              ),
              const SizedBox(height: 24),
              const Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppDropDownButton<String>(
                value: _selectedStatus,
                items: ['active', 'inactive', 'offline'].map((s) => DropdownItem<String>(
                  value: s,
                  child: Text(s.toUpperCase()),
                )).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedStatus = val);
                },
                hint: const Text('Select Status'),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: AppColors.textPrimaryDark,
                    ),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
