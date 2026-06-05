import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_item_dto.freezed.dart';
part 'po_item_dto.g.dart';

@freezed
abstract class PoItemDto with _$PoItemDto {
  const factory PoItemDto({
    required String id,
    @JsonKey(name: 'po_id') required String poId,
    @JsonKey(name: 'product_id') required String productId,
    @JsonKey(name: 'expected_quantity') required int expectedQuantity,
  }) = _PoItemDto;

  factory PoItemDto.fromJson(Map<String, dynamic> json) => _$PoItemDtoFromJson(json);
}
