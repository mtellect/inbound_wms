import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_log_dto.freezed.dart';
part 'scan_log_dto.g.dart';

@freezed
abstract class ScanLogDto with _$ScanLogDto {
  const factory ScanLogDto({
    required String id,
    @JsonKey(name: 'shipment_id') required String shipmentId,
    @JsonKey(name: 'po_item_id') required String poItemId,
    @JsonKey(name: 'user_id') required String userId,
    required int quantity,
    @JsonKey(name: 'lot_number') String? lotNumber,
    @JsonKey(name: 'serial_number') String? serialNumber,
    @JsonKey(name: 'expiry_date') DateTime? expiryDate,
    @JsonKey(name: 'location_id') String? locationId,
    @JsonKey(name: 'scanned_at') DateTime? scannedAt,
  }) = _ScanLogDto;

  factory ScanLogDto.fromJson(Map<String, dynamic> json) => _$ScanLogDtoFromJson(json);
}
