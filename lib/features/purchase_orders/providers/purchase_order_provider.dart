import 'package:flutter/foundation.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/services/i_purchase_order_api_service.dart';

class PurchaseOrderProvider extends ChangeNotifier {
  final IPurchaseOrderApiService _purchaseOrderApiService;

  PurchaseOrderProvider({required IPurchaseOrderApiService purchaseOrderApiService})
      : _purchaseOrderApiService = purchaseOrderApiService;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<PurchaseOrder> _activeOrders = [];
  List<PurchaseOrder> get activeOrders => _activeOrders;

  Future<void> loadActiveOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      _activeOrders = await _purchaseOrderApiService.fetchActivePurchaseOrders();
    } catch (e) {
      debugPrint("Error loading orders: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
