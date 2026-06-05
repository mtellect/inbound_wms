// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PurchaseOrder _$PurchaseOrderFromJson(Map<String, dynamic> json) =>
    _PurchaseOrder(
      id: json['id'] as String,
      poNumber: json['po_number'] as String,
      supplierId: json['supplier_id'] as String?,
      status: json['status'] as String? ?? 'pending',
      blindReceiving: json['blind_receiving'] as bool? ?? false,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PurchaseOrderToJson(_PurchaseOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'po_number': instance.poNumber,
      'supplier_id': instance.supplierId,
      'status': instance.status,
      'blind_receiving': instance.blindReceiving,
      'created_at': instance.createdAt?.toIso8601String(),
    };
