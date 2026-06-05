import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_session.freezed.dart';

@freezed
abstract class ScanSession with _$ScanSession {
  const factory ScanSession({
    required String id,
    required String shipmentId,
    required String supplierName,
    required String operatorId,
    required int totalUnitsExpected,
    required int totalUnitsScanned,
    required int discrepancies,
    required DateTime startTime,
    DateTime? endTime,
    @Default('active') String status,
  }) = _ScanSession;
}
