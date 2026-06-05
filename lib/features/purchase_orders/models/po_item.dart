import 'package:freezed_annotation/freezed_annotation.dart';

part 'po_item.freezed.dart';

@freezed
abstract class PoItem with _$PoItem {
  const factory PoItem({
    required String id,
    required String poId,
    required String productId,
    required int expectedQuantity,
  }) = _PoItem;
}
