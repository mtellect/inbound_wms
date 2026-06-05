import 'package:supabase_flutter/supabase_flutter.dart';
import 'i_authentication_api_service.dart';

class AuthenticationApiService implements IAuthenticationApiService {
  final SupabaseClient _supabaseClient;

  AuthenticationApiService(this._supabaseClient);

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
  String? get currentUserRole {
    // Assuming role is stored in user metadata or a separate users table
    // For simplicity, reading from user_metadata. Return 'worker' by default for safety.
    final user = _supabaseClient.auth.currentUser;
    if (user == null) return null;
    return user.userMetadata?['role'] as String? ?? 'worker';
  }
}
