import 'package:flutter/foundation.dart';
import 'package:inbound_ms/features/auth/services/i_authentication_api_service.dart';
import 'package:inbound_ms/features/auth/models/user_role.dart';

class AuthProvider extends ChangeNotifier {
  final IAuthenticationApiService _authenticationApiService;

  AuthProvider({required this._authenticationApiService});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get isAuthenticated => _authenticationApiService.isAuthenticated;
  UserRole? get role => _authenticationApiService.currentUserRole;
  bool get isManager => [UserRole.manager, UserRole.supervisor].contains(role);

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authenticationApiService.signIn(email: email, password: password);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authenticationApiService.signOut();
    notifyListeners();
  }
}
