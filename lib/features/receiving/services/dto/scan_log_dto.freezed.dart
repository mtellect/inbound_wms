// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scan_log_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScanLogDto {
  String get id;
  @JsonKey(name: 'shipment_id')
  String get shipmentId;
  @JsonKey(name: 'po_item_id')
  String get poItemId;
  @JsonKey(name: 'user_id')
  String get userId;
  int get quantity;
  @JsonKey(name: 'lot_number')
  String? get lotNumber;
  @JsonKey(name: 'serial_number')
  String? get serialNumber;
  @JsonKey(name: 'expiry_date')
  DateTime? get expiryDate;
  @JsonKey(name: 'location_id')
  String? get locationId;
  @JsonKey(name: 'scanned_at')
  DateTime? get scannedAt;

  /// Create a copy of ScanLogDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScanLogDtoCopyWith<ScanLogDto> get copyWith =>
      _$ScanLogDtoCopyWithImpl<ScanLogDto>(this as ScanLogDto, _$identity);

  /// Serializes this ScanLogDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScanLogDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, shipmentId, poItemId, userId,
      quantity, lotNumber, serialNumber, expiryDate, locationId, scannedAt);

  @override
  String toString() {
    return 'ScanLogDto(id: $id, shipmentId: $shipmentId, poItemId: $poItemId, userId: $userId, quantity: $quantity, lotNumber: $lotNumber, serialNumber: $serialNumber, expiryDate: $expiryDate, locationId: $locationId, scannedAt: $scannedAt)';
  }
}

/// @nodoc
abstract mixin class $ScanLogDtoCopyWith<$Res> {
  factory $ScanLogDtoCopyWith(
          ScanLogDto value, $Res Function(ScanLogDto) _then) =
      _$ScanLogDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'shipment_id') String shipmentId,
      @JsonKey(name: 'po_item_id') String poItemId,
      @JsonKey(name: 'user_id') String userId,
      int quantity,
      @JsonKey(name: 'lot_number') String? lotNumber,
      @JsonKey(name: 'serial_number') String? serialNumber,
      @JsonKey(name: 'expiry_date') DateTime? expiryDate,
      @JsonKey(name: 'location_id') String? locationId,
      @JsonKey(name: 'scanned_at') DateTime? scannedAt});
}

/// @nodoc
class _$ScanLogDtoCopyWithImpl<$Res> implements $ScanLogDtoCopyWith<$Res> {
  _$ScanLogDtoCopyWithImpl(this._self, this._then);

  final ScanLogDto _self;
  final $Res Function(ScanLogDto) _then;

