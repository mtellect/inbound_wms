import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:csv/csv.dart';
import 'package:cross_file/cross_file.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/core/startup/startup_service.dart';
import 'package:inbound_ms/features/purchase_orders/services/i_purchase_order_api_service.dart';
import 'package:inbound_ms/features/receiving/models/scan_session.dart';
import 'package:inbound_ms/features/receiving/providers/session_provider.dart';
import 'package:uuid/uuid.dart';

class PurchaseOrderProvider extends ChangeNotifier {
  final IPurchaseOrderApiService _purchaseOrderApiService;

  PurchaseOrderProvider({required this._purchaseOrderApiService});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final Set<String> _loadingOrderIds = {};
  Set<String> get loadingOrderIds => _loadingOrderIds;

  List<PurchaseOrder> _activeOrders = [];
  List<PurchaseOrder> get activeOrders => _activeOrders;

  String? _statusFilter;
  String? get statusFilter => _statusFilter;

  void setStatusFilter(String? status) {
    _statusFilter = status;
    loadActiveOrders();
  }

  Future<void> loadActiveOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      _activeOrders = await _purchaseOrderApiService.fetchActivePurchaseOrders(statusFilter: _statusFilter);
    } catch (e) {
      debugPrint("Error loading orders: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<PurchaseOrder?> getPurchaseOrderByNumber(String poNumber) async {
    try {
      return _activeOrders.firstWhere((po) => po.poNumber == poNumber);
    } catch (_) {
      _isLoading = true;
      notifyListeners();
      try {
        final po = await _purchaseOrderApiService.fetchPurchaseOrderByNumber(poNumber);
        return po;
      } finally {
        _isLoading = false;
        notifyListeners();
      }
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
    required List<PurchaseOrder> orders,
    VoidCallback? onSuccess,
    Function(String)? onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (orders.isEmpty) {
        if (onError != null) onError("No valid orders found in file.");
        return;
      }

      await _purchaseOrderApiService.createPurchaseOrders(orders);
      await loadActiveOrders();
      if (onSuccess != null) onSuccess();
    } catch (e) {
      debugPrint("Error importing CSV orders: $e");
      if (onError != null) onError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteOrder({
    required String id,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    _loadingOrderIds.add(id);
    notifyListeners();

    try {
      await _purchaseOrderApiService.deletePurchaseOrder(id);
      await loadActiveOrders();
      onSuccess();
    } catch (e) {
      debugPrint("Error deleting order: $e");
      onError(e.toString());
    } finally {
      _loadingOrderIds.remove(id);
      notifyListeners();
    }
  }

  Future<void> saveReceivingSession({
    required PurchaseOrder po,
    required Map<String, int> scannedQuantities,
    required bool isComplete,
    required String operatorId,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      // 1. Update the items locally
      final updatedItems = po.items.map((item) {
        if (item.product != null) {
          final scanned = scannedQuantities[item.product!.sku.toUpperCase()] ?? 0;
          return item.copyWith(receivedQuantity: scanned);
        }
        return item;
      }).toList();

      // 2. Save items to DB
      await _purchaseOrderApiService.updatePoItemsReceivedQuantities(updatedItems);

      // 3. Update PO Status
      final newStatus = isComplete ? 'completed' : 'in_progress';
      await _purchaseOrderApiService.updatePurchaseOrderStatus(po.id, newStatus);

      // 4. Calculate session stats and create audit record
      int totalExpected = po.items.fold(0, (sum, item) => sum + item.expectedQuantity);
      int totalScanned = scannedQuantities.values.fold(0, (sum, qty) => sum + qty);
      int discrepancies = 0;
      for (var item in po.items) {
        if (item.product == null) continue;
        final scanned = scannedQuantities[item.product!.sku.toUpperCase()] ?? 0;
        if (scanned > item.expectedQuantity) {
          discrepancies += (scanned - item.expectedQuantity);
        }
      }

      final sessionRecord = ScanSession(
        id: const Uuid().v4(),
        sessionNumber: 'REC-${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}',
        poId: po.id,
        poNumber: po.poNumber,
        operatorId: operatorId,
        totalExpected: totalExpected,
        totalScanned: totalScanned,
        discrepancies: discrepancies,
        startTime: DateTime.now().subtract(const Duration(minutes: 5)),
        status: isComplete ? 'completed' : 'paused',
      );

      await getIt.get<SessionProvider>().createSession(sessionRecord);

      // 5. Reload
      await loadActiveOrders();
      onSuccess();
    } catch (e) {
      debugPrint("Error saving receiving session: $e");
      onError(e.toString());
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> autoSaveReceivingSession({
    required PurchaseOrder po,
    required Map<String, int> scannedQuantities,
  }) async {
    try {
      final updatedItems = po.items.map((item) {
        if (item.product != null) {
          final scanned = scannedQuantities[item.product!.sku.toUpperCase()] ?? 0;
          return item.copyWith(receivedQuantity: scanned);
        }
        return item;
      }).toList();

      await _purchaseOrderApiService.updatePoItemsReceivedQuantities(updatedItems);
      await _purchaseOrderApiService.updatePurchaseOrderStatus(po.id, 'in_progress');
      // Deliberately skipping loadActiveOrders() to prevent blocking UI/spinners during background save
    } catch (e) {
      debugPrint("Error auto-saving session: $e");
    }
  }

  Future<void> exportPoToCsv({
    required PurchaseOrder po,
    required VoidCallback onSuccess,
    required Function(String) onError,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final sessions = await _purchaseOrderApiService.fetchSessionsForPo(po.id);
      
      // Extract unique operators who scanned
      final operatorEmails = sessions
          .map((s) {
            final op = s['operator'];
            if (op == null) return 'Unknown';
            // handle single operator map
            return op['email']?.toString() ?? 'Unknown';
          })
          .where((e) => e != 'Unknown')
          .toSet()
          .join(', ');

      List<List<dynamic>> rows = [];
      // Header
      rows.add(['SKU', 'Product Name', 'Expected Qty', 'Scanned Qty', 'Who Scanned']);
      
      for (var item in po.items) {
        if (item.product == null) continue;
        rows.add([
          item.product!.sku,
          item.product!.name,
          item.expectedQuantity,
          item.receivedQuantity,
          operatorEmails.isEmpty ? 'N/A' : operatorEmails,
        ]);
      }
      
      String csvString = Csv().encode(rows);
      
      final fileName = 'PO_${po.poNumber}_Export.csv';
      final file = XFile.fromData(
        Uint8List.fromList(utf8.encode(csvString)), 
        mimeType: 'text/csv', 
        name: fileName,
      );
      
      await file.saveTo(fileName);
      onSuccess();
    } catch (e) {
      debugPrint("Export failed: $e");
      onError("Failed to export PO: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
