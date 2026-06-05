import 'package:inbound_ms/features/receiving/models/scan_log.dart';
import 'package:inbound_ms/features/receiving/services/dto/scan_log_dto.dart';

class ScanLogMapper {
  static ScanLog fromDto(ScanLogDto dto) {
    return ScanLog(
      id: dto.id,
      shipmentId: dto.shipmentId,
      poItemId: dto.poItemId,
      userId: dto.userId,
      quantity: dto.quantity,
      lotNumber: dto.lotNumber,
      serialNumber: dto.serialNumber,
      expiryDate: dto.expiryDate,
      locationId: dto.locationId,
      scannedAt: dto.scannedAt,
    );
  }

  static ScanLogDto toDto(ScanLog model) {
    return ScanLogDto(
      id: model.id,
      shipmentId: model.shipmentId,
      poItemId: model.poItemId,
      userId: model.userId,
      quantity: model.quantity,
      lotNumber: model.lotNumber,
      serialNumber: model.serialNumber,
      expiryDate: model.expiryDate,
      locationId: model.locationId,
      scannedAt: model.scannedAt,
    );
  }
}
