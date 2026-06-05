// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discrepancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Discrepancy _$DiscrepancyFromJson(Map<String, dynamic> json) => _Discrepancy(
  id: json['id'] as String,
  poId: json['poId'] as String,
  productId: json['productId'] as String,
  expectedQty: (json['expectedQty'] as num).toInt(),
  actualQty: (json['actualQty'] as num).toInt(),
  reason: json['reason'] as String,
  status: json['status'] as String? ?? 'open',
  resolutionNotes: json['resolutionNotes'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$DiscrepancyToJson(_Discrepancy instance) =>
    <String, dynamic>{
      'id': instance.id,
      'poId': instance.poId,
      'productId': instance.productId,
      'expectedQty': instance.expectedQty,
      'actualQty': instance.actualQty,
      'reason': instance.reason,
      'status': instance.status,
      'resolutionNotes': instance.resolutionNotes,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
