// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supplier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Supplier _$SupplierFromJson(Map<String, dynamic> json) => _Supplier(
  id: json['id'] as String,
  name: json['name'] as String,
  code: json['code'] as String,
  contactName: json['contactName'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$SupplierToJson(_Supplier instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'code': instance.code,
  'contactName': instance.contactName,
  'email': instance.email,
  'phone': instance.phone,
};
