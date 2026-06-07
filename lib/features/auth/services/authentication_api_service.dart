import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/auth/models/user_role.dart';
import 'i_authentication_api_service.dart';

class AuthenticationApiService implements IAuthenticationApiService {
  final SupabaseClient _supabaseClient;

  AuthenticationApiService({required this._supabaseClient});

  @override
  Future<void> signIn({required String email, required String password}) async {
    await _supabaseClient.auth.signInWithPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  @override
  bool get isAuthenticated => _supabaseClient.auth.currentUser != null;

  @override
  String? get currentUserId => _supabaseClient.auth.currentUser?.id;

  @override
  String? get currentUserEmail => _supabaseClient.auth.currentUser?.email;

  @override
  UserRole? get currentUserRole {
    // Assuming role is stored in user metadata or a separate users table
    final user = _supabaseClient.auth.currentUser;
    if (user == null) return null;

    final roleStr = user.userMetadata?['role'] as String? ?? 'worker';
    return UserRole.values.firstWhere((e) => e.name == roleStr, orElse: () => UserRole.worker);
  }
}
