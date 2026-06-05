import 'package:freezed_annotation/freezed_annotation.dart';

part 'shipment.freezed.dart';

@freezed
abstract class Shipment with _$Shipment {
  const factory Shipment({
    required String id,
    required String poId,
    String? carrierName,
    String? trackingNumber,
    String? dockDoor,
    DateTime? arrivalTime,
    @Default('expected') String status,
  }) = _Shipment;
}
