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
  String get id;
  String get poNumber;
  String? get supplierId;
  String get status;
  bool get blindReceiving;
  DateTime? get createdAt;
  List<PoItem> get items;

  /// Create a copy of PurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<PurchaseOrder> get copyWith =>
      _$PurchaseOrderCopyWithImpl<PurchaseOrder>(
          this as PurchaseOrder, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PurchaseOrder &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, poNumber, supplierId, status,
      blindReceiving, createdAt, const DeepCollectionEquality().hash(items));

  @override
  String toString() {
    return 'PurchaseOrder(id: $id, poNumber: $poNumber, supplierId: $supplierId, status: $status, blindReceiving: $blindReceiving, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class $PurchaseOrderCopyWith<$Res> {
  factory $PurchaseOrderCopyWith(
          PurchaseOrder value, $Res Function(PurchaseOrder) _then) =
      _$PurchaseOrderCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String poNumber,
      String? supplierId,
      String status,
      bool blindReceiving,
      DateTime? createdAt,
      List<PoItem> items});
}

/// @nodoc
class _$PurchaseOrderCopyWithImpl<$Res>
    implements $PurchaseOrderCopyWith<$Res> {
  _$PurchaseOrderCopyWithImpl(this._self, this._then);

  final PurchaseOrder _self;
  final $Res Function(PurchaseOrder) _then;

  /// Create a copy of PurchaseOrder
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
              as List<PoItem>,
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PurchaseOrder value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrder() when $default != null:
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
    TResult Function(_PurchaseOrder value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrder():
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
    TResult? Function(_PurchaseOrder value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrder() when $default != null:
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
            String poNumber,
            String? supplierId,
            String status,
            bool blindReceiving,
            DateTime? createdAt,
            List<PoItem> items)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrder() when $default != null:
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
            String poNumber,
            String? supplierId,
            String status,
            bool blindReceiving,
            DateTime? createdAt,
            List<PoItem> items)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrder():
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
            String poNumber,
            String? supplierId,
            String status,
            bool blindReceiving,
            DateTime? createdAt,
            List<PoItem> items)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PurchaseOrder() when $default != null:
        return $default(_that.id, _that.poNumber, _that.supplierId,
            _that.status, _that.blindReceiving, _that.createdAt, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PurchaseOrder implements PurchaseOrder {
  const _PurchaseOrder(
      {required this.id,
      required this.poNumber,
      this.supplierId,
      this.status = 'pending',
      this.blindReceiving = false,
      this.createdAt,
      final List<PoItem> items = const []})
      : _items = items;

  @override
  final String id;
  @override
  final String poNumber;
  @override
  final String? supplierId;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final bool blindReceiving;
  @override
  final DateTime? createdAt;
  final List<PoItem> _items;
  @override
  @JsonKey()
  List<PoItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of PurchaseOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PurchaseOrderCopyWith<_PurchaseOrder> get copyWith =>
      __$PurchaseOrderCopyWithImpl<_PurchaseOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PurchaseOrder &&
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

  @override
  int get hashCode => Object.hash(runtimeType, id, poNumber, supplierId, status,
      blindReceiving, createdAt, const DeepCollectionEquality().hash(_items));

  @override
  String toString() {
    return 'PurchaseOrder(id: $id, poNumber: $poNumber, supplierId: $supplierId, status: $status, blindReceiving: $blindReceiving, createdAt: $createdAt, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$PurchaseOrderCopyWith<$Res>
    implements $PurchaseOrderCopyWith<$Res> {
  factory _$PurchaseOrderCopyWith(
          _PurchaseOrder value, $Res Function(_PurchaseOrder) _then) =
      __$PurchaseOrderCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String poNumber,
      String? supplierId,
      String status,
      bool blindReceiving,
      DateTime? createdAt,
      List<PoItem> items});
}

/// @nodoc
class __$PurchaseOrderCopyWithImpl<$Res>
    implements _$PurchaseOrderCopyWith<$Res> {
  __$PurchaseOrderCopyWithImpl(this._self, this._then);

  final _PurchaseOrder _self;
  final $Res Function(_PurchaseOrder) _then;

  /// Create a copy of PurchaseOrder
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
    return _then(_PurchaseOrder(
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
              as List<PoItem>,
    ));
  }
}

// dart format on
