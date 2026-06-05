// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanSessionDto _$ScanSessionDtoFromJson(Map<String, dynamic> json) =>
    _ScanSessionDto(
      id: json['id'] as String,
      sessionNumber: json['session_number'] as String,
      shipmentId: json['shipment_id'] as String?,
      poId: json['po_id'] as String?,
      operatorId: json['operator_id'] as String,
      totalExpected: (json['total_expected'] as num).toInt(),
      totalScanned: (json['total_scanned'] as num).toInt(),
      discrepancies: (json['discrepancies'] as num).toInt(),
      status: json['status'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String?,
      userRoles: json['user_roles'] as Map<String, dynamic>?,
      purchaseOrders: json['purchase_orders'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ScanSessionDtoToJson(_ScanSessionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_number': instance.sessionNumber,
      'shipment_id': instance.shipmentId,
      'po_id': instance.poId,
      'operator_id': instance.operatorId,
      'total_expected': instance.totalExpected,
      'total_scanned': instance.totalScanned,
      'discrepancies': instance.discrepancies,
      'status': instance.status,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'user_roles': instance.userRoles,
      'purchase_orders': instance.purchaseOrders,
    };
