import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/features/users/services/dto/app_user_dto.dart';
import 'package:inbound_ms/features/auth/models/user_role.dart';

class AppUserMapper {
  static AppUser fromDto(AppUserDto dto) {
    return AppUser(
      id: dto.id,
      email: dto.email,
      displayName: dto.displayName ?? dto.email,
      role: UserRole.values.firstWhere(
        (e) => e.name == dto.role,
        orElse: () => UserRole.worker,
      ),
      status: dto.status,
      lastLogin: dto.lastLogin,
      requiresPasswordReset: dto.requiresPasswordReset,
    );
  }

  static AppUserDto toDto(AppUser user) {
    return AppUserDto(
      id: user.id,
      email: user.email,
      displayName: user.displayName,
      role: user.role.name,
      status: user.status,
      lastLogin: user.lastLogin,
      requiresPasswordReset: user.requiresPasswordReset,
    );
  }
}
