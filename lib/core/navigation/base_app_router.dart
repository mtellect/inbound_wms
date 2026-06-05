part of 'app_router.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  final AuthProvider authProvider;
  
  AppRouter({required this.authProvider});

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    TransitionRoute.fadeIn(
      page: SignInRoute.page, 
      path: AppRoutePathEnum.login.path,
      initial: true,
    ),
    TransitionRoute.fadeIn(
      page: DashboardShellRoute.page,
      path: AppRoutePathEnum.dashboard.path,
      guards: [AuthGuard(authProvider: authProvider)],
      children: [
        AutoRoute(page: DashboardOverviewRoute.page, initial: true),
        AutoRoute(page: ProductsRoute.page),
        AutoRoute(page: SuppliersRoute.page),
        AutoRoute(page: PurchaseOrdersRoute.page),
        AutoRoute(page: ShipmentsRoute.page),
        AutoRoute(page: DiscrepancyTriageRoute.page),
      ]
    ),
  ];
}
