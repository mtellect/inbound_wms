import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:csv/csv.dart';
import 'package:uuid/uuid.dart';
import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';

class ImportCsvService {
  static Future<List<PurchaseOrder>?> pickAndParseCsv() async {
    try {
      FilePickerResult? result = await FilePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv'],
        withData: true,
      );

      if (result == null || result.files.isEmpty) return null;

      final bytes = result.files.first.bytes;
      if (bytes == null) throw Exception("Failed to read file bytes. Only use on supported platforms.");

      final csvString = utf8.decode(bytes);
      // Auto-detect newline, parse to list
      final fields = Csv().decode(csvString);
      
      if (fields.isEmpty) throw Exception("CSV file is empty");

      // Assuming first row is headers
      final headers = fields[0].map((e) => e.toString().toLowerCase().trim()).toList();
      final poNumberIndex = headers.indexOf('po_number');
      final supplierIdIndex = headers.indexOf('supplier_id');
      final blindReceivingIndex = headers.indexOf('blind_receiving');

      if (poNumberIndex == -1) {
        throw Exception("CSV must contain a 'po_number' header. Found headers: $headers");
      }

      List<PurchaseOrder> orders = [];
      for (int i = 1; i < fields.length; i++) {
        final row = fields[i];
        if (row.isEmpty || row.every((e) => e.toString().trim().isEmpty)) continue;

        // Ensure row has enough columns
        if (poNumberIndex >= row.length) continue;

        final poNumber = row[poNumberIndex].toString().trim();
        if (poNumber.isEmpty) continue;

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

        orders.add(PurchaseOrder(
          id: const Uuid().v4(),
          poNumber: poNumber,
          supplierId: supplierId,
          blindReceiving: blindReceiving,
          status: 'pending',
        ));
      }

      return orders;
    } catch (e) {
      debugPrint("CSV parsing error: $e");
      rethrow;
    }
  }
}
