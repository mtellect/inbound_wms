import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment_dto.freezed.dart';
part 'shipment_dto.g.dart';

@freezed
abstract class ShipmentDto with _$ShipmentDto {
  const factory ShipmentDto({
    required String id,
    @JsonKey(name: 'po_id') required String poId,
    @JsonKey(name: 'carrier_name') String? carrierName,
    @JsonKey(name: 'tracking_number') String? trackingNumber,
    @JsonKey(name: 'dock_door') String? dockDoor,
    @JsonKey(name: 'arrival_time') DateTime? arrivalTime,
    @Default('expected') String status,
  }) = _ShipmentDto;

  factory ShipmentDto.fromJson(Map<String, dynamic> json) => _$ShipmentDtoFromJson(json);
}
