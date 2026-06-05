import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';

@RoutePage()
class DashboardShellPage extends StatelessWidget {
  const DashboardShellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        // TODO: Map to actual routes when available
        // e.g. DashboardOverviewRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        
        return Scaffold(
          appBar: AppBar(
            title: const Text('Inbound MS'),
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () async {
                  await context.read<AuthProvider>().signOut();
                  if (context.mounted) {
                    context.router.replaceAll([const SignInRoute()]);
                  }
                },
              ),
            ],
          ),
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: tabsRouter.activeIndex,
                onDestinationSelected: tabsRouter.setActiveIndex,
                labelType: NavigationRailLabelType.all,
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.dashboard_outlined),
                    selectedIcon: Icon(Icons.dashboard),
                    label: Text('Overview'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.inventory_2_outlined),
                    selectedIcon: Icon(Icons.inventory_2),
                    label: Text('Products'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.receipt_long_outlined),
                    selectedIcon: Icon(Icons.receipt_long),
                    label: Text('POs'),
                  ),
                ],
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
