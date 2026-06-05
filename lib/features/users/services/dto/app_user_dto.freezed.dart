// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUserDto {

 String get id; String get email;@JsonKey(name: 'display_name') String? get displayName; String get role; String get status;@JsonKey(name: 'last_login') DateTime? get lastLogin;@JsonKey(name: 'requires_password_reset') bool get requiresPasswordReset;
/// Create a copy of AppUserDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserDtoCopyWith<AppUserDto> get copyWith => _$AppUserDtoCopyWithImpl<AppUserDto>(this as AppUserDto, _$identity);

  /// Serializes this AppUserDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.requiresPasswordReset, requiresPasswordReset) || other.requiresPasswordReset == requiresPasswordReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,status,lastLogin,requiresPasswordReset);

@override
String toString() {
  return 'AppUserDto(id: $id, email: $email, displayName: $displayName, role: $role, status: $status, lastLogin: $lastLogin, requiresPasswordReset: $requiresPasswordReset)';
}


}

/// @nodoc
abstract mixin class $AppUserDtoCopyWith<$Res>  {
  factory $AppUserDtoCopyWith(AppUserDto value, $Res Function(AppUserDto) _then) = _$AppUserDtoCopyWithImpl;
@useResult
$Res call({
 String id, String email,@JsonKey(name: 'display_name') String? displayName, String role, String status,@JsonKey(name: 'last_login') DateTime? lastLogin,@JsonKey(name: 'requires_password_reset') bool requiresPasswordReset
});




}
/// @nodoc
class _$AppUserDtoCopyWithImpl<$Res>
    implements $AppUserDtoCopyWith<$Res> {
  _$AppUserDtoCopyWithImpl(this._self, this._then);

  final AppUserDto _self;
  final $Res Function(AppUserDto) _then;

/// Create a copy of AppUserDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? email = null,Object? displayName = freezed,Object? role = null,Object? status = null,Object? lastLogin = freezed,Object? requiresPasswordReset = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,requiresPasswordReset: null == requiresPasswordReset ? _self.requiresPasswordReset : requiresPasswordReset // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUserDto].
extension AppUserDtoPatterns on AppUserDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUserDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUserDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUserDto value)  $default,){
final _that = this;
switch (_that) {
case _AppUserDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUserDto value)?  $default,){
final _that = this;
switch (_that) {
case _AppUserDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'display_name')  String? displayName,  String role,  String status, @JsonKey(name: 'last_login')  DateTime? lastLogin, @JsonKey(name: 'requires_password_reset')  bool requiresPasswordReset)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUserDto() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.status,_that.lastLogin,_that.requiresPasswordReset);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String email, @JsonKey(name: 'display_name')  String? displayName,  String role,  String status, @JsonKey(name: 'last_login')  DateTime? lastLogin, @JsonKey(name: 'requires_password_reset')  bool requiresPasswordReset)  $default,) {final _that = this;
switch (_that) {
case _AppUserDto():
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.status,_that.lastLogin,_that.requiresPasswordReset);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String email, @JsonKey(name: 'display_name')  String? displayName,  String role,  String status, @JsonKey(name: 'last_login')  DateTime? lastLogin, @JsonKey(name: 'requires_password_reset')  bool requiresPasswordReset)?  $default,) {final _that = this;
switch (_that) {
case _AppUserDto() when $default != null:
return $default(_that.id,_that.email,_that.displayName,_that.role,_that.status,_that.lastLogin,_that.requiresPasswordReset);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUserDto implements AppUserDto {
  const _AppUserDto({required this.id, required this.email, @JsonKey(name: 'display_name') this.displayName, required this.role, required this.status, @JsonKey(name: 'last_login') this.lastLogin, @JsonKey(name: 'requires_password_reset') this.requiresPasswordReset = true});
  factory _AppUserDto.fromJson(Map<String, dynamic> json) => _$AppUserDtoFromJson(json);

@override final  String id;
@override final  String email;
@override@JsonKey(name: 'display_name') final  String? displayName;
@override final  String role;
@override final  String status;
@override@JsonKey(name: 'last_login') final  DateTime? lastLogin;
@override@JsonKey(name: 'requires_password_reset') final  bool requiresPasswordReset;

/// Create a copy of AppUserDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserDtoCopyWith<_AppUserDto> get copyWith => __$AppUserDtoCopyWithImpl<_AppUserDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUserDto&&(identical(other.id, id) || other.id == id)&&(identical(other.email, email) || other.email == email)&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.lastLogin, lastLogin) || other.lastLogin == lastLogin)&&(identical(other.requiresPasswordReset, requiresPasswordReset) || other.requiresPasswordReset == requiresPasswordReset));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,email,displayName,role,status,lastLogin,requiresPasswordReset);

@override
String toString() {
  return 'AppUserDto(id: $id, email: $email, displayName: $displayName, role: $role, status: $status, lastLogin: $lastLogin, requiresPasswordReset: $requiresPasswordReset)';
}


}

/// @nodoc
abstract mixin class _$AppUserDtoCopyWith<$Res> implements $AppUserDtoCopyWith<$Res> {
  factory _$AppUserDtoCopyWith(_AppUserDto value, $Res Function(_AppUserDto) _then) = __$AppUserDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String email,@JsonKey(name: 'display_name') String? displayName, String role, String status,@JsonKey(name: 'last_login') DateTime? lastLogin,@JsonKey(name: 'requires_password_reset') bool requiresPasswordReset
});




}
/// @nodoc
class __$AppUserDtoCopyWithImpl<$Res>
    implements _$AppUserDtoCopyWith<$Res> {
  __$AppUserDtoCopyWithImpl(this._self, this._then);

  final _AppUserDto _self;
  final $Res Function(_AppUserDto) _then;

/// Create a copy of AppUserDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? email = null,Object? displayName = freezed,Object? role = null,Object? status = null,Object? lastLogin = freezed,Object? requiresPasswordReset = null,}) {
  return _then(_AppUserDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,displayName: freezed == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,lastLogin: freezed == lastLogin ? _self.lastLogin : lastLogin // ignore: cast_nullable_to_non_nullable
as DateTime?,requiresPasswordReset: null == requiresPasswordReset ? _self.requiresPasswordReset : requiresPasswordReset // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
