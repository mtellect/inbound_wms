import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/features/dashboard/widgets/dashboard_navigation_rail.dart';

@RoutePage()
class DashboardShellPage extends StatelessWidget {
  const DashboardShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        DashboardOverviewRoute(),
        ProductsRoute(),
        SuppliersRoute(),
        PurchaseOrdersRoute(),
        ShipmentsRoute(),
        DiscrepancyTriageRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        
        return Scaffold(
          backgroundColor: const Color(0xFFF1F5F9), // Slate 100
          body: Row(
            children: [
              DashboardNavigationRail(
                activeIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
              ),
              const VerticalDivider(thickness: 1, width: 1),
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
