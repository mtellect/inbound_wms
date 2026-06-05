// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  sku: json['sku'] as String,
  barcode: json['barcode'] as String?,
  name: json['name'] as String,
  category: json['category'] as String?,
  unit: json['unit'] as String?,
  requiresLot: json['requires_lot'] as bool? ?? false,
  requiresSerial: json['requires_serial'] as bool? ?? false,
  requiresExpiry: json['requires_expiry'] as bool? ?? false,
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'sku': instance.sku,
  'barcode': instance.barcode,
  'name': instance.name,
  'category': instance.category,
  'unit': instance.unit,
  'requires_lot': instance.requiresLot,
  'requires_serial': instance.requiresSerial,
  'requires_expiry': instance.requiresExpiry,
};
