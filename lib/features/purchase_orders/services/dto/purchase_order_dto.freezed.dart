// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PurchaseOrderDto {
  String get id;
  @JsonKey(name: 'po_number')
  String get poNumber;
  @JsonKey(name: 'supplier_id')
  String? get supplierId;
  String get status;
  @JsonKey(name: 'blind_receiving')
  bool get blindReceiving;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @JsonKey(name: 'po_items')
  List<PoItemDto> get items;

  /// Create a copy of PurchaseOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseOrderDtoCopyWith<PurchaseOrderDto> get copyWith =>
      _$PurchaseOrderDtoCopyWithImpl<PurchaseOrderDto>(
          this as PurchaseOrderDto, _$identity);

  /// Serializes this PurchaseOrderDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseOrderDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.blindReceiving, blindReceiving) ||
                other.blindReceiving == blindReceiving) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poNumber, supplierId, status,
      blindReceiving, createdAt, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'PurchaseOrderDto(id: $id, poNumber: $poNumber, supplierId: $supplierId, status: $status, blindReceiving: $blindReceiving, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class $PurchaseOrderDtoCopyWith<$Res> {
  factory $PurchaseOrderDtoCopyWith(
          PurchaseOrderDto value, $Res Function(PurchaseOrderDto) _then) =
      _$PurchaseOrderDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'po_number') String poNumber,
      @JsonKey(name: 'supplier_id') String? supplierId,
      String status,
      @JsonKey(name: 'blind_receiving') bool blindReceiving,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'po_items') List<PoItemDto> items});
}

/// @nodoc
class _$PurchaseOrderDtoCopyWithImpl<$Res>
    implements $PurchaseOrderDtoCopyWith<$Res> {
  _$PurchaseOrderDtoCopyWithImpl(this._self, this._then);

  final PurchaseOrderDto _self;
  final $Res Function(PurchaseOrderDto) _then;

  /// Create a copy of PurchaseOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poNumber = null,
    Object? supplierId = freezed,
    Object? status = null,
    Object? blindReceiving = null,
    Object? createdAt = freezed,
    Object? items = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poNumber: null == poNumber
          ? _self.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: freezed == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      blindReceiving: null == blindReceiving
          ? _self.blindReceiving
          : blindReceiving // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PoItemDto>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PurchaseOrderDto].
extension PurchaseOrderDtoPatterns on PurchaseOrderDto {
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
    TResult Function(_PurchaseOrderDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDto() when $default != null:
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
    TResult Function(_PurchaseOrderDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDto():
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
    TResult? Function(_PurchaseOrderDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDto() when $default != null:
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
            @JsonKey(name: 'po_number') String poNumber,
            @JsonKey(name: 'supplier_id') String? supplierId,
            String status,
            @JsonKey(name: 'blind_receiving') bool blindReceiving,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'po_items') List<PoItemDto> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDto() when $default != null:
        return $default(_that.id, _that.poNumber, _that.supplierId,
            _that.status, _that.blindReceiving, _that.createdAt, _that.items);
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
            @JsonKey(name: 'po_number') String poNumber,
            @JsonKey(name: 'supplier_id') String? supplierId,
            String status,
            @JsonKey(name: 'blind_receiving') bool blindReceiving,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'po_items') List<PoItemDto> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDto():
        return $default(_that.id, _that.poNumber, _that.supplierId,
            _that.status, _that.blindReceiving, _that.createdAt, _that.items);
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
            @JsonKey(name: 'po_number') String poNumber,
            @JsonKey(name: 'supplier_id') String? supplierId,
            String status,
            @JsonKey(name: 'blind_receiving') bool blindReceiving,
            @JsonKey(name: 'created_at') DateTime? createdAt,
            @JsonKey(name: 'po_items') List<PoItemDto> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrderDto() when $default != null:
        return $default(_that.id, _that.poNumber, _that.supplierId,
            _that.status, _that.blindReceiving, _that.createdAt, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PurchaseOrderDto implements PurchaseOrderDto {
  const _PurchaseOrderDto(
      {required this.id,
      @JsonKey(name: 'po_number') required this.poNumber,
      @JsonKey(name: 'supplier_id') this.supplierId,
      this.status = 'pending',
      @JsonKey(name: 'blind_receiving') this.blindReceiving = false,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'po_items') final List<PoItemDto> items = const []})
      : _items = items;
  factory _PurchaseOrderDto.fromJson(Map<String, dynamic> json) =>
      _$PurchaseOrderDtoFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'po_number')
  final String poNumber;
  @override
  @JsonKey(name: 'supplier_id')
  final String? supplierId;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey(name: 'blind_receiving')
  final bool blindReceiving;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final List<PoItemDto> _items;
  @override
  @JsonKey(name: 'po_items')
  List<PoItemDto> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of PurchaseOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseOrderDtoCopyWith<_PurchaseOrderDto> get copyWith =>
      __$PurchaseOrderDtoCopyWithImpl<_PurchaseOrderDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PurchaseOrderDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseOrderDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.blindReceiving, blindReceiving) ||
                other.blindReceiving == blindReceiving) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poNumber, supplierId, status,
      blindReceiving, createdAt, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'PurchaseOrderDto(id: $id, poNumber: $poNumber, supplierId: $supplierId, status: $status, blindReceiving: $blindReceiving, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseOrderDtoCopyWith<$Res>
    implements $PurchaseOrderDtoCopyWith<$Res> {
  factory _$PurchaseOrderDtoCopyWith(
          _PurchaseOrderDto value, $Res Function(_PurchaseOrderDto) _then) =
      __$PurchaseOrderDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'po_number') String poNumber,
      @JsonKey(name: 'supplier_id') String? supplierId,
      String status,
      @JsonKey(name: 'blind_receiving') bool blindReceiving,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'po_items') List<PoItemDto> items});
}

/// @nodoc
class __$PurchaseOrderDtoCopyWithImpl<$Res>
    implements _$PurchaseOrderDtoCopyWith<$Res> {
  __$PurchaseOrderDtoCopyWithImpl(this._self, this._then);

  final _PurchaseOrderDto _self;
  final $Res Function(_PurchaseOrderDto) _then;

  /// Create a copy of PurchaseOrderDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? poNumber = null,
    Object? supplierId = freezed,
    Object? status = null,
    Object? blindReceiving = null,
    Object? createdAt = freezed,
    Object? items = null,
  }) {
    return _then(_PurchaseOrderDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poNumber: null == poNumber
          ? _self.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: freezed == supplierId
          ? _self.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      blindReceiving: null == blindReceiving
          ? _self.blindReceiving
          : blindReceiving // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PoItemDto>,
    ));
  }
}

// dart format on
