// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discrepancy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Discrepancy {

 String get id; String get poId; String get productId; int get expectedQty; int get actualQty; String get reason; String get status; String? get resolutionNotes; DateTime? get createdAt;
/// Create a copy of Discrepancy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiscrepancyCopyWith<Discrepancy> get copyWith => _$DiscrepancyCopyWithImpl<Discrepancy>(this as Discrepancy, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Discrepancy&&(identical(other.id, id) || other.id == id)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.expectedQty, expectedQty) || other.expectedQty == expectedQty)&&(identical(other.actualQty, actualQty) || other.actualQty == actualQty)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,poId,productId,expectedQty,actualQty,reason,status,resolutionNotes,createdAt);

@override
String toString() {
  return 'Discrepancy(id: $id, poId: $poId, productId: $productId, expectedQty: $expectedQty, actualQty: $actualQty, reason: $reason, status: $status, resolutionNotes: $resolutionNotes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $DiscrepancyCopyWith<$Res>  {
  factory $DiscrepancyCopyWith(Discrepancy value, $Res Function(Discrepancy) _then) = _$DiscrepancyCopyWithImpl;
@useResult
$Res call({
 String id, String poId, String productId, int expectedQty, int actualQty, String reason, String status, String? resolutionNotes, DateTime? createdAt
});




}
/// @nodoc
class _$DiscrepancyCopyWithImpl<$Res>
    implements $DiscrepancyCopyWith<$Res> {
  _$DiscrepancyCopyWithImpl(this._self, this._then);

  final Discrepancy _self;
  final $Res Function(Discrepancy) _then;

/// Create a copy of Discrepancy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? poId = null,Object? productId = null,Object? expectedQty = null,Object? actualQty = null,Object? reason = null,Object? status = null,Object? resolutionNotes = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poId: null == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,expectedQty: null == expectedQty ? _self.expectedQty : expectedQty // ignore: cast_nullable_to_non_nullable
as int,actualQty: null == actualQty ? _self.actualQty : actualQty // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Discrepancy].
extension DiscrepancyPatterns on Discrepancy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Discrepancy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Discrepancy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Discrepancy value)  $default,){
final _that = this;
switch (_that) {
case _Discrepancy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Discrepancy value)?  $default,){
final _that = this;
switch (_that) {
case _Discrepancy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String poId,  String productId,  int expectedQty,  int actualQty,  String reason,  String status,  String? resolutionNotes,  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Discrepancy() when $default != null:
return $default(_that.id,_that.poId,_that.productId,_that.expectedQty,_that.actualQty,_that.reason,_that.status,_that.resolutionNotes,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String poId,  String productId,  int expectedQty,  int actualQty,  String reason,  String status,  String? resolutionNotes,  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _Discrepancy():
return $default(_that.id,_that.poId,_that.productId,_that.expectedQty,_that.actualQty,_that.reason,_that.status,_that.resolutionNotes,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String poId,  String productId,  int expectedQty,  int actualQty,  String reason,  String status,  String? resolutionNotes,  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Discrepancy() when $default != null:
return $default(_that.id,_that.poId,_that.productId,_that.expectedQty,_that.actualQty,_that.reason,_that.status,_that.resolutionNotes,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _Discrepancy implements Discrepancy {
  const _Discrepancy({required this.id, required this.poId, required this.productId, required this.expectedQty, required this.actualQty, required this.reason, this.status = 'open', this.resolutionNotes, this.createdAt});
  

@override final  String id;
@override final  String poId;
@override final  String productId;
@override final  int expectedQty;
@override final  int actualQty;
@override final  String reason;
@override@JsonKey() final  String status;
@override final  String? resolutionNotes;
@override final  DateTime? createdAt;

/// Create a copy of Discrepancy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiscrepancyCopyWith<_Discrepancy> get copyWith => __$DiscrepancyCopyWithImpl<_Discrepancy>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Discrepancy&&(identical(other.id, id) || other.id == id)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.expectedQty, expectedQty) || other.expectedQty == expectedQty)&&(identical(other.actualQty, actualQty) || other.actualQty == actualQty)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.status, status) || other.status == status)&&(identical(other.resolutionNotes, resolutionNotes) || other.resolutionNotes == resolutionNotes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,poId,productId,expectedQty,actualQty,reason,status,resolutionNotes,createdAt);

@override
String toString() {
  return 'Discrepancy(id: $id, poId: $poId, productId: $productId, expectedQty: $expectedQty, actualQty: $actualQty, reason: $reason, status: $status, resolutionNotes: $resolutionNotes, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DiscrepancyCopyWith<$Res> implements $DiscrepancyCopyWith<$Res> {
  factory _$DiscrepancyCopyWith(_Discrepancy value, $Res Function(_Discrepancy) _then) = __$DiscrepancyCopyWithImpl;
@override @useResult
$Res call({
 String id, String poId, String productId, int expectedQty, int actualQty, String reason, String status, String? resolutionNotes, DateTime? createdAt
});




}
/// @nodoc
class __$DiscrepancyCopyWithImpl<$Res>
    implements _$DiscrepancyCopyWith<$Res> {
  __$DiscrepancyCopyWithImpl(this._self, this._then);

  final _Discrepancy _self;
  final $Res Function(_Discrepancy) _then;

/// Create a copy of Discrepancy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? poId = null,Object? productId = null,Object? expectedQty = null,Object? actualQty = null,Object? reason = null,Object? status = null,Object? resolutionNotes = freezed,Object? createdAt = freezed,}) {
  return _then(_Discrepancy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poId: null == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,expectedQty: null == expectedQty ? _self.expectedQty : expectedQty // ignore: cast_nullable_to_non_nullable
as int,actualQty: null == actualQty ? _self.actualQty : actualQty // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,resolutionNotes: freezed == resolutionNotes ? _self.resolutionNotes : resolutionNotes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
