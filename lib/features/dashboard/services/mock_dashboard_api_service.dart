import 'package:flutter/material.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_kpi.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_activity.dart';
import 'package:inbound_ms/features/dashboard/services/i_dashboard_api_service.dart';

class MockDashboardApiService implements IDashboardApiService {
  @override
  Future<List<DashboardKpi>> fetchKpis() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      DashboardKpi(
        title: 'Total POs',
        value: '124',
        icon: Icons.receipt_long,
        colors: [Colors.blue[400]!, Colors.blue[700]!],
      ),
      DashboardKpi(
        title: 'Pending Shipments',
        value: '18',
        icon: Icons.local_shipping,
        colors: [Colors.orange[400]!, Colors.orange[700]!],
      ),
      DashboardKpi(
        title: 'Open Discrepancies',
        value: '3',
        icon: Icons.report_problem,
        colors: [Colors.red[400]!, Colors.red[700]!],
      ),
      DashboardKpi(
        title: 'Active Suppliers',
        value: '42',
        icon: Icons.storefront,
        colors: [Colors.teal[400]!, Colors.teal[700]!],
      ),
    ];
  }

  @override
  Future<List<DashboardActivity>> fetchRecentActivity() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));

    return [
      DashboardActivity(
        title: 'PO-2024-001 received',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        icon: Icons.history,
        iconColor: Colors.blue,
      ),
      DashboardActivity(
        title: 'PO-SPAE-003382127 imported via CSV',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        icon: Icons.file_upload,
        iconColor: Colors.teal,
      ),
      DashboardActivity(
        title: 'Discrepancy logged for PO-2024-002',
        timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        icon: Icons.report_problem,
        iconColor: Colors.red,
      ),
    ];
  }
}
