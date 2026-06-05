import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_session_dto.freezed.dart';
part 'scan_session_dto.g.dart';

@freezed
abstract class ScanSessionDto with _$ScanSessionDto {
  const factory ScanSessionDto({
    required String id,
    @JsonKey(name: 'session_number') required String sessionNumber,
    @JsonKey(name: 'shipment_id') String? shipmentId,
    @JsonKey(name: 'po_id') String? poId,
    @JsonKey(name: 'operator_id') required String operatorId,
    @JsonKey(name: 'total_expected') required int totalExpected,
    @JsonKey(name: 'total_scanned') required int totalScanned,
    required int discrepancies,
    required String status,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') String? endTime,
    
    // Joined relations from Supabase select queries
    @JsonKey(name: 'user_roles') Map<String, dynamic>? userRoles,
    @JsonKey(name: 'purchase_orders') Map<String, dynamic>? purchaseOrders,
  }) = _ScanSessionDto;

  factory ScanSessionDto.fromJson(Map<String, dynamic> json) => _$ScanSessionDtoFromJson(json);
}
