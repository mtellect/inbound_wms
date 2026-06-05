abstract interface class IAuthenticationApiService {
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
  bool get isAuthenticated;
  String? get currentUserRole;
}
