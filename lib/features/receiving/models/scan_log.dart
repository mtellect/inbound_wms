import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_log.freezed.dart';

@freezed
abstract class ScanLog with _$ScanLog {
  const factory ScanLog({
    required String id,
    required String shipmentId,
    required String poItemId,
    required String userId,
    required int quantity,
    String? lotNumber,
    String? serialNumber,
    DateTime? expiryDate,
    String? locationId,
    DateTime? scannedAt,
  }) = _ScanLog;
}
