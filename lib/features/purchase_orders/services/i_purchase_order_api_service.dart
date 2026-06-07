import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';

abstract interface class IPurchaseOrderApiService {
  Future<List<PurchaseOrder>> fetchActivePurchaseOrders({String? statusFilter});
  Future<PurchaseOrder> fetchPurchaseOrderById(String id);
  Future<void> createPurchaseOrder(PurchaseOrder order);
  Future<void> createPurchaseOrders(List<PurchaseOrder> orders);
  Future<void> updatePurchaseOrderStatus(String id, String status);
  Future<void> updatePoItemsReceivedQuantities(List<PoItem> items);
  Future<void> deletePurchaseOrder(String id);
  Future<List<Map<String, dynamic>>> fetchSessionsForPo(String poId);
}
