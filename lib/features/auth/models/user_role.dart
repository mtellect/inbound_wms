import 'package:json_annotation/json_annotation.dart';

enum UserRole {
  @JsonValue('manager')
  manager,
  @JsonValue('supervisor')
  supervisor,
  @JsonValue('worker')
  worker;

  String get displayName {
    switch (this) {
      case UserRole.manager:
        return 'Manager';
      case UserRole.supervisor:
        return 'Supervisor';
      case UserRole.worker:
        return 'Worker';
    }
  }
}
