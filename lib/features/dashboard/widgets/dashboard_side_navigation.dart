import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:inbound_ms/core/extensions/base_extension.dart';
import 'package:inbound_ms/features/dashboard/widgets/dashboard_logo.dart';

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
                _NavItem(
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
                _NavItem(
                  icon: Icons.receipt_long_outlined,
                  activeIcon: Icons.receipt_long,
                  label: 'Purchase Orders',
                  isActive: activeIndex == 1,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(1),
                ),
                _NavItem(
                  icon: Icons.local_shipping_outlined,
                  activeIcon: Icons.local_shipping,
                  label: 'Shipments',
                  isActive: activeIndex == 2,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(2),
                ),
                _NavItem(
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
                _NavItem(
                  icon: Icons.group_outlined,
                  activeIcon: Icons.group,
                  label: 'Users',
                  isActive: activeIndex == 4,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(4),
                ),
                _NavItem(
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
                _NavItem(
                  icon: Icons.inventory_2_outlined,
                  activeIcon: Icons.inventory_2,
                  label: 'Products',
                  isActive: activeIndex == 6,
                  isExpanded: isDesktop,
                  onTap: () => onDestinationSelected(6),
                ),
                _NavItem(
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: _NavItem(
              icon: Icons.logout_outlined,
              activeIcon: Icons.logout,
              label: 'Sign Out',
              isActive: false,
              isExpanded: isDesktop,
              isDestructive: true,
              onTap: () async {
                await context.read<AuthProvider>().signOut();
                if (context.mounted) {
                  context.router.replaceAll([const SignInRoute()]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final bool isExpanded;
  final bool isDestructive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.isExpanded,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final primaryColor = widget.isDestructive ? Colors.red : Theme.of(context).primaryColor;
    final color = widget.isActive ? primaryColor : (_isHovered ? primaryColor : Colors.grey[600]!);
    final bgColor = widget.isActive
        ? primaryColor.withValues(alpha: 0.1)
        : (_isHovered ? Colors.grey[100] : Colors.transparent);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (val) => setState(() => _isHovered = val),
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            vertical: 12,
            horizontal: widget.isExpanded ? 16 : 0,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: widget.isExpanded
              ? Row(
                  children: [
                    Icon(widget.isActive ? widget.activeIcon : widget.icon, color: color, size: 22),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        widget.label,
                        style: TextStyle(
                          color: color,
                          fontWeight: widget.isActive ? FontWeight.bold : FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: Tooltip(
                    message: widget.label,
                    preferBelow: false,
                    child: Icon(widget.isActive ? widget.activeIcon : widget.icon, color: color, size: 24),
                  ),
                ),
        ),
      ),
    );
  }
}
