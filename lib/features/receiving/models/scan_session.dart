import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_session.freezed.dart';

@freezed
abstract class ScanSession with _$ScanSession {
  const factory ScanSession({
    required String id,
    required String sessionNumber,
    String? shipmentId,
    String? poId,
    String? poNumber,
    String? supplierName,
    required String operatorId,
    String? operatorName,
    required int totalExpected,
    required int totalScanned,
    required int discrepancies,
    required DateTime startTime,
    DateTime? endTime,
    @Default('active') String status,
  }) = _ScanSession;
}
