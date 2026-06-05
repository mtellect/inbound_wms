import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order.freezed.dart';
part 'purchase_order.g.dart';

@freezed
abstract class PurchaseOrder with _$PurchaseOrder {
  const factory PurchaseOrder({
    required String id,
    @JsonKey(name: 'po_number') required String poNumber,
    @JsonKey(name: 'supplier_id') String? supplierId,
    @Default('pending') String status,
    @Default(false) @JsonKey(name: 'blind_receiving') bool blindReceiving,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PurchaseOrder;

  factory PurchaseOrder.fromJson(Map<String, dynamic> json) => _$PurchaseOrderFromJson(json);
}
