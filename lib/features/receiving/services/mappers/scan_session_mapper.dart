import 'package:inbound_ms/features/receiving/models/scan_session.dart';
import 'package:inbound_ms/features/receiving/services/dto/scan_session_dto.dart';

class ScanSessionMapper {
  static ScanSession fromDto(ScanSessionDto dto) {
    return ScanSession(
      id: dto.id,
      sessionNumber: dto.sessionNumber,
      shipmentId: dto.shipmentId,
      poId: dto.poId,
      poNumber: dto.purchaseOrders?['po_number'] as String?,
      operatorId: dto.operatorId,
      operatorName: dto.userRoles?['display_name'] as String?,
      totalExpected: dto.totalExpected,
      totalScanned: dto.totalScanned,
      discrepancies: dto.discrepancies,
      startTime: DateTime.parse(dto.startTime),
      endTime: dto.endTime != null ? DateTime.tryParse(dto.endTime!) : null,
      status: dto.status,
    );
  }

  static ScanSessionDto toDto(ScanSession session) {
    return ScanSessionDto(
      id: session.id,
      sessionNumber: session.sessionNumber,
      shipmentId: session.shipmentId,
      poId: session.poId,
      operatorId: session.operatorId,
      totalExpected: session.totalExpected,
      totalScanned: session.totalScanned,
      discrepancies: session.discrepancies,
      status: session.status,
      startTime: session.startTime.toIso8601String(),
      endTime: session.endTime?.toIso8601String(),
    );
  }
}
