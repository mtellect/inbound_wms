import 'package:auto_route/auto_route.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthProvider authProvider;

  AuthGuard({required this.authProvider});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (authProvider.isAuthenticated) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.push(const SignInRoute());
    }
  }
}
