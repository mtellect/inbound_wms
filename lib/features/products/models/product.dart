import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String sku,
    String? barcode,
    required String name,
    String? category,
    String? unit,
    @Default(false) @JsonKey(name: 'requires_lot') bool requiresLot,
    @Default(false) @JsonKey(name: 'requires_serial') bool requiresSerial,
    @Default(false) @JsonKey(name: 'requires_expiry') bool requiresExpiry,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
