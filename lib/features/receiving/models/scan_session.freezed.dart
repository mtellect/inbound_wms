// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ScanSession {

 String get id; String get sessionNumber; String? get shipmentId; String? get poId; String? get poNumber; String? get supplierName; String get operatorId; String? get operatorName; int get totalExpected; int get totalScanned; int get discrepancies; DateTime get startTime; DateTime? get endTime; String get status;
/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanSessionCopyWith<ScanSession> get copyWith => _$ScanSessionCopyWithImpl<ScanSession>(this as ScanSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanSession&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionNumber, sessionNumber) || other.sessionNumber == sessionNumber)&&(identical(other.shipmentId, shipmentId) || other.shipmentId == shipmentId)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.poNumber, poNumber) || other.poNumber == poNumber)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.operatorId, operatorId) || other.operatorId == operatorId)&&(identical(other.operatorName, operatorName) || other.operatorName == operatorName)&&(identical(other.totalExpected, totalExpected) || other.totalExpected == totalExpected)&&(identical(other.totalScanned, totalScanned) || other.totalScanned == totalScanned)&&(identical(other.discrepancies, discrepancies) || other.discrepancies == discrepancies)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,sessionNumber,shipmentId,poId,poNumber,supplierName,operatorId,operatorName,totalExpected,totalScanned,discrepancies,startTime,endTime,status);

@override
String toString() {
  return 'ScanSession(id: $id, sessionNumber: $sessionNumber, shipmentId: $shipmentId, poId: $poId, poNumber: $poNumber, supplierName: $supplierName, operatorId: $operatorId, operatorName: $operatorName, totalExpected: $totalExpected, totalScanned: $totalScanned, discrepancies: $discrepancies, startTime: $startTime, endTime: $endTime, status: $status)';
}


}

/// @nodoc
abstract mixin class $ScanSessionCopyWith<$Res>  {
  factory $ScanSessionCopyWith(ScanSession value, $Res Function(ScanSession) _then) = _$ScanSessionCopyWithImpl;
@useResult
$Res call({
 String id, String sessionNumber, String? shipmentId, String? poId, String? poNumber, String? supplierName, String operatorId, String? operatorName, int totalExpected, int totalScanned, int discrepancies, DateTime startTime, DateTime? endTime, String status
});




}
/// @nodoc
class _$ScanSessionCopyWithImpl<$Res>
    implements $ScanSessionCopyWith<$Res> {
  _$ScanSessionCopyWithImpl(this._self, this._then);

  final ScanSession _self;
  final $Res Function(ScanSession) _then;

/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionNumber = null,Object? shipmentId = freezed,Object? poId = freezed,Object? poNumber = freezed,Object? supplierName = freezed,Object? operatorId = null,Object? operatorName = freezed,Object? totalExpected = null,Object? totalScanned = null,Object? discrepancies = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionNumber: null == sessionNumber ? _self.sessionNumber : sessionNumber // ignore: cast_nullable_to_non_nullable
as String,shipmentId: freezed == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String?,poId: freezed == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String?,poNumber: freezed == poNumber ? _self.poNumber : poNumber // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,operatorId: null == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String,operatorName: freezed == operatorName ? _self.operatorName : operatorName // ignore: cast_nullable_to_non_nullable
as String?,totalExpected: null == totalExpected ? _self.totalExpected : totalExpected // ignore: cast_nullable_to_non_nullable
as int,totalScanned: null == totalScanned ? _self.totalScanned : totalScanned // ignore: cast_nullable_to_non_nullable
as int,discrepancies: null == discrepancies ? _self.discrepancies : discrepancies // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanSession].
extension ScanSessionPatterns on ScanSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanSession value)  $default,){
final _that = this;
switch (_that) {
case _ScanSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanSession value)?  $default,){
final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sessionNumber,  String? shipmentId,  String? poId,  String? poNumber,  String? supplierName,  String operatorId,  String? operatorName,  int totalExpected,  int totalScanned,  int discrepancies,  DateTime startTime,  DateTime? endTime,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
return $default(_that.id,_that.sessionNumber,_that.shipmentId,_that.poId,_that.poNumber,_that.supplierName,_that.operatorId,_that.operatorName,_that.totalExpected,_that.totalScanned,_that.discrepancies,_that.startTime,_that.endTime,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sessionNumber,  String? shipmentId,  String? poId,  String? poNumber,  String? supplierName,  String operatorId,  String? operatorName,  int totalExpected,  int totalScanned,  int discrepancies,  DateTime startTime,  DateTime? endTime,  String status)  $default,) {final _that = this;
switch (_that) {
case _ScanSession():
return $default(_that.id,_that.sessionNumber,_that.shipmentId,_that.poId,_that.poNumber,_that.supplierName,_that.operatorId,_that.operatorName,_that.totalExpected,_that.totalScanned,_that.discrepancies,_that.startTime,_that.endTime,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sessionNumber,  String? shipmentId,  String? poId,  String? poNumber,  String? supplierName,  String operatorId,  String? operatorName,  int totalExpected,  int totalScanned,  int discrepancies,  DateTime startTime,  DateTime? endTime,  String status)?  $default,) {final _that = this;
switch (_that) {
case _ScanSession() when $default != null:
return $default(_that.id,_that.sessionNumber,_that.shipmentId,_that.poId,_that.poNumber,_that.supplierName,_that.operatorId,_that.operatorName,_that.totalExpected,_that.totalScanned,_that.discrepancies,_that.startTime,_that.endTime,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _ScanSession implements ScanSession {
  const _ScanSession({required this.id, required this.sessionNumber, this.shipmentId, this.poId, this.poNumber, this.supplierName, required this.operatorId, this.operatorName, required this.totalExpected, required this.totalScanned, required this.discrepancies, required this.startTime, this.endTime, this.status = 'active'});
  

@override final  String id;
@override final  String sessionNumber;
@override final  String? shipmentId;
@override final  String? poId;
@override final  String? poNumber;
@override final  String? supplierName;
@override final  String operatorId;
@override final  String? operatorName;
@override final  int totalExpected;
@override final  int totalScanned;
@override final  int discrepancies;
@override final  DateTime startTime;
@override final  DateTime? endTime;
@override@JsonKey() final  String status;

/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanSessionCopyWith<_ScanSession> get copyWith => __$ScanSessionCopyWithImpl<_ScanSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanSession&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionNumber, sessionNumber) || other.sessionNumber == sessionNumber)&&(identical(other.shipmentId, shipmentId) || other.shipmentId == shipmentId)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.poNumber, poNumber) || other.poNumber == poNumber)&&(identical(other.supplierName, supplierName) || other.supplierName == supplierName)&&(identical(other.operatorId, operatorId) || other.operatorId == operatorId)&&(identical(other.operatorName, operatorName) || other.operatorName == operatorName)&&(identical(other.totalExpected, totalExpected) || other.totalExpected == totalExpected)&&(identical(other.totalScanned, totalScanned) || other.totalScanned == totalScanned)&&(identical(other.discrepancies, discrepancies) || other.discrepancies == discrepancies)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,id,sessionNumber,shipmentId,poId,poNumber,supplierName,operatorId,operatorName,totalExpected,totalScanned,discrepancies,startTime,endTime,status);

