import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/features/dashboard/widgets/quick_actions_card.dart';
import 'package:inbound_ms/features/dashboard/widgets/kpi_card.dart';
import 'package:inbound_ms/features/dashboard/widgets/recent_activity_list.dart';

@RoutePage()
class DashboardOverviewPage extends StatelessWidget {
  const DashboardOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                Row(
                  children: [
                    KpiCard(
                      title: 'Total POs',
                      value: '124',
                      icon: Icons.receipt_long,
                      colors: [Colors.blue[400]!, Colors.blue[700]!],
                    ),
                    const SizedBox(width: 16),
                    KpiCard(
                      title: 'Pending Shipments',
                      value: '18',
                      icon: Icons.local_shipping,
                      colors: [Colors.orange[400]!, Colors.orange[700]!],
                    ),
                    const SizedBox(width: 16),
                    KpiCard(
                      title: 'Open Discrepancies',
                      value: '3',
                      icon: Icons.report_problem,
                      colors: [Colors.red[400]!, Colors.red[700]!],
                    ),
                    const SizedBox(width: 16),
                    KpiCard(
                      title: 'Active Suppliers',
                      value: '42',
                      icon: Icons.storefront,
                      colors: [Colors.teal[400]!, Colors.teal[700]!],
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Recent Activity / Content
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      flex: 2,
                      child: RecentActivityList(),
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
