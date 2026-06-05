import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:uuid/uuid.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';

class ImportOrdersService {
  static Future<List<PurchaseOrder>?> pickAndParseOrders() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv', 'xlsx'],
        withData: true,
      );

      if (result == null || result.files.isEmpty) return null;

      final file = result.files.first;
      final bytes = file.bytes;
      if (bytes == null)
        throw Exception("Failed to read file bytes. Only use on supported platforms.");

      List<List<dynamic>> fields = [];

      if (file.extension?.toLowerCase() == 'xlsx') {
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

      int poNumberIndex = headers.indexOf('po_number');
      if (poNumberIndex == -1) poNumberIndex = headers.indexOf('po number');
      if (poNumberIndex == -1) {
        poNumberIndex = headers.indexWhere((h) => h.contains('po number'));
      }

      int supplierIdIndex = headers.indexOf('supplier_id');
      if (supplierIdIndex == -1) supplierIdIndex = headers.indexOf('supplier id');

      int blindReceivingIndex = headers.indexOf('blind_receiving');
      if (blindReceivingIndex == -1) blindReceivingIndex = headers.indexOf('blind receiving');

      if (poNumberIndex == -1) {
        throw Exception("File must contain a 'PO Number' header. Found headers: $headers");
      }

      Map<String, PurchaseOrder> uniqueOrders = {};

      for (int i = 1; i < fields.length; i++) {
        final row = fields[i];
        if (row.isEmpty || row.every((e) => e.toString().trim().isEmpty)) continue;

        // Ensure row has enough columns
        if (poNumberIndex >= row.length) continue;

        final poNumber = row[poNumberIndex].toString().trim();
        if (poNumber.isEmpty) continue;

        if (uniqueOrders.containsKey(poNumber)) continue;

        String? supplierId;
        if (supplierIdIndex != -1 && supplierIdIndex < row.length) {
          supplierId = row[supplierIdIndex].toString().trim();
          if (supplierId.isEmpty) supplierId = null;
        }

        bool blindReceiving = false;
        if (blindReceivingIndex != -1 && blindReceivingIndex < row.length) {
          final val = row[blindReceivingIndex].toString().trim().toLowerCase();
          blindReceiving = val == 'true' || val == '1' || val == 'yes';
        }

        uniqueOrders[poNumber] = PurchaseOrder(
          id: const Uuid().v4(),
          poNumber: poNumber,
          supplierId: supplierId,
          blindReceiving: blindReceiving,
          status: 'pending',
        );
      }

      return uniqueOrders.values.toList();
    } catch (e) {
      debugPrint("File parsing error: $e");
      rethrow;
    }
  }
}
