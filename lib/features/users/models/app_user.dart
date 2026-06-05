import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inbound_ms/features/auth/models/user_role.dart';

part 'app_user.freezed.dart';

@freezed
abstract class AppUser with _$AppUser {
  const factory AppUser({
    required String id,
    required String email,
    required String displayName,
    required UserRole role,
    required String status,
    DateTime? lastLogin,
  }) = _AppUser;
}
