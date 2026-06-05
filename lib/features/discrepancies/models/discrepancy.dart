import 'package:freezed_annotation/freezed_annotation.dart';

part 'discrepancy.freezed.dart';
part 'discrepancy.g.dart';

@freezed
abstract class Discrepancy with _$Discrepancy {
  const factory Discrepancy({
    required String id,
    required String poId,
    required String productId,
    required int expectedQty,
    required int actualQty,
    required String reason,
    @Default('open') String status,
    String? resolutionNotes,
    DateTime? createdAt,
  }) = _Discrepancy;

  factory Discrepancy.fromJson(Map<String, dynamic> json) => _$DiscrepancyFromJson(json);
}
