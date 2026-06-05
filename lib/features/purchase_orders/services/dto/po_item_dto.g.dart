// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'po_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PoItemDto _$PoItemDtoFromJson(Map<String, dynamic> json) => _PoItemDto(
  id: json['id'] as String,
  poId: json['po_id'] as String,
  productId: json['product_id'] as String,
  expectedQuantity: (json['expected_quantity'] as num).toInt(),
);

Map<String, dynamic> _$PoItemDtoToJson(_PoItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'po_id': instance.poId,
      'product_id': instance.productId,
      'expected_quantity': instance.expectedQuantity,
    };
