import 'package:flutter/foundation.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/services/i_purchase_order_api_service.dart';
import 'package:inbound_ms/features/purchase_orders/services/import_csv_service.dart';
import 'package:uuid/uuid.dart';

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

  Future<void> createOrder({
    required String poNumber,
    String? supplierId,
    bool blindReceiving = false,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newOrder = PurchaseOrder(
        id: const Uuid().v4(),
        poNumber: poNumber,
        supplierId: supplierId,
        blindReceiving: blindReceiving,
        status: 'pending',
      );

      await _purchaseOrderApiService.createPurchaseOrder(newOrder);
      await loadActiveOrders();
    } catch (e) {
      debugPrint("Error creating order: $e");
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> importCsvOrders({
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final orders = await ImportCsvService.pickAndParseCsv();
      if (orders == null || orders.isEmpty) return;
      
      await _purchaseOrderApiService.createPurchaseOrders(orders);
      await loadActiveOrders();
      onSuccess();
    } catch (e) {
      debugPrint("Error importing CSV orders: $e");
      onError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
