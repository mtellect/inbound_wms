import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
abstract class ProductDto with _$ProductDto {
  const factory ProductDto({
    required String id,
    required String sku,
    required String name,
    String? barcode,
    String? category,
    String? unit,
    @Default(false) @JsonKey(name: 'requires_lot') bool requiresLot,
    @Default(false) @JsonKey(name: 'requires_serial') bool requiresSerial,
    @Default(false) @JsonKey(name: 'requires_expiry') bool requiresExpiry,
  }) = _ProductDto;

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);
}
