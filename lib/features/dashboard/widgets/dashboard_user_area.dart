import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:inbound_ms/features/auth/providers/auth_provider.dart';
import 'package:inbound_ms/core/navigation/app_router.dart';
import 'package:recase/recase.dart';
import 'package:inbound_ms/features/dashboard/widgets/dashboard_nav_item.dart';

class DashboardUserArea extends StatelessWidget {
  final bool isDesktop;

  const DashboardUserArea({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final email = authProvider.email ?? 'Unknown User';
    final role = authProvider.role?.name.titleCase ?? 'Worker';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isDesktop) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    email,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    role,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
          DashboardNavItem(
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
        ],
      ),
    );
  }
}
