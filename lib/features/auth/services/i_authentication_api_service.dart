import 'package:inbound_ms/features/auth/models/user_role.dart';

abstract class IAuthenticationApiService {
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
  bool get isAuthenticated;
  UserRole? get currentUserRole;
}
