import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';

part 'purchase_order.freezed.dart';

@freezed
abstract class PurchaseOrder with _$PurchaseOrder {
  const factory PurchaseOrder({
    required String id,
    required String poNumber,
    String? supplierId,
    @Default('pending') String status,
    @Default(false) bool blindReceiving,
    DateTime? createdAt,
    @Default([]) List<PoItem> items,
  }) = _PurchaseOrder;
}
