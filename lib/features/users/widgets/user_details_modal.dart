import 'package:flutter/material.dart';
import 'package:inbound_ms/core/resources/app_colors.dart';
import 'package:inbound_ms/core/utils/toast_utils.dart';
import 'package:inbound_ms/core/widgets/app_button.dart';
import 'package:inbound_ms/core/widgets/app_dropdown_button.dart';
import 'package:inbound_ms/core/widgets/app_input_field.dart';
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
  bool _isLoading = false;

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

  Future<void> _save() async {
    setState(() => _isLoading = true);
    final provider = context.read<UserProvider>();
    try {
      if (widget.user == null) {
        await provider.createUser(
          email: _emailController.text,
          password: _passwordController.text,
          displayName: _nameController.text,
          role: _selectedRole.name,
          status: _selectedStatus,
          requiresPasswordReset: _requiresPasswordReset,
        );
      } else {
        if (_selectedRole != widget.user!.role) {
          await provider.updateUserRole(widget.user!.id, _selectedRole.name);
        }
        if (_selectedStatus != widget.user!.status) {
          await provider.updateUserStatus(widget.user!.id, _selectedStatus);
        }
      }
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      if (mounted) {
        ToastUtils.showError(context, message: e.toString());
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
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
                  Text(
                    widget.user == null ? 'Add User' : 'User Details',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textSecondaryLight),
                    onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              AppInputField(
                controller: _nameController,
                labelText: 'Display Name',
                hintText: 'Enter full name',
              ),
              const SizedBox(height: 16),
              AppInputField(
                controller: _emailController,
                labelText: 'Email Address',
                hintText: 'Enter email address',
                enabled: widget.user == null,
              ),
              const SizedBox(height: 16),
              if (widget.user == null) ...[
                AppInputField(
                  controller: _passwordController,
                  labelText: 'Temporary Password',
                  hintText: 'Enter password',
                ),
                const SizedBox(height: 16),
              ],
              const Text('Role', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              AppDropDownButton<UserRole>(
                value: _selectedRole,
                items: UserRole.values
                    .map((r) => DropdownItem<UserRole>(value: r, child: Text(r.displayName)))
                    .toList(),
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
                items: [
                  'active',
                  'inactive',
                  'offline',
                ].map((s) => DropdownItem<String>(value: s, child: Text(s.toUpperCase()))).toList(),
                onChanged: (val) {
                  if (val != null) setState(() => _selectedStatus = val);
                },
                hint: const Text('Select Status'),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Requires Password Reset',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                    onPressed: _isLoading ? null : () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 16),
                  AppButton(
                    label: 'Save Changes',
                    onPressed: _save,
                    isLoading: _isLoading,
                    backgroundColor: AppColors.primary,
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
