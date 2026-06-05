import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue('manager')
  manager,
  @JsonValue('staff')
  staff,
  @JsonValue('admin')
  admin,
  @JsonValue('superAdmin')
  superAdmin;

  String get displayName {
    switch (this) {
      case UserRole.manager:
        return 'Manager';
      case UserRole.staff:
        return 'Staff';
      case UserRole.admin:
        return 'Admin';
      case UserRole.superAdmin:
        return 'Super Admin';
    }
  }
}