@override
String toString() {
  return 'ScanSession(id: $id, sessionNumber: $sessionNumber, shipmentId: $shipmentId, poId: $poId, poNumber: $poNumber, supplierName: $supplierName, operatorId: $operatorId, operatorName: $operatorName, totalExpected: $totalExpected, totalScanned: $totalScanned, discrepancies: $discrepancies, startTime: $startTime, endTime: $endTime, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ScanSessionCopyWith<$Res> implements $ScanSessionCopyWith<$Res> {
  factory _$ScanSessionCopyWith(_ScanSession value, $Res Function(_ScanSession) _then) = __$ScanSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String sessionNumber, String? shipmentId, String? poId, String? poNumber, String? supplierName, String operatorId, String? operatorName, int totalExpected, int totalScanned, int discrepancies, DateTime startTime, DateTime? endTime, String status
});




}
/// @nodoc
class __$ScanSessionCopyWithImpl<$Res>
    implements _$ScanSessionCopyWith<$Res> {
  __$ScanSessionCopyWithImpl(this._self, this._then);

  final _ScanSession _self;
  final $Res Function(_ScanSession) _then;

/// Create a copy of ScanSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionNumber = null,Object? shipmentId = freezed,Object? poId = freezed,Object? poNumber = freezed,Object? supplierName = freezed,Object? operatorId = null,Object? operatorName = freezed,Object? totalExpected = null,Object? totalScanned = null,Object? discrepancies = null,Object? startTime = null,Object? endTime = freezed,Object? status = null,}) {
  return _then(_ScanSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionNumber: null == sessionNumber ? _self.sessionNumber : sessionNumber // ignore: cast_nullable_to_non_nullable
as String,shipmentId: freezed == shipmentId ? _self.shipmentId : shipmentId // ignore: cast_nullable_to_non_nullable
as String?,poId: freezed == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String?,poNumber: freezed == poNumber ? _self.poNumber : poNumber // ignore: cast_nullable_to_non_nullable
as String?,supplierName: freezed == supplierName ? _self.supplierName : supplierName // ignore: cast_nullable_to_non_nullable
as String?,operatorId: null == operatorId ? _self.operatorId : operatorId // ignore: cast_nullable_to_non_nullable
as String,operatorName: freezed == operatorName ? _self.operatorName : operatorName // ignore: cast_nullable_to_non_nullable
as String?,totalExpected: null == totalExpected ? _self.totalExpected : totalExpected // ignore: cast_nullable_to_non_nullable
as int,totalScanned: null == totalScanned ? _self.totalScanned : totalScanned // ignore: cast_nullable_to_non_nullable
as int,discrepancies: null == discrepancies ? _self.discrepancies : discrepancies // ignore: cast_nullable_to_non_nullable
as int,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
