// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipment_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShipmentDto _$ShipmentDtoFromJson(Map<String, dynamic> json) => _ShipmentDto(
  id: json['id'] as String,
  poId: json['po_id'] as String,
  carrierName: json['carrier_name'] as String?,
  trackingNumber: json['tracking_number'] as String?,
  dockDoor: json['dock_door'] as String?,
  arrivalTime: json['arrival_time'] == null
      ? null
      : DateTime.parse(json['arrival_time'] as String),
  status: json['status'] as String? ?? 'expected',
);

Map<String, dynamic> _$ShipmentDtoToJson(_ShipmentDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'po_id': instance.poId,
      'carrier_name': instance.carrierName,
      'tracking_number': instance.trackingNumber,
      'dock_door': instance.dockDoor,
      'arrival_time': instance.arrivalTime?.toIso8601String(),
      'status': instance.status,
    };
