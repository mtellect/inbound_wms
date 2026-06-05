import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_kpi.dart';
import 'package:inbound_ms/features/dashboard/models/dashboard_activity.dart';
import 'package:inbound_ms/features/dashboard/services/i_dashboard_api_service.dart';

class DashboardApiService implements IDashboardApiService {
  final SupabaseClient _supabaseClient;

  DashboardApiService({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  @override
  Future<List<DashboardKpi>> fetchKpis() async {
    // Total POs
    final totalPosResponse = await _supabaseClient
        .from('purchase_orders')
        .select('id')
        .count(CountOption.exact);

    // Pending Shipments
    final pendingResponse = await _supabaseClient
        .from('purchase_orders')
        .select('id')
        .eq('status', 'pending')
        .count(CountOption.exact);

    return [
      DashboardKpi(
        title: 'Total POs',
        value: totalPosResponse.count.toString(),
        icon: Icons.receipt_long,
        colors: [Colors.blue[400]!, Colors.blue[700]!],
      ),
      DashboardKpi(
        title: 'Pending Shipments',
        value: pendingResponse.count.toString(),
        icon: Icons.local_shipping,
        colors: [Colors.orange[400]!, Colors.orange[700]!],
      ),
      DashboardKpi(
        title: 'Open Discrepancies',
        value: '0', // Placeholder until discrepancies logic is added
        icon: Icons.report_problem,
        colors: [Colors.red[400]!, Colors.red[700]!],
      ),
      DashboardKpi(
        title: 'Active Suppliers',
        value: 'N/A', // Placeholder
        icon: Icons.storefront,
        colors: [Colors.teal[400]!, Colors.teal[700]!],
      ),
    ];
  }

  @override
  Future<List<DashboardActivity>> fetchRecentActivity() async {
    final response = await _supabaseClient
        .from('purchase_orders')
        .select('po_number, created_at')
        .order('created_at', ascending: false)
        .limit(5);

    return (response as List).map((e) {
      final createdAt = e['created_at'] != null 
          ? DateTime.parse(e['created_at']) 
          : DateTime.now();
          
      return DashboardActivity(
        title: '${e['po_number']} received',
        timestamp: createdAt,
        icon: Icons.history,
        iconColor: Colors.blue,
      );
    }).toList();
  }
}
