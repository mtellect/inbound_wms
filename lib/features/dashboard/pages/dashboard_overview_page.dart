import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/features/dashboard/widgets/quick_actions_card.dart';
import 'package:inbound_ms/features/dashboard/widgets/kpi_card.dart';
import 'package:inbound_ms/features/dashboard/widgets/recent_activity_list.dart';

import 'package:provider/provider.dart';
import 'package:inbound_ms/features/dashboard/providers/dashboard_provider.dart';

@RoutePage()
class DashboardOverviewPage extends StatefulWidget {
  const DashboardOverviewPage({super.key});

  @override
  State<DashboardOverviewPage> createState() => _DashboardOverviewPageState();
}

class _DashboardOverviewPageState extends State<DashboardOverviewPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DashboardProvider>().loadDashboardData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dashboardProvider = context.watch<DashboardProvider>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PageHeader(
            title: 'Overview',
            subtitle: 'Welcome to Inbound MS. Here is what is happening today.',
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              children: [
                // KPI Cards
                if (dashboardProvider.isLoading)
                  const Center(child: Padding(
                    padding: EdgeInsets.all(32.0),
                    child: CircularProgressIndicator(),
                  ))
                else if (dashboardProvider.kpis.isNotEmpty)
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
                  children: [
                    Expanded(
                      flex: 2,
                      child: dashboardProvider.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : RecentActivityList(),
                    ),
                    const SizedBox(width: 24),
                    const Expanded(flex: 1, child: QuickActionsCard()),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
