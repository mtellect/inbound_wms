import 'package:flutter/material.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_kpi.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_activity.dart';
import 'package:inbound_ms/features/dashboard/services/i_dashboard_api_service.dart';
import 'package:inbound_ms/features/purchase_orders/providers/purchase_order_provider.dart';

class DashboardProvider extends ChangeNotifier {
  final IDashboardApiService _dashboardApiService;
  final PurchaseOrderProvider _purchaseOrderProvider;

  DashboardProvider({required this._dashboardApiService, required this._purchaseOrderProvider}) {
    _purchaseOrderProvider.addListener(_onPurchaseOrdersChanged);
  }

  @override
  void dispose() {
    _purchaseOrderProvider.removeListener(_onPurchaseOrdersChanged);
    super.dispose();
  }

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
      // Recompute the local PO-based stats
      _computePoStats();

      // Fetch other KPIs (discrepancies, suppliers) from dashboard api service
      final otherKpis = await _dashboardApiService.fetchOtherKpis();

      // Combine local PO KPIs with API KPIs
      // We only append if we don't have exactly 4 to prevent duplicating every load,
      // but the safest way is to rebuild the list
      _computePoStats(); // Ensure first 2 are ready
      _kpis.addAll(otherKpis);
    } catch (e) {
      debugPrint("Error loading dashboard data: $e");
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _onPurchaseOrdersChanged() {
    // Whenever PO provider updates, we rebuild our KPIs and Activity
    _computePoStats();
    // Re-fetch or re-add the other KPIs if we already loaded them?
    // Usually we just let the UI reflect the updated PO kpis.
    // But since `_kpis` holds all of them, let's just trigger loadDashboardData or manually update first 2.
    // Actually, easiest is just to reload the whole dashboard data silently or update the first two KPIs.
    // For now, let's do a fast local update for the PO part.
    if (!_isLoading && _kpis.length >= 4) {
      final totalPos = _purchaseOrderProvider.activeOrders.length;
      final pendingPos = _purchaseOrderProvider.activeOrders
          .where((o) => o.status == 'pending')
          .length;

      _kpis[0] = DashboardKpi(
        title: 'Total POs',
        value: totalPos.toString(),
        icon: Icons.receipt_long,
        colors: [Colors.blue[400]!, Colors.blue[700]!],
      );

      _kpis[1] = DashboardKpi(
        title: 'Pending Shipments',
        value: pendingPos.toString(),
        icon: Icons.local_shipping,
        colors: [Colors.orange[400]!, Colors.orange[700]!],
      );
      notifyListeners();
    }
  }

  void _computePoStats() {
    final orders = _purchaseOrderProvider.activeOrders;
    final totalPos = orders.length;
    final pendingPos = orders.where((o) => o.status == 'pending').length;

    // Build the first 2 KPIs
    _kpis = [
      DashboardKpi(
        title: 'Total POs',
        value: totalPos.toString(),
        icon: Icons.receipt_long,
        colors: [Colors.blue[400]!, Colors.blue[700]!],
      ),
      DashboardKpi(
        title: 'Pending Shipments',
        value: pendingPos.toString(),
        icon: Icons.local_shipping,
        colors: [Colors.orange[400]!, Colors.orange[700]!],
      ),
    ];

    // Compute recent activity (take latest 5)
    final sortedOrders = List.of(orders)
      ..sort((a, b) => (b.createdAt ?? DateTime.now()).compareTo(a.createdAt ?? DateTime.now()));

    _recentActivity = sortedOrders.take(5).map((o) {
      return DashboardActivity(
        title: '${o.poNumber} ${o.status}',
        timestamp: o.createdAt ?? DateTime.now(),
        icon: Icons.history,
        iconColor: Colors.blue,
      );
    }).toList();
  }
}
