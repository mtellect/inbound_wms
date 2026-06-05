import 'package:freezed_annotation/freezed_annotation.dart';

part 'purchase_order_dto.freezed.dart';
part 'purchase_order_dto.g.dart';

@freezed
abstract class PurchaseOrderDto with _$PurchaseOrderDto {
  const factory PurchaseOrderDto({
    required String id,
    @JsonKey(name: 'po_number') required String poNumber,
    @JsonKey(name: 'supplier_id') String? supplierId,
    @Default('pending') String status,
    @Default(false) @JsonKey(name: 'blind_receiving') bool blindReceiving,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PurchaseOrderDto;

  factory PurchaseOrderDto.fromJson(Map<String, dynamic> json) => _$PurchaseOrderDtoFromJson(json);
}
