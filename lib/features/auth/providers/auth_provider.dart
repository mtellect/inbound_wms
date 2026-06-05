import 'package:flutter/foundation.dart';
import 'package:inbound_ms/features/auth/services/i_authentication_api_service.dart';

class AuthProvider extends ChangeNotifier {
  final IAuthenticationApiService _authService;

  AuthProvider(this._authService);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get isAuthenticated => _authService.isAuthenticated;
  String? get role => _authService.currentUserRole;

  Future<void> signIn(String email, String password) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _authService.signIn(email: email, password: password);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
    notifyListeners();
  }
}
