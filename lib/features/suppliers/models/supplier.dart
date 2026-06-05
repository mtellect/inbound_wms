import 'package:freezed_annotation/freezed_annotation.dart';

part 'supplier.freezed.dart';

@freezed
abstract class Supplier with _$Supplier {
  const factory Supplier({
    required String id,
    required String name,
    required String code,
    String? contactName,
    String? email,
    String? phone,
    @Default('active') String status,
  }) = _Supplier;
}
