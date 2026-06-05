import 'package:inbound_ms/features/shipments/models/shipment.dart';
import 'package:inbound_ms/features/shipments/services/dto/shipment_dto.dart';

class ShipmentMapper {
  static Shipment fromDto(ShipmentDto dto) {
    return Shipment(
      id: dto.id,
      poId: dto.poId,
      carrierName: dto.carrierName,
      trackingNumber: dto.trackingNumber,
      dockDoor: dto.dockDoor,
      arrivalTime: dto.arrivalTime,
      status: dto.status,
    );
  }

  static ShipmentDto toDto(Shipment model) {
    return ShipmentDto(
      id: model.id,
      poId: model.poId,
      carrierName: model.carrierName,
      trackingNumber: model.trackingNumber,
      dockDoor: model.dockDoor,
      arrivalTime: model.arrivalTime,
      status: model.status,
    );
  }
}
