import 'package:flutter/material.dart';
import 'package:inbound_ms/core/extensions/base_extension.dart';
import 'package:inbound_ms/features/dashboard/widgets/dashboard_logo.dart';
import 'package:inbound_ms/features/dashboard/widgets/dashboard_nav_item.dart';
import 'package:inbound_ms/features/dashboard/widgets/dashboard_user_area.dart';

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
    final isDesktop = context.isDesktop;
    final width = isDesktop ? 260.0 : 80.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      width: width,
      color: Colors.white,
      child: Column(
        children: [
          // Logo Area
          DashboardLogo(
            isDesktop: isDesktop,
            onTap: () => onDestinationSelected(0),
          ),
          
          // Navigation Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                DashboardNavItem(
                  icon: Icons.dashboard_outlined,
                  activeIcon: Icons.dashboard,
                  label: 'Overview',
                  isActive: activeIndex == 0,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(0),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Divider(color: Colors.black12, height: 1),
                ),
                if (isDesktop)
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 8, top: 4),
                    child: Text('OPERATIONS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade500, letterSpacing: 0.5)),
                  ),
                DashboardNavItem(
                  icon: Icons.receipt_long_outlined,
                  activeIcon: Icons.receipt_long,
                  label: 'Purchase Orders',
                  isActive: activeIndex == 1,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(1),
                ),
                DashboardNavItem(
                  icon: Icons.local_shipping_outlined,
                  activeIcon: Icons.local_shipping,
                  label: 'Shipments',
                  isActive: activeIndex == 2,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(2),
                ),
                DashboardNavItem(
                  icon: Icons.report_problem_outlined,
                  activeIcon: Icons.report_problem,
                  label: 'Triage',
                  isActive: activeIndex == 3,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(3),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Divider(color: Colors.black12, height: 1),
                ),
                if (isDesktop)
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 8, top: 4),
                    child: Text('ADMINISTRATION', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade500, letterSpacing: 0.5)),
                  ),
                DashboardNavItem(
                  icon: Icons.group_outlined,
                  activeIcon: Icons.group,
                  label: 'Users',
                  isActive: activeIndex == 4,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(4),
                ),
                DashboardNavItem(
                  icon: Icons.history_outlined,
                  activeIcon: Icons.history,
                  label: 'Sessions',
                  isActive: activeIndex == 5,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(5),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Divider(color: Colors.black12, height: 1),
                ),
                if (isDesktop)
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 8, top: 4),
                    child: Text('MASTER DATA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey.shade500, letterSpacing: 0.5)),
                  ),
                DashboardNavItem(
                  icon: Icons.inventory_2_outlined,
                  activeIcon: Icons.inventory_2,
                  label: 'Products',
                  isActive: activeIndex == 6,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(6),
                ),
                DashboardNavItem(
                  icon: Icons.storefront_outlined,
                  activeIcon: Icons.storefront,
                  label: 'Suppliers',
                  isActive: activeIndex == 7,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(7),
                ),
              ],
            ),
          ),
          
          // User / Logout Area
          DashboardUserArea(isDesktop: isDesktop),
        ],
      ),
    );
  }
}

