// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Shipment {

 String get id; String get poId; String? get carrierName; String? get trackingNumber; String? get dockDoor; DateTime? get arrivalTime; String get status;
/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShipmentCopyWith<Shipment> get copyWith => _$ShipmentCopyWithImpl<Shipment>(this as Shipment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Shipment&&(identical(other.id, id) || other.id == id)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.carrierName, carrierName) || other.carrierName == carrierName)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.dockDoor, dockDoor) || other.dockDoor == dockDoor)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,poId,carrierName,trackingNumber,dockDoor,arrivalTime,status);

@override
String toString() {
  return 'Shipment(id: $id, poId: $poId, carrierName: $carrierName, trackingNumber: $trackingNumber, dockDoor: $dockDoor, arrivalTime: $arrivalTime, status: $status)';
}


}

/// @nodoc
abstract mixin class $ShipmentCopyWith<$Res>  {
  factory $ShipmentCopyWith(Shipment value, $Res Function(Shipment) _then) = _$ShipmentCopyWithImpl;
@useResult
$Res call({
 String id, String poId, String? carrierName, String? trackingNumber, String? dockDoor, DateTime? arrivalTime, String status
});




}
/// @nodoc
class _$ShipmentCopyWithImpl<$Res>
    implements $ShipmentCopyWith<$Res> {
  _$ShipmentCopyWithImpl(this._self, this._then);

  final Shipment _self;
  final $Res Function(Shipment) _then;

/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? poId = null,Object? carrierName = freezed,Object? trackingNumber = freezed,Object? dockDoor = freezed,Object? arrivalTime = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poId: null == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String,carrierName: freezed == carrierName ? _self.carrierName : carrierName // ignore: cast_nullable_to_non_nullable
as String?,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,dockDoor: freezed == dockDoor ? _self.dockDoor : dockDoor // ignore: cast_nullable_to_non_nullable
as String?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Shipment].
extension ShipmentPatterns on Shipment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Shipment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Shipment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Shipment value)  $default,){
final _that = this;
switch (_that) {
case _Shipment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Shipment value)?  $default,){
final _that = this;
switch (_that) {
case _Shipment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String poId,  String? carrierName,  String? trackingNumber,  String? dockDoor,  DateTime? arrivalTime,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Shipment() when $default != null:
return $default(_that.id,_that.poId,_that.carrierName,_that.trackingNumber,_that.dockDoor,_that.arrivalTime,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String poId,  String? carrierName,  String? trackingNumber,  String? dockDoor,  DateTime? arrivalTime,  String status)  $default,) {final _that = this;
switch (_that) {
case _Shipment():
return $default(_that.id,_that.poId,_that.carrierName,_that.trackingNumber,_that.dockDoor,_that.arrivalTime,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String poId,  String? carrierName,  String? trackingNumber,  String? dockDoor,  DateTime? arrivalTime,  String status)?  $default,) {final _that = this;
switch (_that) {
case _Shipment() when $default != null:
return $default(_that.id,_that.poId,_that.carrierName,_that.trackingNumber,_that.dockDoor,_that.arrivalTime,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _Shipment implements Shipment {
  const _Shipment({required this.id, required this.poId, this.carrierName, this.trackingNumber, this.dockDoor, this.arrivalTime, this.status = 'expected'});
  

@override final  String id;
@override final  String poId;
@override final  String? carrierName;
@override final  String? trackingNumber;
@override final  String? dockDoor;
@override final  DateTime? arrivalTime;
@override@JsonKey() final  String status;

/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShipmentCopyWith<_Shipment> get copyWith => __$ShipmentCopyWithImpl<_Shipment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Shipment&&(identical(other.id, id) || other.id == id)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.carrierName, carrierName) || other.carrierName == carrierName)&&(identical(other.trackingNumber, trackingNumber) || other.trackingNumber == trackingNumber)&&(identical(other.dockDoor, dockDoor) || other.dockDoor == dockDoor)&&(identical(other.arrivalTime, arrivalTime) || other.arrivalTime == arrivalTime)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,poId,carrierName,trackingNumber,dockDoor,arrivalTime,status);

@override
String toString() {
  return 'Shipment(id: $id, poId: $poId, carrierName: $carrierName, trackingNumber: $trackingNumber, dockDoor: $dockDoor, arrivalTime: $arrivalTime, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ShipmentCopyWith<$Res> implements $ShipmentCopyWith<$Res> {
  factory _$ShipmentCopyWith(_Shipment value, $Res Function(_Shipment) _then) = __$ShipmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String poId, String? carrierName, String? trackingNumber, String? dockDoor, DateTime? arrivalTime, String status
});




}
/// @nodoc
class __$ShipmentCopyWithImpl<$Res>
    implements _$ShipmentCopyWith<$Res> {
  __$ShipmentCopyWithImpl(this._self, this._then);

  final _Shipment _self;
  final $Res Function(_Shipment) _then;

/// Create a copy of Shipment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? poId = null,Object? carrierName = freezed,Object? trackingNumber = freezed,Object? dockDoor = freezed,Object? arrivalTime = freezed,Object? status = null,}) {
  return _then(_Shipment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poId: null == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String,carrierName: freezed == carrierName ? _self.carrierName : carrierName // ignore: cast_nullable_to_non_nullable
as String?,trackingNumber: freezed == trackingNumber ? _self.trackingNumber : trackingNumber // ignore: cast_nullable_to_non_nullable
as String?,dockDoor: freezed == dockDoor ? _self.dockDoor : dockDoor // ignore: cast_nullable_to_non_nullable
as String?,arrivalTime: freezed == arrivalTime ? _self.arrivalTime : arrivalTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
