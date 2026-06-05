import 'package:inbound_ms/features/dashboard/models/dashboard_kpi.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_activity.dart';

abstract class IDashboardApiService {
  Future<List<DashboardKpi>> fetchKpis();
  Future<List<DashboardActivity>> fetchRecentActivity();
}
