import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/purchase_order_dto.dart';
import 'package:inbound_ms/features/purchase_orders/services/mappers/purchase_order_mapper.dart';
import 'package:inbound_ms/features/purchase_orders/models/product.dart';
import 'i_purchase_order_api_service.dart';

class PurchaseOrderApiService implements IPurchaseOrderApiService {
  final SupabaseClient _supabaseClient;

  PurchaseOrderApiService({required this._supabaseClient});

  @override
  Future<List<PurchaseOrder>> fetchActivePurchaseOrders({String? statusFilter}) async {
    var query = _supabaseClient
        .from('purchase_orders')
        .select('*, suppliers(name), po_items(*, products(*))');
        
    if (statusFilter != null) {
      query = query.eq('status', statusFilter);
    } else {
      query = query.neq('status', 'completed');
    }
    
    final response = await query;
    
    return (response as List).map((e) {
      final dto = PurchaseOrderDto.fromJson(e);
      return PurchaseOrderMapper.fromDto(dto);
    }).toList();
  }

  @override
  Future<PurchaseOrder> fetchPurchaseOrderById(String id) async {
    final response = await _supabaseClient
        .from('purchase_orders')
        .select('*, suppliers(name), po_items(*, products(*))')
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
    // 1. Extract unique products and suppliers
    final Map<String, Product> uniqueProducts = {};
    final Map<String, Map<String, dynamic>> uniqueSuppliers = {};
    
    for (var order in orders) {
      if (order.supplierId != null && order.supplierName != null) {
        uniqueSuppliers[order.supplierId!] = {
          'id': order.supplierId!,
          'name': order.supplierName!
        };
      }
      for (var item in order.items) {
        if (item.product != null) {
          uniqueProducts[item.product!.sku] = item.product!;
        }
      }
    }

    // 2. Upsert Suppliers
    if (uniqueSuppliers.isNotEmpty) {
      await _supabaseClient
          .from('suppliers')
          .upsert(uniqueSuppliers.values.toList(), onConflict: 'id');
    }

    // 3. Upsert Products & Get DB IDs
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

    // 4. Insert Purchase Orders
    final poDtos = orders.map((o) {
      final json = PurchaseOrderMapper.toDto(o).toJson();
      json.remove('po_items'); // Remove nested items to avoid relation errors
      return json;
    }).toList();
    
    if (poDtos.isNotEmpty) {
      await _supabaseClient.from('purchase_orders').insert(poDtos);
    }

    // 5. Insert PO Items
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

  @override
  Future<void> updatePoItemsReceivedQuantities(List<PoItem> items) async {
    final List<Map<String, dynamic>> upserts = [];
    for (var item in items) {
      final json = PoItemMapper.toDto(item).toJson();
      json.remove('products'); // Don't try to upsert the joined product
      upserts.add(json);
    }
    if (upserts.isNotEmpty) {
      await _supabaseClient.from('po_items').upsert(upserts);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchSessionsForPo(String poId) async {
    final response = await _supabaseClient
        .from('receiving_sessions')
        .select('session_number, status, operator:user_roles!operator_id(email, display_name)')
        .eq('po_id', poId);
    return List<Map<String, dynamic>>.from(response);
  }
}
