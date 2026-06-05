// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanSessionDto {

 String get id;@JsonKey(name: 'session_number') String get sessionNumber;@JsonKey(name: 'shipment_id') String? get shipmentId;@JsonKey(name: 'po_id') String? get poId;@JsonKey(name: 'operator_id') String get operatorId;@JsonKey(name: 'total_expected') int get totalExpected;@JsonKey(name: 'total_scanned') int get totalScanned; int get discrepancies; String get status;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String? get endTime;// Joined relations from Supabase select queries
@JsonKey(name: 'user_roles') Map<String, dynamic>? get userRoles;@JsonKey(name: 'purchase_orders') Map<String, dynamic>? get purchaseOrders;
/// Create a copy of ScanSessionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanSessionDtoCopyWith<ScanSessionDto> get copyWith => _$ScanSessionDtoCopyWithImpl<ScanSessionDto>(this as ScanSessionDto, _$identity);

  /// Serializes this ScanSessionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionNumber, sessionNumber) || other.sessionNumber == sessionNumber)&&(identical(other.shipmentId, shipmentId) || other.shipmentId == shipmentId)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.operatorId, operatorId) || other.operatorId == operatorId)&&(identical(other.totalExpected, totalExpected) || other.totalExpected == totalExpected)&&(identical(other.totalScanned, totalScanned) || other.totalScanned == totalScanned)&&(identical(other.discrepancies, discrepancies) || other.discrepancies == discrepancies)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other.userRoles, userRoles)&&const DeepCollectionEquality().equals(other.purchaseOrders, purchaseOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionNumber,shipmentId,poId,operatorId,totalExpected,totalScanned,discrepancies,status,startTime,endTime,const DeepCollectionEquality().hash(userRoles),const DeepCollectionEquality().hash(purchaseOrders));

@override
String toString() {
  return 'ScanSessionDto(id: $id, sessionNumber: $sessionNumber, shipmentId: $shipmentId, poId: $poId, operatorId: $operatorId, totalExpected: $totalExpected, totalScanned: $totalScanned, discrepancies: $discrepancies, status: $status, startTime: $startTime, endTime: $endTime, userRoles: $userRoles, purchaseOrders: $purchaseOrders)';
}


}

