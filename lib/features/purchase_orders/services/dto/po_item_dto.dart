import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/product_dto.dart';

part 'po_item_dto.freezed.dart';
part 'po_item_dto.g.dart';

@freezed
abstract class PoItemDto with _$PoItemDto {
  const factory PoItemDto({
    required String id,
    @JsonKey(name: 'po_id') required String poId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'expected_quantity') required int expectedQuantity,
    @Default(0) @JsonKey(name: 'received_quantity') int receivedQuantity,
    @JsonKey(name: 'line_number') int? lineNumber,
    @JsonKey(name: 'products') ProductDto? product,
  }) = _PoItemDto;

  factory PoItemDto.fromJson(Map<String, dynamic> json) => _$PoItemDtoFromJson(json);
}
