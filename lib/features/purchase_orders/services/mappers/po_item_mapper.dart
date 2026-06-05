import 'package:inbound_ms/features/purchase_orders/models/po_item.dart';
import 'package:inbound_ms/features/purchase_orders/services/dto/po_item_dto.dart';

class PoItemMapper {
  static PoItem fromDto(PoItemDto dto) {
    return PoItem(
      id: dto.id,
      poId: dto.poId,
      productId: dto.productId,
      expectedQuantity: dto.expectedQuantity,
    );
  }

  static PoItemDto toDto(PoItem model) {
    return PoItemDto(
      id: model.id,
      poId: model.poId,
      productId: model.productId,
      expectedQuantity: model.expectedQuantity,
    );
  }
}
