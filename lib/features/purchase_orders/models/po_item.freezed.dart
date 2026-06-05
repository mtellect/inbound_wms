// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PoItem {

 String get id; String get poId; String get productId; int get expectedQuantity;
/// Create a copy of PoItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PoItemCopyWith<PoItem> get copyWith => _$PoItemCopyWithImpl<PoItem>(this as PoItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PoItem&&(identical(other.id, id) || other.id == id)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.expectedQuantity, expectedQuantity) || other.expectedQuantity == expectedQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,id,poId,productId,expectedQuantity);

@override
String toString() {
  return 'PoItem(id: $id, poId: $poId, productId: $productId, expectedQuantity: $expectedQuantity)';
}


}

/// @nodoc
abstract mixin class $PoItemCopyWith<$Res>  {
  factory $PoItemCopyWith(PoItem value, $Res Function(PoItem) _then) = _$PoItemCopyWithImpl;
@useResult
$Res call({
 String id, String poId, String productId, int expectedQuantity
});




}
/// @nodoc
class _$PoItemCopyWithImpl<$Res>
    implements $PoItemCopyWith<$Res> {
  _$PoItemCopyWithImpl(this._self, this._then);

  final PoItem _self;
  final $Res Function(PoItem) _then;

/// Create a copy of PoItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? poId = null,Object? productId = null,Object? expectedQuantity = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poId: null == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,expectedQuantity: null == expectedQuantity ? _self.expectedQuantity : expectedQuantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PoItem].
extension PoItemPatterns on PoItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PoItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PoItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PoItem value)  $default,){
final _that = this;
switch (_that) {
case _PoItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PoItem value)?  $default,){
final _that = this;
switch (_that) {
case _PoItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String poId,  String productId,  int expectedQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PoItem() when $default != null:
return $default(_that.id,_that.poId,_that.productId,_that.expectedQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String poId,  String productId,  int expectedQuantity)  $default,) {final _that = this;
switch (_that) {
case _PoItem():
return $default(_that.id,_that.poId,_that.productId,_that.expectedQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String poId,  String productId,  int expectedQuantity)?  $default,) {final _that = this;
switch (_that) {
case _PoItem() when $default != null:
return $default(_that.id,_that.poId,_that.productId,_that.expectedQuantity);case _:
  return null;

}
}

}

/// @nodoc


class _PoItem implements PoItem {
  const _PoItem({required this.id, required this.poId, required this.productId, required this.expectedQuantity});
  

@override final  String id;
@override final  String poId;
@override final  String productId;
@override final  int expectedQuantity;

/// Create a copy of PoItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PoItemCopyWith<_PoItem> get copyWith => __$PoItemCopyWithImpl<_PoItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PoItem&&(identical(other.id, id) || other.id == id)&&(identical(other.poId, poId) || other.poId == poId)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.expectedQuantity, expectedQuantity) || other.expectedQuantity == expectedQuantity));
}


@override
int get hashCode => Object.hash(runtimeType,id,poId,productId,expectedQuantity);

@override
String toString() {
  return 'PoItem(id: $id, poId: $poId, productId: $productId, expectedQuantity: $expectedQuantity)';
}


}

/// @nodoc
abstract mixin class _$PoItemCopyWith<$Res> implements $PoItemCopyWith<$Res> {
  factory _$PoItemCopyWith(_PoItem value, $Res Function(_PoItem) _then) = __$PoItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String poId, String productId, int expectedQuantity
});




}
/// @nodoc
class __$PoItemCopyWithImpl<$Res>
    implements _$PoItemCopyWith<$Res> {
  __$PoItemCopyWithImpl(this._self, this._then);

  final _PoItem _self;
  final $Res Function(_PoItem) _then;

/// Create a copy of PoItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? poId = null,Object? productId = null,Object? expectedQuantity = null,}) {
  return _then(_PoItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,poId: null == poId ? _self.poId : poId // ignore: cast_nullable_to_non_nullable
as String,productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String,expectedQuantity: null == expectedQuantity ? _self.expectedQuantity : expectedQuantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
