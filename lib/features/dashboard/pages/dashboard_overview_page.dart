import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:inbound_ms/core/widgets/page_header.dart';
import 'package:inbound_ms/features/dashboard/pages/dashboard_overview_loaded_state.dart';
import 'package:inbound_ms/features/dashboard/pages/dashboard_overview_loading_state.dart';

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
            child: Consumer<DashboardProvider>(
              builder: (context, dashboardProvider, child) {
                if (dashboardProvider.isLoading) {
                  return DashboardOverviewLoadingState();
                } else {
                  return const DashboardOverviewLoadedState();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
