// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scan_log_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ScanLogDto _$ScanLogDtoFromJson(Map<String, dynamic> json) => _ScanLogDto(
  id: json['id'] as String,
  shipmentId: json['shipment_id'] as String,
  poItemId: json['po_item_id'] as String,
  userId: json['user_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  lotNumber: json['lot_number'] as String?,
  serialNumber: json['serial_number'] as String?,
  expiryDate: json['expiry_date'] == null
      ? null
      : DateTime.parse(json['expiry_date'] as String),
  locationId: json['location_id'] as String?,
  scannedAt: json['scanned_at'] == null
      ? null
      : DateTime.parse(json['scanned_at'] as String),
);

Map<String, dynamic> _$ScanLogDtoToJson(_ScanLogDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shipment_id': instance.shipmentId,
      'po_item_id': instance.poItemId,
      'user_id': instance.userId,
      'quantity': instance.quantity,
      'lot_number': instance.lotNumber,
      'serial_number': instance.serialNumber,
      'expiry_date': instance.expiryDate?.toIso8601String(),
      'location_id': instance.locationId,
      'scanned_at': instance.scannedAt?.toIso8601String(),
    };
