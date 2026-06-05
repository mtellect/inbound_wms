// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanLog {
  String get id;
  String get shipmentId;
  String get poItemId;
  String get userId;
  int get quantity;
  String? get lotNumber;
  String? get serialNumber;
  DateTime? get expiryDate;
  String? get locationId;
  DateTime? get scannedAt;

  /// Create a copy of ScanLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScanLogCopyWith<ScanLog> get copyWith =>
      _$ScanLogCopyWithImpl<ScanLog>(this as ScanLog, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScanLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shipmentId, shipmentId) ||
                other.shipmentId == shipmentId) &&
            (identical(other.poItemId, poItemId) ||
                other.poItemId == poItemId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.scannedAt, scannedAt) ||
                other.scannedAt == scannedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, shipmentId, poItemId, userId,
      quantity, lotNumber, serialNumber, expiryDate, locationId, scannedAt);

  @override
  String toString() {
    return 'ScanLog(id: $id, shipmentId: $shipmentId, poItemId: $poItemId, userId: $userId, quantity: $quantity, lotNumber: $lotNumber, serialNumber: $serialNumber, expiryDate: $expiryDate, locationId: $locationId, scannedAt: $scannedAt)';
  }
}

/// @nodoc
abstract mixin class $ScanLogCopyWith<$Res> {
  factory $ScanLogCopyWith(ScanLog value, $Res Function(ScanLog) _then) =
      _$ScanLogCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String shipmentId,
      String poItemId,
      String userId,
      int quantity,
      String? lotNumber,
      String? serialNumber,
      DateTime? expiryDate,
      String? locationId,
      DateTime? scannedAt});
}

/// @nodoc
class _$ScanLogCopyWithImpl<$Res> implements $ScanLogCopyWith<$Res> {
  _$ScanLogCopyWithImpl(this._self, this._then);

  final ScanLog _self;
  final $Res Function(ScanLog) _then;

  /// Create a copy of ScanLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? shipmentId = null,
    Object? poItemId = null,
    Object? userId = null,
    Object? quantity = null,
    Object? lotNumber = freezed,
    Object? serialNumber = freezed,
    Object? expiryDate = freezed,
    Object? locationId = freezed,
    Object? scannedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentId: null == shipmentId
          ? _self.shipmentId
          : shipmentId // ignore: cast_nullable_to_non_nullable
              as String,
      poItemId: null == poItemId
          ? _self.poItemId
          : poItemId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      lotNumber: freezed == lotNumber
          ? _self.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _self.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedAt: freezed == scannedAt
          ? _self.scannedAt
          : scannedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [ScanLog].
extension ScanLogPatterns on ScanLog {
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
    TResult Function(_ScanLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScanLog() when $default != null:
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
    TResult Function(_ScanLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLog():
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
    TResult? Function(_ScanLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLog() when $default != null:
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
            String shipmentId,
            String poItemId,
            String userId,
            int quantity,
            String? lotNumber,
            String? serialNumber,
            DateTime? expiryDate,
            String? locationId,
            DateTime? scannedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScanLog() when $default != null:
        return $default(
            _that.id,
            _that.shipmentId,
            _that.poItemId,
            _that.userId,
            _that.quantity,
            _that.lotNumber,
            _that.serialNumber,
            _that.expiryDate,
            _that.locationId,
            _that.scannedAt);
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
            String shipmentId,
            String poItemId,
            String userId,
            int quantity,
            String? lotNumber,
            String? serialNumber,
            DateTime? expiryDate,
            String? locationId,
            DateTime? scannedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLog():
        return $default(
            _that.id,
            _that.shipmentId,
            _that.poItemId,
            _that.userId,
            _that.quantity,
            _that.lotNumber,
            _that.serialNumber,
            _that.expiryDate,
            _that.locationId,
            _that.scannedAt);
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
            String shipmentId,
            String poItemId,
            String userId,
            int quantity,
            String? lotNumber,
            String? serialNumber,
            DateTime? expiryDate,
            String? locationId,
            DateTime? scannedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLog() when $default != null:
        return $default(
            _that.id,
            _that.shipmentId,
            _that.poItemId,
            _that.userId,
            _that.quantity,
            _that.lotNumber,
            _that.serialNumber,
            _that.expiryDate,
            _that.locationId,
            _that.scannedAt);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ScanLog implements ScanLog {
  const _ScanLog(
      {required this.id,
      required this.shipmentId,
      required this.poItemId,
      required this.userId,
      required this.quantity,
      this.lotNumber,
      this.serialNumber,
      this.expiryDate,
      this.locationId,
      this.scannedAt});

  @override
  final String id;
  @override
  final String shipmentId;
  @override
  final String poItemId;
  @override
  final String userId;
  @override
  final int quantity;
  @override
  final String? lotNumber;
  @override
  final String? serialNumber;
  @override
  final DateTime? expiryDate;
  @override
  final String? locationId;
  @override
  final DateTime? scannedAt;

  /// Create a copy of ScanLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScanLogCopyWith<_ScanLog> get copyWith =>
      __$ScanLogCopyWithImpl<_ScanLog>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScanLog &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.shipmentId, shipmentId) ||
                other.shipmentId == shipmentId) &&
            (identical(other.poItemId, poItemId) ||
                other.poItemId == poItemId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.lotNumber, lotNumber) ||
                other.lotNumber == lotNumber) &&
            (identical(other.serialNumber, serialNumber) ||
                other.serialNumber == serialNumber) &&
            (identical(other.expiryDate, expiryDate) ||
                other.expiryDate == expiryDate) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.scannedAt, scannedAt) ||
                other.scannedAt == scannedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, shipmentId, poItemId, userId,
      quantity, lotNumber, serialNumber, expiryDate, locationId, scannedAt);

