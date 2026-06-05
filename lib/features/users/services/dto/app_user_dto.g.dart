// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUserDto _$AppUserDtoFromJson(Map<String, dynamic> json) => _AppUserDto(
  id: json['id'] as String,
  email: json['email'] as String,
  displayName: json['display_name'] as String?,
  role: json['role'] as String,
  status: json['status'] as String,
  lastLogin: json['last_login'] as String?,
);

Map<String, dynamic> _$AppUserDtoToJson(_AppUserDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'display_name': instance.displayName,
      'role': instance.role,
      'status': instance.status,
      'last_login': instance.lastLogin,
    };
