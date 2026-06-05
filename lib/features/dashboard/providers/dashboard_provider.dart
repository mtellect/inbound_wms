import 'package:flutter/foundation.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_kpi.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_activity.dart';
import 'package:inbound_ms/features/dashboard/services/i_dashboard_api_service.dart';

class DashboardProvider extends ChangeNotifier {
  final IDashboardApiService _dashboardApiService;

  DashboardProvider({required IDashboardApiService dashboardApiService})
      : _dashboardApiService = dashboardApiService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<DashboardKpi> _kpis = [];
  List<DashboardKpi> get kpis => _kpis;

  List<DashboardActivity> _recentActivity = [];
  List<DashboardActivity> get recentActivity => _recentActivity;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<void> loadDashboardData() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final results = await Future.wait([
        _dashboardApiService.fetchKpis(),
        _dashboardApiService.fetchRecentActivity(),
      ]);

      _kpis = results[0] as List<DashboardKpi>;
      _recentActivity = results[1] as List<DashboardActivity>;
    } catch (e) {
      debugPrint("Error loading dashboard data: $e");
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
