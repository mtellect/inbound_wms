import 'package:flutter/foundation.dart';
import 'package:inbound_ms/features/users/models/app_user.dart';
import 'package:inbound_ms/features/users/services/i_user_api_service.dart';

class UserProvider extends ChangeNotifier {
  final IUserApiService _userApiService;

  UserProvider({required IUserApiService userApiService})
      : _userApiService = userApiService;

  List<AppUser> _users = [];
  List<AppUser> get users => _users;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> fetchUsers() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _users = await _userApiService.fetchAllUsers();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateUserStatus(String userId, String status) async {
    try {
      await _userApiService.updateUserStatus(userId, status);
      await fetchUsers();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateUserRole(String userId, String role) async {
    try {
      await _userApiService.updateUserRole(userId, role);
      await fetchUsers();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
