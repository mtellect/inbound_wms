// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'po_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PoItemDto {
  String get id;
  @JsonKey(name: 'po_id')
  String get poId;
  @JsonKey(name: 'product_id')
  String get productId;
  @JsonKey(name: 'expected_quantity')
  int get expectedQuantity;
  @JsonKey(name: 'received_quantity')
  int get receivedQuantity;
  @JsonKey(name: 'line_number')
  int? get lineNumber;
  @JsonKey(name: 'products')
  ProductDto? get product;

  /// Create a copy of PoItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PoItemDtoCopyWith<PoItemDto> get copyWith =>
      _$PoItemDtoCopyWithImpl<PoItemDto>(this as PoItemDto, _$identity);

  /// Serializes this PoItemDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PoItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poId, poId) || other.poId == poId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.expectedQuantity, expectedQuantity) ||
                other.expectedQuantity == expectedQuantity) &&
            (identical(other.receivedQuantity, receivedQuantity) ||
                other.receivedQuantity == receivedQuantity) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poId, productId,
      expectedQuantity, receivedQuantity, lineNumber, product);

  @override
  String toString() {
    return 'PoItemDto(id: $id, poId: $poId, productId: $productId, expectedQuantity: $expectedQuantity, receivedQuantity: $receivedQuantity, lineNumber: $lineNumber, product: $product)';
  }
}

/// @nodoc
abstract mixin class $PoItemDtoCopyWith<$Res> {
  factory $PoItemDtoCopyWith(PoItemDto value, $Res Function(PoItemDto) _then) =
      _$PoItemDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'po_id') String poId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'expected_quantity') int expectedQuantity,
      @JsonKey(name: 'received_quantity') int receivedQuantity,
      @JsonKey(name: 'line_number') int? lineNumber,
      @JsonKey(name: 'products') ProductDto? product});

  $ProductDtoCopyWith<$Res>? get product;
}

/// @nodoc
class _$PoItemDtoCopyWithImpl<$Res> implements $PoItemDtoCopyWith<$Res> {
  _$PoItemDtoCopyWithImpl(this._self, this._then);

  final PoItemDto _self;
  final $Res Function(PoItemDto) _then;

  /// Create a copy of PoItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poId = null,
    Object? productId = null,
    Object? expectedQuantity = null,
    Object? receivedQuantity = null,
    Object? lineNumber = freezed,
    Object? product = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poId: null == poId
          ? _self.poId
          : poId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      expectedQuantity: null == expectedQuantity
          ? _self.expectedQuantity
          : expectedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      receivedQuantity: null == receivedQuantity
          ? _self.receivedQuantity
          : receivedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineNumber: freezed == lineNumber
          ? _self.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDto?,
    ));
  }

  /// Create a copy of PoItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductDtoCopyWith<$Res>? get product {
    if (_self.product == null) {
      return null;
    }

    return $ProductDtoCopyWith<$Res>(_self.product!, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PoItemDto].
