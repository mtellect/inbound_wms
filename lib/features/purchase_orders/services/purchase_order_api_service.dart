import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/purchase_order_dto.dart';
import 'package:inbound_ms/features/purchase_orders/services/mappers/purchase_order_mapper.dart';
import 'package:inbound_ms/features/purchase_orders/models/product.dart';
import 'i_purchase_order_api_service.dart';

class PurchaseOrderApiService implements IPurchaseOrderApiService {
  final SupabaseClient _supabaseClient;

  PurchaseOrderApiService({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;

  @override
  Future<List<PurchaseOrder>> fetchActivePurchaseOrders() async {
    final response = await _supabaseClient
        .from('purchase_orders')
        .select('*, po_items(*, products(*))')
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
        .select('*, po_items(*, products(*))')
        .eq('id', id)
        .single();
        
    final dto = PurchaseOrderDto.fromJson(response);
    return PurchaseOrderMapper.fromDto(dto);
  }

  @override
  Future<void> createPurchaseOrder(PurchaseOrder order) async {
    final dto = PurchaseOrderMapper.toDto(order);
    final json = dto.toJson();
    json.removeWhere((key, value) => value == null);
    await _supabaseClient.from('purchase_orders').insert(json);
  }

  @override
  Future<void> createPurchaseOrders(List<PurchaseOrder> orders) async {
    // 1. Extract unique products
    final Map<String, Product> uniqueProducts = {};
    for (var order in orders) {
      for (var item in order.items) {
        if (item.product != null) {
          uniqueProducts[item.product!.sku] = item.product!;
        }
      }
    }

    // 2. Upsert Products & Get DB IDs
    Map<String, String> skuToDbId = {};
    if (uniqueProducts.isNotEmpty) {
      final productDtos = uniqueProducts.values.map((p) {
        final json = ProductMapper.toDto(p).toJson();
        json.remove('id'); // Let DB generate ID if new
        return json;
      }).toList();

      final productsResponse = await _supabaseClient
          .from('products')
          .upsert(productDtos, onConflict: 'sku')
          .select('id, sku');

      for (var row in productsResponse) {
        skuToDbId[row['sku'] as String] = row['id'] as String;
      }
    }

    // 3. Insert Purchase Orders
    final poDtos = orders.map((o) {
      final json = PurchaseOrderMapper.toDto(o).toJson();
      json.remove('po_items'); // Remove nested items to avoid relation errors
      return json;
    }).toList();
    
    if (poDtos.isNotEmpty) {
      await _supabaseClient.from('purchase_orders').insert(poDtos);
    }

    // 4. Insert PO Items
    List<Map<String, dynamic>> poItemDtos = [];
    for (var order in orders) {
      for (var item in order.items) {
        final dbProductId = skuToDbId[item.product?.sku] ?? item.productId;
        final json = PoItemMapper.toDto(item).toJson();
        json['product_id'] = dbProductId; // Assign actual DB Product ID
        json.remove('products'); // Remove nested product
        poItemDtos.add(json);
      }
    }

    if (poItemDtos.isNotEmpty) {
      await _supabaseClient.from('po_items').insert(poItemDtos);
    }
  }

  @override
  Future<void> updatePurchaseOrderStatus(String id, String status) async {
    await _supabaseClient
        .from('purchase_orders')
        .update({'status': status})
        .eq('id', id);
  }

  @override
  Future<void> deletePurchaseOrder(String id) async {
    await _supabaseClient
        .from('purchase_orders')
        .delete()
        .eq('id', id);
  }
}
