import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:inbound_ms/features/purchase_orders/models/product.dart';
import 'package:inbound_ms/core/utils/uuid_utils.dart';

class ImportOrdersService {
  static List<PurchaseOrder> parseOrdersBytes({
    required Uint8List bytes,
    required String extension,
    required String defaultSupplierName,
  }) {
    try {
      List<List<dynamic>> fields = [];

      if (extension.toLowerCase() == 'xlsx') {
        var excel = Excel.decodeBytes(bytes);
        var table = excel.tables[excel.tables.keys.first];
        if (table != null) {
          for (var row in table.rows) {
            fields.add(row.map((cell) => cell?.value?.toString() ?? '').toList());
          }
        }
      } else {
        final csvString = utf8.decode(bytes);
        fields = Csv().decode(csvString);
      }

      if (fields.isEmpty) throw Exception("File is empty");

      // Assuming first row is headers
      final headers = fields[0].map((e) => e.toString().toLowerCase().trim()).toList();

      int poNumberIndex = headers.indexOf('po number (foc)');
      if (poNumberIndex == -1) poNumberIndex = headers.indexOf('po_number');
      if (poNumberIndex == -1) poNumberIndex = headers.indexOf('po number');
      if (poNumberIndex == -1) poNumberIndex = headers.indexWhere((h) => h.contains('po number'));

      int supplierIdIndex = headers.indexOf('supplier_id');
      if (supplierIdIndex == -1) supplierIdIndex = headers.indexOf('supplier id');

      int blindReceivingIndex = headers.indexOf('blind_receiving');
      if (blindReceivingIndex == -1) blindReceivingIndex = headers.indexOf('blind receiving');

      // Item Headers
      int skuIndex = headers.indexOf('search name');
      if (skuIndex == -1) skuIndex = headers.indexOf('sku');

      int productNameIndex = headers.indexOf('product name');
      if (productNameIndex == -1) productNameIndex = headers.indexOf('name');

      int quantityIndex = headers.indexOf('quantity');
      if (quantityIndex == -1) quantityIndex = headers.indexOf('qty');

      int lineIndex = headers.indexOf('line number');
      if (lineIndex == -1) lineIndex = headers.indexOf('line');

      int categoryIndex = headers.indexOf('procurement category');
      if (categoryIndex == -1) categoryIndex = headers.indexOf('category');

      int unitIndex = headers.indexOf('unit');

      if (poNumberIndex == -1) {
        throw Exception("File must contain a 'PO Number' header. Found headers: $headers");
      }

      Map<String, PurchaseOrder> uniqueOrders = {};

      for (int i = 1; i < fields.length; i++) {
        final row = fields[i];
        if (row.isEmpty || row.every((e) => e.toString().trim().isEmpty)) continue;

        if (poNumberIndex >= row.length) continue;

        final poNumber = row[poNumberIndex].toString().trim();
        if (poNumber.isEmpty) continue;

        // Extract PO Level info
        String? supplierName = defaultSupplierName;
        String? supplierId;

        if (supplierIdIndex != -1 && supplierIdIndex < row.length) {
          final rowSupplierId = row[supplierIdIndex].toString().trim();
          if (rowSupplierId.isNotEmpty) {
            supplierId = rowSupplierId;
          }
        }

        if (supplierId == null || supplierId.isEmpty) {
          supplierId = UuidUtils.ensureValidOrGenerate(supplierName);
        } else {
          supplierId = UuidUtils.ensureValidOrGenerate(supplierId);
        }

        bool blindReceiving = false;
        if (blindReceivingIndex != -1 && blindReceivingIndex < row.length) {
          final val = row[blindReceivingIndex].toString().trim().toLowerCase();
          blindReceiving = val == 'true' || val == '1' || val == 'yes';
        }

        // Create PO if not exists
        if (!uniqueOrders.containsKey(poNumber)) {
          uniqueOrders[poNumber] = PurchaseOrder(
            id: UuidUtils.generate(),
            poNumber: poNumber,
            supplierId: supplierId,
            supplierName: supplierName,
            blindReceiving: blindReceiving,
            status: 'pending',
            items: [],
          );
        }

        // Extract Item Level info
        String sku = '';
        if (skuIndex != -1 && skuIndex < row.length) sku = row[skuIndex].toString().trim();

        if (sku.isNotEmpty) {
          String name = sku; // Fallback to SKU if name is empty
          if (productNameIndex != -1 && productNameIndex < row.length) {
            final rowName = row[productNameIndex].toString().trim();
            if (rowName.isNotEmpty) name = rowName;
          }

          int expectedQty = 1; // Default to 1 if missing
          if (quantityIndex != -1 && quantityIndex < row.length) {
            expectedQty = int.tryParse(row[quantityIndex].toString().trim()) ?? 1;
          }

          int? lineNum;
          if (lineIndex != -1 && lineIndex < row.length) {
            lineNum = int.tryParse(row[lineIndex].toString().trim());
          }

          String? category;
          if (categoryIndex != -1 && categoryIndex < row.length) {
            category = row[categoryIndex].toString().trim();
          }

          String? unit;
          if (unitIndex != -1 && unitIndex < row.length) {
            unit = row[unitIndex].toString().trim();
          }

          final product = Product(
            id: UuidUtils.generate(),
            sku: sku,
            name: name,
            category: category,
            unit: unit,
          );

          final poId = uniqueOrders[poNumber]!.id;
          final item = PoItem(
            id: UuidUtils.generate(),
            poId: poId,
            productId: product.id,
            expectedQuantity: expectedQty,
            lineNumber: lineNum,
            product: product,
          );

          // Add item to PO
          final currentItems = List<PoItem>.from(uniqueOrders[poNumber]!.items);
          currentItems.add(item);
          uniqueOrders[poNumber] = uniqueOrders[poNumber]!.copyWith(items: currentItems);
        }
      }

      return uniqueOrders.values.toList();
    } catch (e) {
      debugPrint("File parsing error: $e");
      rethrow;
    }
  }
}
