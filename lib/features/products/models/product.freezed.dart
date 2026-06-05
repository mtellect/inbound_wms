// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Product {

 String get id; String get sku; String? get barcode; String get name; String? get category; String? get unit; bool get requiresLot; bool get requiresSerial; bool get requiresExpiry;
/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCopyWith<Product> get copyWith => _$ProductCopyWithImpl<Product>(this as Product, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.requiresLot, requiresLot) || other.requiresLot == requiresLot)&&(identical(other.requiresSerial, requiresSerial) || other.requiresSerial == requiresSerial)&&(identical(other.requiresExpiry, requiresExpiry) || other.requiresExpiry == requiresExpiry));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,barcode,name,category,unit,requiresLot,requiresSerial,requiresExpiry);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, barcode: $barcode, name: $name, category: $category, unit: $unit, requiresLot: $requiresLot, requiresSerial: $requiresSerial, requiresExpiry: $requiresExpiry)';
}


}

/// @nodoc
abstract mixin class $ProductCopyWith<$Res>  {
  factory $ProductCopyWith(Product value, $Res Function(Product) _then) = _$ProductCopyWithImpl;
@useResult
$Res call({
 String id, String sku, String? barcode, String name, String? category, String? unit, bool requiresLot, bool requiresSerial, bool requiresExpiry
});




}
/// @nodoc
class _$ProductCopyWithImpl<$Res>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._self, this._then);

  final Product _self;
  final $Res Function(Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sku = null,Object? barcode = freezed,Object? name = null,Object? category = freezed,Object? unit = freezed,Object? requiresLot = null,Object? requiresSerial = null,Object? requiresExpiry = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,requiresLot: null == requiresLot ? _self.requiresLot : requiresLot // ignore: cast_nullable_to_non_nullable
as bool,requiresSerial: null == requiresSerial ? _self.requiresSerial : requiresSerial // ignore: cast_nullable_to_non_nullable
as bool,requiresExpiry: null == requiresExpiry ? _self.requiresExpiry : requiresExpiry // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Product].
extension ProductPatterns on Product {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Product value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Product value)  $default,){
final _that = this;
switch (_that) {
case _Product():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Product value)?  $default,){
final _that = this;
switch (_that) {
case _Product() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String sku,  String? barcode,  String name,  String? category,  String? unit,  bool requiresLot,  bool requiresSerial,  bool requiresExpiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.barcode,_that.name,_that.category,_that.unit,_that.requiresLot,_that.requiresSerial,_that.requiresExpiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String sku,  String? barcode,  String name,  String? category,  String? unit,  bool requiresLot,  bool requiresSerial,  bool requiresExpiry)  $default,) {final _that = this;
switch (_that) {
case _Product():
return $default(_that.id,_that.sku,_that.barcode,_that.name,_that.category,_that.unit,_that.requiresLot,_that.requiresSerial,_that.requiresExpiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String sku,  String? barcode,  String name,  String? category,  String? unit,  bool requiresLot,  bool requiresSerial,  bool requiresExpiry)?  $default,) {final _that = this;
switch (_that) {
case _Product() when $default != null:
return $default(_that.id,_that.sku,_that.barcode,_that.name,_that.category,_that.unit,_that.requiresLot,_that.requiresSerial,_that.requiresExpiry);case _:
  return null;

}
}

}

/// @nodoc


class _Product implements Product {
  const _Product({required this.id, required this.sku, this.barcode, required this.name, this.category, this.unit, this.requiresLot = false, this.requiresSerial = false, this.requiresExpiry = false});
  

@override final  String id;
@override final  String sku;
@override final  String? barcode;
@override final  String name;
@override final  String? category;
@override final  String? unit;
@override@JsonKey() final  bool requiresLot;
@override@JsonKey() final  bool requiresSerial;
@override@JsonKey() final  bool requiresExpiry;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCopyWith<_Product> get copyWith => __$ProductCopyWithImpl<_Product>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Product&&(identical(other.id, id) || other.id == id)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.barcode, barcode) || other.barcode == barcode)&&(identical(other.name, name) || other.name == name)&&(identical(other.category, category) || other.category == category)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.requiresLot, requiresLot) || other.requiresLot == requiresLot)&&(identical(other.requiresSerial, requiresSerial) || other.requiresSerial == requiresSerial)&&(identical(other.requiresExpiry, requiresExpiry) || other.requiresExpiry == requiresExpiry));
}


@override
int get hashCode => Object.hash(runtimeType,id,sku,barcode,name,category,unit,requiresLot,requiresSerial,requiresExpiry);

@override
String toString() {
  return 'Product(id: $id, sku: $sku, barcode: $barcode, name: $name, category: $category, unit: $unit, requiresLot: $requiresLot, requiresSerial: $requiresSerial, requiresExpiry: $requiresExpiry)';
}


}

/// @nodoc
abstract mixin class _$ProductCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$ProductCopyWith(_Product value, $Res Function(_Product) _then) = __$ProductCopyWithImpl;
@override @useResult
$Res call({
 String id, String sku, String? barcode, String name, String? category, String? unit, bool requiresLot, bool requiresSerial, bool requiresExpiry
});




}
/// @nodoc
class __$ProductCopyWithImpl<$Res>
    implements _$ProductCopyWith<$Res> {
  __$ProductCopyWithImpl(this._self, this._then);

  final _Product _self;
  final $Res Function(_Product) _then;

/// Create a copy of Product
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sku = null,Object? barcode = freezed,Object? name = null,Object? category = freezed,Object? unit = freezed,Object? requiresLot = null,Object? requiresSerial = null,Object? requiresExpiry = null,}) {
  return _then(_Product(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as String,barcode: freezed == barcode ? _self.barcode : barcode // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String?,unit: freezed == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String?,requiresLot: null == requiresLot ? _self.requiresLot : requiresLot // ignore: cast_nullable_to_non_nullable
as bool,requiresSerial: null == requiresSerial ? _self.requiresSerial : requiresSerial // ignore: cast_nullable_to_non_nullable
as bool,requiresExpiry: null == requiresExpiry ? _self.requiresExpiry : requiresExpiry // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