  @override
  String toString() {
    return 'ScanLog(id: $id, shipmentId: $shipmentId, poItemId: $poItemId, userId: $userId, quantity: $quantity, lotNumber: $lotNumber, serialNumber: $serialNumber, expiryDate: $expiryDate, locationId: $locationId, scannedAt: $scannedAt)';
  }
}

/// @nodoc
abstract mixin class _$ScanLogCopyWith<$Res> implements $ScanLogCopyWith<$Res> {
  factory _$ScanLogCopyWith(_ScanLog value, $Res Function(_ScanLog) _then) =
      __$ScanLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String shipmentId,
      String poItemId,
      String userId,
      int quantity,
      String? lotNumber,
      String? serialNumber,
      DateTime? expiryDate,
      String? locationId,
      DateTime? scannedAt});
}

/// @nodoc
class __$ScanLogCopyWithImpl<$Res> implements _$ScanLogCopyWith<$Res> {
  __$ScanLogCopyWithImpl(this._self, this._then);

  final _ScanLog _self;
  final $Res Function(_ScanLog) _then;

  /// Create a copy of ScanLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? shipmentId = null,
    Object? poItemId = null,
    Object? userId = null,
    Object? quantity = null,
    Object? lotNumber = freezed,
    Object? serialNumber = freezed,
    Object? expiryDate = freezed,
    Object? locationId = freezed,
    Object? scannedAt = freezed,
  }) {
    return _then(_ScanLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentId: null == shipmentId
          ? _self.shipmentId
          : shipmentId // ignore: cast_nullable_to_non_nullable
              as String,
      poItemId: null == poItemId
          ? _self.poItemId
          : poItemId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      lotNumber: freezed == lotNumber
          ? _self.lotNumber
          : lotNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      serialNumber: freezed == serialNumber
          ? _self.serialNumber
          : serialNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      expiryDate: freezed == expiryDate
          ? _self.expiryDate
          : expiryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      locationId: freezed == locationId
          ? _self.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as String?,
      scannedAt: freezed == scannedAt
          ? _self.scannedAt
          : scannedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
