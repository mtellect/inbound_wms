part of 'app_router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    TransitionRoute.fadeIn(
      page: SignInRoute.page, 
      path: AppRoutePathEnum.login.path,
      initial: true, // Mark as initial so the router is not empty
    ),
    // TODO: Add dashboard and scanner routes
  ];
}
