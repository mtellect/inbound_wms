import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/features/dashboard/widgets/dashboard_side_navigation.dart';

@RoutePage()
class DashboardShellPage extends StatelessWidget {
  const DashboardShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardOverviewRoute(),
        PurchaseOrdersRoute(),
        ShipmentsRoute(),
        DiscrepancyTriageRoute(),
        UsersRoute(),
        SessionsRoute(),
        ProductsRoute(),
        SuppliersRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        
        return Scaffold(
          backgroundColor: const Color(0xFFF1F5F9),
          body: Row(
            children: [
              DashboardSideNavigation(
                activeIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
              ),
              Expanded(
                child: child,
              ),
            ],
          ),
        );
      },
    );
  }
}
