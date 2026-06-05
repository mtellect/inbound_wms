import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inbound_ms/features/purchase_orders/models/product.dart';

part 'po_item.freezed.dart';

@freezed
abstract class PoItem with _$PoItem {
  const factory PoItem({
    required String id,
    required String poId,
    required String productId,
    required int expectedQuantity,
    @Default(0) int receivedQuantity,
    int? lineNumber,
    Product? product,
  }) = _PoItem;
}
