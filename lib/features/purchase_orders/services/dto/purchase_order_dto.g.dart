// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseOrderDto _$PurchaseOrderDtoFromJson(Map<String, dynamic> json) =>
    _PurchaseOrderDto(
      id: json['id'] as String,
      poNumber: json['po_number'] as String,
      supplierId: json['supplier_id'] as String?,
      status: json['status'] as String? ?? 'pending',
      blindReceiving: json['blind_receiving'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      items:
          (json['po_items'] as List<dynamic>?)
              ?.map((e) => PoItemDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      suppliersMap: json['suppliers'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$PurchaseOrderDtoToJson(_PurchaseOrderDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'po_number': instance.poNumber,
      'supplier_id': instance.supplierId,
      'status': instance.status,
      'blind_receiving': instance.blindReceiving,
      'created_at': instance.createdAt?.toIso8601String(),
      'po_items': instance.items,
      'suppliers': instance.suppliersMap,
    };
