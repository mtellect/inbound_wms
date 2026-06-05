import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';

abstract interface class IPurchaseOrderApiService {
  Future<List<PurchaseOrder>> fetchActivePurchaseOrders();
  Future<PurchaseOrder> fetchPurchaseOrderById(String id);
  Future<void> updatePurchaseOrderStatus(String id, String status);
}
