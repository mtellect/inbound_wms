import 'package:inbound_ms/features/users/models/app_user.dart';

abstract class IUserApiService {
  Future<List<AppUser>> fetchAllUsers();
  Future<void> updateUserStatus(String userId, String status);
  Future<void> updateUserRole(String userId, String role);
}