/// @nodoc
abstract mixin class $ScanSessionDtoCopyWith<$Res>  {
  factory $ScanSessionDtoCopyWith(ScanSessionDto value, $Res Function(ScanSessionDto) _then) = _$ScanSessionDtoCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'session_number') String sessionNumber,@JsonKey(name: 'shipment_id') String? shipmentId,@JsonKey(name: 'po_id') String? poId,@JsonKey(name: 'operator_id') String operatorId,@JsonKey(name: 'total_expected') int totalExpected,@JsonKey(name: 'total_scanned') int totalScanned, int discrepancies, String status,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'user_roles') Map<String, dynamic>? userRoles,@JsonKey(name: 'purchase_orders') Map<String, dynamic>? purchaseOrders
});




}
/// @nodoc
class _$ScanSessionDtoCopyWithImpl<$Res>
    implements $ScanSessionDtoCopyWith<$Res> {
  _$ScanSessionDtoCopyWithImpl(this._self, this._then);

  final ScanSessionDto _self;
  final $Res Function(ScanSessionDto) _then;

/// Create a copy of ScanSessionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionNumber = null,Object? shipmentId = freezed,Object? poId = freezed,Object? operatorId = null,Object? totalExpected = null,Object? totalScanned = null,Object? discrepancies = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? userRoles = freezed,Object? purchaseOrders = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionNumber: null == sessionNumber ? _self.sessionNumber : sessionNumber // ignore: cast_nullable_to_non_nullable
as String,shipmentId: freezed == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String?,poId: freezed == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String?,operatorId: null == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String,totalExpected: null == totalExpected ? _self.totalExpected : totalExpected // ignore: cast_nullable_to_non_nullable
as int,totalScanned: null == totalScanned ? _self.totalScanned : totalScanned // ignore: cast_nullable_to_non_nullable
as int,discrepancies: null == discrepancies ? _self.discrepancies : discrepancies // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,userRoles: freezed == userRoles ? _self.userRoles : userRoles // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,purchaseOrders: freezed == purchaseOrders ? _self.purchaseOrders : purchaseOrders // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanSessionDto].
extension ScanSessionDtoPatterns on ScanSessionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanSessionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanSessionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanSessionDto value)  $default,){
final _that = this;
switch (_that) {
case _ScanSessionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanSessionDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScanSessionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_number')  String sessionNumber, @JsonKey(name: 'shipment_id')  String? shipmentId, @JsonKey(name: 'po_id')  String? poId, @JsonKey(name: 'operator_id')  String operatorId, @JsonKey(name: 'total_expected')  int totalExpected, @JsonKey(name: 'total_scanned')  int totalScanned,  int discrepancies,  String status, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'user_roles')  Map<String, dynamic>? userRoles, @JsonKey(name: 'purchase_orders')  Map<String, dynamic>? purchaseOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanSessionDto() when $default != null:
return $default(_that.id,_that.sessionNumber,_that.shipmentId,_that.poId,_that.operatorId,_that.totalExpected,_that.totalScanned,_that.discrepancies,_that.status,_that.startTime,_that.endTime,_that.userRoles,_that.purchaseOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_number')  String sessionNumber, @JsonKey(name: 'shipment_id')  String? shipmentId, @JsonKey(name: 'po_id')  String? poId, @JsonKey(name: 'operator_id')  String operatorId, @JsonKey(name: 'total_expected')  int totalExpected, @JsonKey(name: 'total_scanned')  int totalScanned,  int discrepancies,  String status, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'user_roles')  Map<String, dynamic>? userRoles, @JsonKey(name: 'purchase_orders')  Map<String, dynamic>? purchaseOrders)  $default,) {final _that = this;
switch (_that) {
case _ScanSessionDto():
return $default(_that.id,_that.sessionNumber,_that.shipmentId,_that.poId,_that.operatorId,_that.totalExpected,_that.totalScanned,_that.discrepancies,_that.status,_that.startTime,_that.endTime,_that.userRoles,_that.purchaseOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'session_number')  String sessionNumber, @JsonKey(name: 'shipment_id')  String? shipmentId, @JsonKey(name: 'po_id')  String? poId, @JsonKey(name: 'operator_id')  String operatorId, @JsonKey(name: 'total_expected')  int totalExpected, @JsonKey(name: 'total_scanned')  int totalScanned,  int discrepancies,  String status, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'user_roles')  Map<String, dynamic>? userRoles, @JsonKey(name: 'purchase_orders')  Map<String, dynamic>? purchaseOrders)?  $default,) {final _that = this;
switch (_that) {
case _ScanSessionDto() when $default != null:
return $default(_that.id,_that.sessionNumber,_that.shipmentId,_that.poId,_that.operatorId,_that.totalExpected,_that.totalScanned,_that.discrepancies,_that.status,_that.startTime,_that.endTime,_that.userRoles,_that.purchaseOrders);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanSessionDto implements ScanSessionDto {
  const _ScanSessionDto({required this.id, @JsonKey(name: 'session_number') required this.sessionNumber, @JsonKey(name: 'shipment_id') this.shipmentId, @JsonKey(name: 'po_id') this.poId, @JsonKey(name: 'operator_id') required this.operatorId, @JsonKey(name: 'total_expected') required this.totalExpected, @JsonKey(name: 'total_scanned') required this.totalScanned, required this.discrepancies, required this.status, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') this.endTime, @JsonKey(name: 'user_roles') final  Map<String, dynamic>? userRoles, @JsonKey(name: 'purchase_orders') final  Map<String, dynamic>? purchaseOrders}): _userRoles = userRoles,_purchaseOrders = purchaseOrders;
  factory _ScanSessionDto.fromJson(Map<String, dynamic> json) => _$ScanSessionDtoFromJson(json);

@override final  String id;
@override@JsonKey(name: 'session_number') final  String sessionNumber;
@override@JsonKey(name: 'shipment_id') final  String? shipmentId;
@override@JsonKey(name: 'po_id') final  String? poId;
@override@JsonKey(name: 'operator_id') final  String operatorId;
@override@JsonKey(name: 'total_expected') final  int totalExpected;
@override@JsonKey(name: 'total_scanned') final  int totalScanned;
@override final  int discrepancies;
@override final  String status;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String? endTime;
// Joined relations from Supabase select queries
 final  Map<String, dynamic>? _userRoles;
// Joined relations from Supabase select queries
@override@JsonKey(name: 'user_roles') Map<String, dynamic>? get userRoles {
  final value = _userRoles;
  if (value == null) return null;
  if (_userRoles is EqualUnmodifiableMapView) return _userRoles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _purchaseOrders;
@override@JsonKey(name: 'purchase_orders') Map<String, dynamic>? get purchaseOrders {
  final value = _purchaseOrders;
  if (value == null) return null;
  if (_purchaseOrders is EqualUnmodifiableMapView) return _purchaseOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ScanSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanSessionDtoCopyWith<_ScanSessionDto> get copyWith => __$ScanSessionDtoCopyWithImpl<_ScanSessionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanSessionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanSessionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionNumber, sessionNumber) || other.sessionNumber == sessionNumber)&&(identical(other.shipmentId, shipmentId) || other.shipmentId == shipmentId)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.operatorId, operatorId) || other.operatorId == operatorId)&&(identical(other.totalExpected, totalExpected) || other.totalExpected == totalExpected)&&(identical(other.totalScanned, totalScanned) || other.totalScanned == totalScanned)&&(identical(other.discrepancies, discrepancies) || other.discrepancies == discrepancies)&&(identical(other.status, status) || other.status == status)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&const DeepCollectionEquality().equals(other._userRoles, _userRoles)&&const DeepCollectionEquality().equals(other._purchaseOrders, _purchaseOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionNumber,shipmentId,poId,operatorId,totalExpected,totalScanned,discrepancies,status,startTime,endTime,const DeepCollectionEquality().hash(_userRoles),const DeepCollectionEquality().hash(_purchaseOrders));

@override
String toString() {
  return 'ScanSessionDto(id: $id, sessionNumber: $sessionNumber, shipmentId: $shipmentId, poId: $poId, operatorId: $operatorId, totalExpected: $totalExpected, totalScanned: $totalScanned, discrepancies: $discrepancies, status: $status, startTime: $startTime, endTime: $endTime, userRoles: $userRoles, purchaseOrders: $purchaseOrders)';
}


}

/// @nodoc
abstract mixin class _$ScanSessionDtoCopyWith<$Res> implements $ScanSessionDtoCopyWith<$Res> {
  factory _$ScanSessionDtoCopyWith(_ScanSessionDto value, $Res Function(_ScanSessionDto) _then) = __$ScanSessionDtoCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'session_number') String sessionNumber,@JsonKey(name: 'shipment_id') String? shipmentId,@JsonKey(name: 'po_id') String? poId,@JsonKey(name: 'operator_id') String operatorId,@JsonKey(name: 'total_expected') int totalExpected,@JsonKey(name: 'total_scanned') int totalScanned, int discrepancies, String status,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'user_roles') Map<String, dynamic>? userRoles,@JsonKey(name: 'purchase_orders') Map<String, dynamic>? purchaseOrders
});




}
/// @nodoc
class __$ScanSessionDtoCopyWithImpl<$Res>
    implements _$ScanSessionDtoCopyWith<$Res> {
  __$ScanSessionDtoCopyWithImpl(this._self, this._then);

  final _ScanSessionDto _self;
  final $Res Function(_ScanSessionDto) _then;

/// Create a copy of ScanSessionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionNumber = null,Object? shipmentId = freezed,Object? poId = freezed,Object? operatorId = null,Object? totalExpected = null,Object? totalScanned = null,Object? discrepancies = null,Object? status = null,Object? startTime = null,Object? endTime = freezed,Object? userRoles = freezed,Object? purchaseOrders = freezed,}) {
  return _then(_ScanSessionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionNumber: null == sessionNumber ? _self.sessionNumber : sessionNumber // ignore: cast_nullable_to_non_nullable
as String,shipmentId: freezed == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String?,poId: freezed == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String?,operatorId: null == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String,totalExpected: null == totalExpected ? _self.totalExpected : totalExpected // ignore: cast_nullable_to_non_nullable
as int,totalScanned: null == totalScanned ? _self.totalScanned : totalScanned // ignore: cast_nullable_to_non_nullable
as int,discrepancies: null == discrepancies ? _self.discrepancies : discrepancies // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,userRoles: freezed == userRoles ? _self._userRoles : userRoles // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,purchaseOrders: freezed == purchaseOrders ? _self._purchaseOrders : purchaseOrders // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
