import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/purchase_order_dto.dart';
import 'package:inbound_ms/features/purchase_orders/services/mappers/purchase_order_mapper.dart';
import 'i_purchase_order_api_service.dart';

class PurchaseOrderApiService implements IPurchaseOrderApiService {
  final SupabaseClient _supabaseClient;

  PurchaseOrderApiService(this._supabaseClient);

  @override
  Future<List<PurchaseOrder>> fetchActivePurchaseOrders() async {
    final response = await _supabaseClient
        .from('purchase_orders')
        .select()
        .neq('status', 'completed');
    
    return (response as List).map((e) {
      final dto = PurchaseOrderDto.fromJson(e);
      return PurchaseOrderMapper.fromDto(dto);
    }).toList();
  }

  @override
  Future<PurchaseOrder> fetchPurchaseOrderById(String id) async {
    final response = await _supabaseClient
        .from('purchase_orders')
        .select()
        .eq('id', id)
        .single();
        
    final dto = PurchaseOrderDto.fromJson(response);
    return PurchaseOrderMapper.fromDto(dto);
  }

  @override
  Future<void> updatePurchaseOrderStatus(String id, String status) async {
    await _supabaseClient
        .from('purchase_orders')
        .update({'status': status})
        .eq('id', id);
  }
}