extension PoItemDtoPatterns on PoItemDto {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PoItemDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PoItemDto() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PoItemDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PoItemDto():
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PoItemDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PoItemDto() when $default != null:
        return $default(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'po_id') String poId,
            @JsonKey(name: 'product_id') String productId,
            @JsonKey(name: 'expected_quantity') int expectedQuantity,
            @JsonKey(name: 'received_quantity') int receivedQuantity,
            @JsonKey(name: 'line_number') int? lineNumber,
            @JsonKey(name: 'products') ProductDto? product)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PoItemDto() when $default != null:
        return $default(
            _that.id,
            _that.poId,
            _that.productId,
            _that.expectedQuantity,
            _that.receivedQuantity,
            _that.lineNumber,
            _that.product);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            @JsonKey(name: 'po_id') String poId,
            @JsonKey(name: 'product_id') String productId,
            @JsonKey(name: 'expected_quantity') int expectedQuantity,
            @JsonKey(name: 'received_quantity') int receivedQuantity,
            @JsonKey(name: 'line_number') int? lineNumber,
            @JsonKey(name: 'products') ProductDto? product)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PoItemDto():
        return $default(
            _that.id,
            _that.poId,
            _that.productId,
            _that.expectedQuantity,
            _that.receivedQuantity,
            _that.lineNumber,
            _that.product);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            @JsonKey(name: 'po_id') String poId,
            @JsonKey(name: 'product_id') String productId,
            @JsonKey(name: 'expected_quantity') int expectedQuantity,
            @JsonKey(name: 'received_quantity') int receivedQuantity,
            @JsonKey(name: 'line_number') int? lineNumber,
            @JsonKey(name: 'products') ProductDto? product)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PoItemDto() when $default != null:
        return $default(
            _that.id,
            _that.poId,
            _that.productId,
            _that.expectedQuantity,
            _that.receivedQuantity,
            _that.lineNumber,
            _that.product);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PoItemDto implements PoItemDto {
  const _PoItemDto(
      {required this.id,
      @JsonKey(name: 'po_id') required this.poId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'expected_quantity') required this.expectedQuantity,
      @JsonKey(name: 'received_quantity') this.receivedQuantity = 0,
      @JsonKey(name: 'line_number') this.lineNumber,
      @JsonKey(name: 'products') this.product});
  factory _PoItemDto.fromJson(Map<String, dynamic> json) =>
      _$PoItemDtoFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'po_id')
  final String poId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'expected_quantity')
  final int expectedQuantity;
  @override
  @JsonKey(name: 'received_quantity')
  final int receivedQuantity;
  @override
  @JsonKey(name: 'line_number')
  final int? lineNumber;
  @override
  @JsonKey(name: 'products')
  final ProductDto? product;

  /// Create a copy of PoItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PoItemDtoCopyWith<_PoItemDto> get copyWith =>
      __$PoItemDtoCopyWithImpl<_PoItemDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PoItemDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PoItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poId, poId) || other.poId == poId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.expectedQuantity, expectedQuantity) ||
                other.expectedQuantity == expectedQuantity) &&
            (identical(other.receivedQuantity, receivedQuantity) ||
                other.receivedQuantity == receivedQuantity) &&
            (identical(other.lineNumber, lineNumber) ||
                other.lineNumber == lineNumber) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poId, productId,
      expectedQuantity, receivedQuantity, lineNumber, product);

  @override
  String toString() {
    return 'PoItemDto(id: $id, poId: $poId, productId: $productId, expectedQuantity: $expectedQuantity, receivedQuantity: $receivedQuantity, lineNumber: $lineNumber, product: $product)';
  }
}

/// @nodoc
abstract mixin class _$PoItemDtoCopyWith<$Res>
    implements $PoItemDtoCopyWith<$Res> {
  factory _$PoItemDtoCopyWith(
          _PoItemDto value, $Res Function(_PoItemDto) _then) =
      __$PoItemDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'po_id') String poId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'expected_quantity') int expectedQuantity,
      @JsonKey(name: 'received_quantity') int receivedQuantity,
      @JsonKey(name: 'line_number') int? lineNumber,
      @JsonKey(name: 'products') ProductDto? product});

  @override
  $ProductDtoCopyWith<$Res>? get product;
}

/// @nodoc
class __$PoItemDtoCopyWithImpl<$Res> implements _$PoItemDtoCopyWith<$Res> {
  __$PoItemDtoCopyWithImpl(this._self, this._then);

  final _PoItemDto _self;
  final $Res Function(_PoItemDto) _then;

  /// Create a copy of PoItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? poId = null,
    Object? productId = null,
    Object? expectedQuantity = null,
    Object? receivedQuantity = null,
    Object? lineNumber = freezed,
    Object? product = freezed,
  }) {
    return _then(_PoItemDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poId: null == poId
          ? _self.poId
          : poId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _self.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      expectedQuantity: null == expectedQuantity
          ? _self.expectedQuantity
          : expectedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      receivedQuantity: null == receivedQuantity
          ? _self.receivedQuantity
          : receivedQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      lineNumber: freezed == lineNumber
          ? _self.lineNumber
          : lineNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductDto?,
    ));
  }

  /// Create a copy of PoItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductDtoCopyWith<$Res>? get product {
    if (_self.product == null) {
      return null;
    }

    return $ProductDtoCopyWith<$Res>(_self.product!, (value) {
      return _then(_self.copyWith(product: value));
    });
  }
}

// dart format on
