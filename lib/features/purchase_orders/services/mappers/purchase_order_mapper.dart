import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:inbound_ms/features/purchase_orders/models/product.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/purchase_order_dto.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/po_item_dto.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/product_dto.dart';

class PurchaseOrderMapper {
  static PurchaseOrder fromDto(PurchaseOrderDto dto) {
    return PurchaseOrder(
      id: dto.id,
      poNumber: dto.poNumber,
      supplierId: dto.supplierId,
      supplierName: null, // Fetched differently or ignored after import
      status: dto.status,
      blindReceiving: dto.blindReceiving,
      createdAt: dto.createdAt,
      items: dto.items.map((i) => PoItemMapper.fromDto(i)).toList(),
    );
  }

  static PurchaseOrderDto toDto(PurchaseOrder model) {
    return PurchaseOrderDto(
      id: model.id,
      poNumber: model.poNumber,
      supplierId: model.supplierId,
      status: model.status,
      blindReceiving: model.blindReceiving,
      createdAt: model.createdAt,
      items: model.items.map((i) => PoItemMapper.toDto(i)).toList(),
    );
  }
}

class PoItemMapper {
  static PoItem fromDto(PoItemDto dto) {
    return PoItem(
      id: dto.id,
      poId: dto.poId,
      productId: dto.productId,
      expectedQuantity: dto.expectedQuantity,
      receivedQuantity: dto.receivedQuantity,
      lineNumber: dto.lineNumber,
      product: dto.product != null ? ProductMapper.fromDto(dto.product!) : null,
    );
  }

  static PoItemDto toDto(PoItem model) {
    return PoItemDto(
      id: model.id,
      poId: model.poId,
      productId: model.productId,
      expectedQuantity: model.expectedQuantity,
      receivedQuantity: model.receivedQuantity,
      lineNumber: model.lineNumber,
      product: model.product != null ? ProductMapper.toDto(model.product!) : null,
    );
  }
}

class ProductMapper {
  static Product fromDto(ProductDto dto) {
    return Product(
      id: dto.id,
      sku: dto.sku,
      name: dto.name,
      barcode: dto.barcode,
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
      name: model.name,
      barcode: model.barcode,
      category: model.category,
      unit: model.unit,
      requiresLot: model.requiresLot,
      requiresSerial: model.requiresSerial,
      requiresExpiry: model.requiresExpiry,
    );
  }
}
