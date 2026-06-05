import 'package:flutter/material.dart';
import 'package:inbound_ms/features/dashboard/providers/dashboard_provider.dart';
import 'package:inbound_ms/features/dashboard/widgets/kpi_card.dart';
import 'package:inbound_ms/features/dashboard/widgets/recent_activity_list.dart';
import 'package:inbound_ms/features/dashboard/widgets/quick_actions_card.dart';
import 'package:provider/provider.dart';

class DashboardOverviewLoadedState extends StatelessWidget {
  const DashboardOverviewLoadedState({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        // KPI Cards
        if (dashboardProvider.kpis.isNotEmpty)
          Row(
            children: dashboardProvider.kpis.asMap().entries.map((entry) {
              final index = entry.key;
              final kpi = entry.value;
              return Expanded(
                child: Row(
                  children: [
                    KpiCard(
                      title: kpi.title,
                      value: kpi.value,
                      icon: kpi.icon,
                      colors: kpi.colors,
                    ),
                    if (index < dashboardProvider.kpis.length - 1)
                      const SizedBox(width: 16),
                  ],
                ),
              );
            }).toList(),
          ),
        const SizedBox(height: 32),

        // Recent Activity / Content
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Expanded(
              flex: 2,
              child: RecentActivityList(),
            ),
            SizedBox(width: 24),
            Expanded(
              flex: 1, 
              child: QuickActionsCard(),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
