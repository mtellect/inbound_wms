import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_dto.freezed.dart';
part 'app_user_dto.g.dart';

@freezed
abstract class AppUserDto with _$AppUserDto {
  const factory AppUserDto({
    required String id,
    required String email,
    @JsonKey(name: 'display_name') String? displayName,
    required String role,
    required String status,
    @JsonKey(name: 'last_login') String? lastLogin,
  }) = _AppUserDto;

  factory AppUserDto.fromJson(Map<String, dynamic> json) => _$AppUserDtoFromJson(json);
}
