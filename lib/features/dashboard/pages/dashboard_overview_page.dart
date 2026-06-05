import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardOverviewPage extends StatelessWidget {
  const DashboardOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Dashboard Overview'),
      ),
    );
  }
}
