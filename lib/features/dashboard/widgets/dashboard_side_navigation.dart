import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/core/extensions/base_extension.dart';

class DashboardSideNavigation extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int> onDestinationSelected;

  const DashboardSideNavigation({
    super.key,
    required this.activeIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      extended: context.isDesktop,
      selectedIndex: activeIndex,
      onDestinationSelected: onDestinationSelected,
      labelType: context.isDesktop ? NavigationRailLabelType.none : NavigationRailLabelType.all,
      
      leading: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.warehouse, color: Theme.of(context).primaryColor, size: 32),
            ),
          ],
        ),
      ),
      trailing: Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: IconButton(
              icon: const Icon(Icons.logout),
              tooltip: 'Sign Out',
              onPressed: () async {
                await context.read<AuthProvider>().signOut();
                if (context.mounted) {
                  context.router.replaceAll([const SignInRoute()]);
                }
              },
            ),
          ),
        ),
      ),
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
          icon: Icon(Icons.storefront_outlined),
          selectedIcon: Icon(Icons.storefront),
          label: Text('Suppliers'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.receipt_long_outlined),
          selectedIcon: Icon(Icons.receipt_long),
          label: Text('POs'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.local_shipping_outlined),
          selectedIcon: Icon(Icons.local_shipping),
          label: Text('Shipments'),
        ),
        NavigationRailDestination(
          icon: Icon(Icons.report_problem_outlined),
          selectedIcon: Icon(Icons.report_problem),
          label: Text('Triage'),
        ),
      ],
    );
  }
}
