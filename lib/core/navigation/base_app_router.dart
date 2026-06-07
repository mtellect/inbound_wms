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
    ),
    TransitionRoute.fadeIn(
      page: DashboardShellRoute.page,
      path: AppRoutePathEnum.dashboard.path,
      guards: [AuthGuard(authProvider: authProvider)],
      initial: true,
      children: [
        AutoRoute(page: DashboardOverviewRoute.page, initial: true, path: AppRoutePathEnum.overview.path),
        AutoRoute(page: PurchaseOrdersRoute.page, path: AppRoutePathEnum.purchaseOrders.path),
        AutoRoute(page: ShipmentsRoute.page, path: AppRoutePathEnum.shipments.path),
        AutoRoute(page: DiscrepancyTriageRoute.page, path: AppRoutePathEnum.triage.path),
        AutoRoute(page: UsersRoute.page, path: AppRoutePathEnum.users.path),
        AutoRoute(page: SessionsRoute.page, path: AppRoutePathEnum.sessions.path),
        AutoRoute(page: ProductsRoute.page, path: AppRoutePathEnum.products.path),
        AutoRoute(page: SuppliersRoute.page, path: AppRoutePathEnum.suppliers.path),
      ]
    ),
  ];
}
