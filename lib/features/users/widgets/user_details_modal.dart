import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/core/widgets/app_dropdown_button.dart';
import 'package:inbound_ms/features/auth/models/user_role.dart';
import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/features/users/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class UserDetailsModal extends StatefulWidget {
  final AppUser? user;

  const UserDetailsModal({super.key, this.user});

  @override
  State<UserDetailsModal> createState() => _UserDetailsModalState();
}

class _UserDetailsModalState extends State<UserDetailsModal> {
  late UserRole _selectedRole;
  late String _selectedStatus;
  late bool _requiresPasswordReset;
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _selectedRole = widget.user?.role ?? UserRole.worker;
    _selectedStatus = widget.user?.status ?? 'active';
    _requiresPasswordReset = widget.user?.requiresPasswordReset ?? true;
    _emailController = TextEditingController(text: widget.user?.email ?? '');
    _nameController = TextEditingController(text: widget.user?.displayName ?? '');
    _passwordController = TextEditingController(text: widget.user == null ? 'Temp2026!' : '');
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _save() {
    final provider = context.read<UserProvider>();
    if (widget.user == null) {
      provider.createUser(
        email: _emailController.text,
        password: _passwordController.text,
        displayName: _nameController.text,
        role: _selectedRole.name,
        status: _selectedStatus,
        requiresPasswordReset: _requiresPasswordReset,
      );
    } else {
      if (_selectedRole != widget.user!.role) {
        provider.updateUserRole(widget.user!.id, _selectedRole.name);
      }
      if (_selectedStatus != widget.user!.status) {
        provider.updateUserStatus(widget.user!.id, _selectedStatus);
      }
      // Also potentially update display name if changed
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
                  Text(widget.user == null ? 'Add User' : 'User Details',
                      style: const TextStyle(
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
              const Text('Display Name', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Enter full name',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),
              const Text('Email Address', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emailController,
                enabled: widget.user == null,
                decoration: InputDecoration(
                  hintText: 'Enter email address',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              const SizedBox(height: 16),
              if (widget.user == null) ...[
                const Text('Temporary Password', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 16),
              ],
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
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Requires Password Reset', style: TextStyle(fontWeight: FontWeight.bold)),
                  Switch(
                    value: _requiresPasswordReset,
                    onChanged: (val) => setState(() => _requiresPasswordReset = val),
                    activeColor: AppColors.primary,
                  ),
                ],
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
