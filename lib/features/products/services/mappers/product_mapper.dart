import 'package:inbound_ms/features/products/models/product.dart';
import 'package:inbound_ms/features/products/services/dto/product_dto.dart';

class ProductMapper {
  static Product fromDto(ProductDto dto) {
    return Product(
      id: dto.id,
      sku: dto.sku,
      barcode: dto.barcode,
      name: dto.name,
      category: dto.category,
      unit: dto.unit,
      requiresLot: dto.requiresLot,
      requiresSerial: dto.requiresSerial,
      requiresExpiry: dto.requiresExpiry,
    );
  }

  static ProductDto toDto(Product model) {
    return ProductDto(
      id: model.id,
      sku: model.sku,
      barcode: model.barcode,
      name: model.name,
      category: model.category,
      unit: model.unit,
      requiresLot: model.requiresLot,
      requiresSerial: model.requiresSerial,
      requiresExpiry: model.requiresExpiry,
    );
  }
}