  /// Create a copy of ScanLogDto
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

/// Adds pattern-matching-related methods to [ScanLogDto].
extension ScanLogDtoPatterns on ScanLogDto {
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
    TResult Function(_ScanLogDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScanLogDto() when $default != null:
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
    TResult Function(_ScanLogDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLogDto():
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
    TResult? Function(_ScanLogDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLogDto() when $default != null:
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
            @JsonKey(name: 'shipment_id') String shipmentId,
            @JsonKey(name: 'po_item_id') String poItemId,
            @JsonKey(name: 'user_id') String userId,
            int quantity,
            @JsonKey(name: 'lot_number') String? lotNumber,
            @JsonKey(name: 'serial_number') String? serialNumber,
            @JsonKey(name: 'expiry_date') DateTime? expiryDate,
            @JsonKey(name: 'location_id') String? locationId,
            @JsonKey(name: 'scanned_at') DateTime? scannedAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ScanLogDto() when $default != null:
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
            @JsonKey(name: 'shipment_id') String shipmentId,
            @JsonKey(name: 'po_item_id') String poItemId,
            @JsonKey(name: 'user_id') String userId,
            int quantity,
            @JsonKey(name: 'lot_number') String? lotNumber,
            @JsonKey(name: 'serial_number') String? serialNumber,
            @JsonKey(name: 'expiry_date') DateTime? expiryDate,
            @JsonKey(name: 'location_id') String? locationId,
            @JsonKey(name: 'scanned_at') DateTime? scannedAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLogDto():
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
            @JsonKey(name: 'shipment_id') String shipmentId,
            @JsonKey(name: 'po_item_id') String poItemId,
            @JsonKey(name: 'user_id') String userId,
            int quantity,
            @JsonKey(name: 'lot_number') String? lotNumber,
            @JsonKey(name: 'serial_number') String? serialNumber,
            @JsonKey(name: 'expiry_date') DateTime? expiryDate,
            @JsonKey(name: 'location_id') String? locationId,
            @JsonKey(name: 'scanned_at') DateTime? scannedAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ScanLogDto() when $default != null:
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
@JsonSerializable()
class _ScanLogDto implements ScanLogDto {
  const _ScanLogDto(
      {required this.id,
      @JsonKey(name: 'shipment_id') required this.shipmentId,
      @JsonKey(name: 'po_item_id') required this.poItemId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.quantity,
      @JsonKey(name: 'lot_number') this.lotNumber,
      @JsonKey(name: 'serial_number') this.serialNumber,
      @JsonKey(name: 'expiry_date') this.expiryDate,
      @JsonKey(name: 'location_id') this.locationId,
      @JsonKey(name: 'scanned_at') this.scannedAt});
  factory _ScanLogDto.fromJson(Map<String, dynamic> json) =>
      _$ScanLogDtoFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'shipment_id')
  final String shipmentId;
  @override
  @JsonKey(name: 'po_item_id')
  final String poItemId;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final int quantity;
  @override
  @JsonKey(name: 'lot_number')
  final String? lotNumber;
  @override
  @JsonKey(name: 'serial_number')
  final String? serialNumber;
  @override
  @JsonKey(name: 'expiry_date')
  final DateTime? expiryDate;
  @override
  @JsonKey(name: 'location_id')
  final String? locationId;
  @override
  @JsonKey(name: 'scanned_at')
  final DateTime? scannedAt;

  /// Create a copy of ScanLogDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ScanLogDtoCopyWith<_ScanLogDto> get copyWith =>
      __$ScanLogDtoCopyWithImpl<_ScanLogDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ScanLogDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ScanLogDto &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, shipmentId, poItemId, userId,
      quantity, lotNumber, serialNumber, expiryDate, locationId, scannedAt);

  @override
  String toString() {
    return 'ScanLogDto(id: $id, shipmentId: $shipmentId, poItemId: $poItemId, userId: $userId, quantity: $quantity, lotNumber: $lotNumber, serialNumber: $serialNumber, expiryDate: $expiryDate, locationId: $locationId, scannedAt: $scannedAt)';
  }
}

/// @nodoc
abstract mixin class _$ScanLogDtoCopyWith<$Res>
    implements $ScanLogDtoCopyWith<$Res> {
  factory _$ScanLogDtoCopyWith(
          _ScanLogDto value, $Res Function(_ScanLogDto) _then) =
      __$ScanLogDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'shipment_id') String shipmentId,
      @JsonKey(name: 'po_item_id') String poItemId,
      @JsonKey(name: 'user_id') String userId,
      int quantity,
      @JsonKey(name: 'lot_number') String? lotNumber,
      @JsonKey(name: 'serial_number') String? serialNumber,
      @JsonKey(name: 'expiry_date') DateTime? expiryDate,
      @JsonKey(name: 'location_id') String? locationId,
      @JsonKey(name: 'scanned_at') DateTime? scannedAt});
}

/// @nodoc
class __$ScanLogDtoCopyWithImpl<$Res> implements _$ScanLogDtoCopyWith<$Res> {
  __$ScanLogDtoCopyWithImpl(this._self, this._then);

  final _ScanLogDto _self;
  final $Res Function(_ScanLogDto) _then;

  /// Create a copy of ScanLogDto
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
    return _then(_ScanLogDto(
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
