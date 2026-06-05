import 'package:inbound_ms/features/purchase_orders/models/purchase_order.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/purchase_order_dto.dart';

class PurchaseOrderMapper {
  static PurchaseOrder fromDto(PurchaseOrderDto dto) {
    return PurchaseOrder(
      id: dto.id,
      poNumber: dto.poNumber,
      supplierId: dto.supplierId,
      status: dto.status,
      blindReceiving: dto.blindReceiving,
      createdAt: dto.createdAt,
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
    );
  }
}
