import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required String sku,
    required String name,
    String? barcode,
    String? category,
    String? unit,
    @Default(false) bool requiresLot,
    @Default(false) bool requiresSerial,
    @Default(false) bool requiresExpiry,
  }) = _Product;
}
