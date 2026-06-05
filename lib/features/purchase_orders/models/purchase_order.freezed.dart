// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseOrder {

 String get id;@JsonKey(name: 'po_number') String get poNumber;@JsonKey(name: 'supplier_id') String? get supplierId; String get status;@JsonKey(name: 'blind_receiving') bool get blindReceiving;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of PurchaseOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PurchaseOrderCopyWith<PurchaseOrder> get copyWith => _$PurchaseOrderCopyWithImpl<PurchaseOrder>(this as PurchaseOrder, _$identity);

  /// Serializes this PurchaseOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PurchaseOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.poNumber, poNumber) || other.poNumber == poNumber)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.status, status) || other.status == status)&&(identical(other.blindReceiving, blindReceiving) || other.blindReceiving == blindReceiving)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,poNumber,supplierId,status,blindReceiving,createdAt);

@override
String toString() {
  return 'PurchaseOrder(id: $id, poNumber: $poNumber, supplierId: $supplierId, status: $status, blindReceiving: $blindReceiving, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PurchaseOrderCopyWith<$Res>  {
  factory $PurchaseOrderCopyWith(PurchaseOrder value, $Res Function(PurchaseOrder) _then) = _$PurchaseOrderCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'po_number') String poNumber,@JsonKey(name: 'supplier_id') String? supplierId, String status,@JsonKey(name: 'blind_receiving') bool blindReceiving,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$PurchaseOrderCopyWithImpl<$Res>
    implements $PurchaseOrderCopyWith<$Res> {
  _$PurchaseOrderCopyWithImpl(this._self, this._then);

  final PurchaseOrder _self;
  final $Res Function(PurchaseOrder) _then;

/// Create a copy of PurchaseOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? poNumber = null,Object? supplierId = freezed,Object? status = null,Object? blindReceiving = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poNumber: null == poNumber ? _self.poNumber : poNumber // ignore: cast_nullable_to_non_nullable
as String,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,blindReceiving: null == blindReceiving ? _self.blindReceiving : blindReceiving // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PurchaseOrder].
extension PurchaseOrderPatterns on PurchaseOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PurchaseOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PurchaseOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PurchaseOrder value)  $default,){
final _that = this;
switch (_that) {
case _PurchaseOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PurchaseOrder value)?  $default,){
final _that = this;
switch (_that) {
case _PurchaseOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'po_number')  String poNumber, @JsonKey(name: 'supplier_id')  String? supplierId,  String status, @JsonKey(name: 'blind_receiving')  bool blindReceiving, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PurchaseOrder() when $default != null:
return $default(_that.id,_that.poNumber,_that.supplierId,_that.status,_that.blindReceiving,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'po_number')  String poNumber, @JsonKey(name: 'supplier_id')  String? supplierId,  String status, @JsonKey(name: 'blind_receiving')  bool blindReceiving, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PurchaseOrder():
return $default(_that.id,_that.poNumber,_that.supplierId,_that.status,_that.blindReceiving,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'po_number')  String poNumber, @JsonKey(name: 'supplier_id')  String? supplierId,  String status, @JsonKey(name: 'blind_receiving')  bool blindReceiving, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PurchaseOrder() when $default != null:
return $default(_that.id,_that.poNumber,_that.supplierId,_that.status,_that.blindReceiving,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PurchaseOrder implements PurchaseOrder {
  const _PurchaseOrder({required this.id, @JsonKey(name: 'po_number') required this.poNumber, @JsonKey(name: 'supplier_id') this.supplierId, this.status = 'pending', @JsonKey(name: 'blind_receiving') this.blindReceiving = false, @JsonKey(name: 'created_at') this.createdAt});
  factory _PurchaseOrder.fromJson(Map<String, dynamic> json) => _$PurchaseOrderFromJson(json);

@override final  String id;
@override@JsonKey(name: 'po_number') final  String poNumber;
@override@JsonKey(name: 'supplier_id') final  String? supplierId;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'blind_receiving') final  bool blindReceiving;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of PurchaseOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PurchaseOrderCopyWith<_PurchaseOrder> get copyWith => __$PurchaseOrderCopyWithImpl<_PurchaseOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PurchaseOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PurchaseOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.poNumber, poNumber) || other.poNumber == poNumber)&&(identical(other.supplierId, supplierId) || other.supplierId == supplierId)&&(identical(other.status, status) || other.status == status)&&(identical(other.blindReceiving, blindReceiving) || other.blindReceiving == blindReceiving)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,poNumber,supplierId,status,blindReceiving,createdAt);

@override
String toString() {
  return 'PurchaseOrder(id: $id, poNumber: $poNumber, supplierId: $supplierId, status: $status, blindReceiving: $blindReceiving, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PurchaseOrderCopyWith<$Res> implements $PurchaseOrderCopyWith<$Res> {
  factory _$PurchaseOrderCopyWith(_PurchaseOrder value, $Res Function(_PurchaseOrder) _then) = __$PurchaseOrderCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'po_number') String poNumber,@JsonKey(name: 'supplier_id') String? supplierId, String status,@JsonKey(name: 'blind_receiving') bool blindReceiving,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$PurchaseOrderCopyWithImpl<$Res>
    implements _$PurchaseOrderCopyWith<$Res> {
  __$PurchaseOrderCopyWithImpl(this._self, this._then);

  final _PurchaseOrder _self;
  final $Res Function(_PurchaseOrder) _then;

/// Create a copy of PurchaseOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? poNumber = null,Object? supplierId = freezed,Object? status = null,Object? blindReceiving = null,Object? createdAt = freezed,}) {
  return _then(_PurchaseOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poNumber: null == poNumber ? _self.poNumber : poNumber // ignore: cast_nullable_to_non_nullable
as String,supplierId: freezed == supplierId ? _self.supplierId : supplierId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,blindReceiving: null == blindReceiving ? _self.blindReceiving : blindReceiving // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
