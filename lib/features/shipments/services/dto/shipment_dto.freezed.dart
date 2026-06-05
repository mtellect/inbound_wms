// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shipment_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShipmentDto {
  String get id;
  @JsonKey(name: 'po_id')
  String get poId;
  @JsonKey(name: 'carrier_name')
  String? get carrierName;
  @JsonKey(name: 'tracking_number')
  String? get trackingNumber;
  @JsonKey(name: 'dock_door')
  String? get dockDoor;
  @JsonKey(name: 'arrival_time')
  DateTime? get arrivalTime;
  String get status;

  /// Create a copy of ShipmentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ShipmentDtoCopyWith<ShipmentDto> get copyWith =>
      _$ShipmentDtoCopyWithImpl<ShipmentDto>(this as ShipmentDto, _$identity);

  /// Serializes this ShipmentDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ShipmentDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poId, poId) || other.poId == poId) &&
            (identical(other.carrierName, carrierName) ||
                other.carrierName == carrierName) &&
            (identical(other.trackingNumber, trackingNumber) ||
                other.trackingNumber == trackingNumber) &&
            (identical(other.dockDoor, dockDoor) ||
                other.dockDoor == dockDoor) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poId, carrierName,
      trackingNumber, dockDoor, arrivalTime, status);

  @override
  String toString() {
    return 'ShipmentDto(id: $id, poId: $poId, carrierName: $carrierName, trackingNumber: $trackingNumber, dockDoor: $dockDoor, arrivalTime: $arrivalTime, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ShipmentDtoCopyWith<$Res> {
  factory $ShipmentDtoCopyWith(
          ShipmentDto value, $Res Function(ShipmentDto) _then) =
      _$ShipmentDtoCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'po_id') String poId,
      @JsonKey(name: 'carrier_name') String? carrierName,
      @JsonKey(name: 'tracking_number') String? trackingNumber,
      @JsonKey(name: 'dock_door') String? dockDoor,
      @JsonKey(name: 'arrival_time') DateTime? arrivalTime,
      String status});
}

/// @nodoc
class _$ShipmentDtoCopyWithImpl<$Res> implements $ShipmentDtoCopyWith<$Res> {
  _$ShipmentDtoCopyWithImpl(this._self, this._then);

  final ShipmentDto _self;
  final $Res Function(ShipmentDto) _then;

  /// Create a copy of ShipmentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? poId = null,
    Object? carrierName = freezed,
    Object? trackingNumber = freezed,
    Object? dockDoor = freezed,
    Object? arrivalTime = freezed,
    Object? status = null,
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
      carrierName: freezed == carrierName
          ? _self.carrierName
          : carrierName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingNumber: freezed == trackingNumber
          ? _self.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dockDoor: freezed == dockDoor
          ? _self.dockDoor
          : dockDoor // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalTime: freezed == arrivalTime
          ? _self.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ShipmentDto].
extension ShipmentDtoPatterns on ShipmentDto {
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
    TResult Function(_ShipmentDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShipmentDto() when $default != null:
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
    TResult Function(_ShipmentDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentDto():
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
    TResult? Function(_ShipmentDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentDto() when $default != null:
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
            @JsonKey(name: 'carrier_name') String? carrierName,
            @JsonKey(name: 'tracking_number') String? trackingNumber,
            @JsonKey(name: 'dock_door') String? dockDoor,
            @JsonKey(name: 'arrival_time') DateTime? arrivalTime,
            String status)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShipmentDto() when $default != null:
        return $default(
            _that.id,
            _that.poId,
            _that.carrierName,
            _that.trackingNumber,
            _that.dockDoor,
            _that.arrivalTime,
            _that.status);
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
            @JsonKey(name: 'carrier_name') String? carrierName,
            @JsonKey(name: 'tracking_number') String? trackingNumber,
            @JsonKey(name: 'dock_door') String? dockDoor,
            @JsonKey(name: 'arrival_time') DateTime? arrivalTime,
            String status)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentDto():
        return $default(
            _that.id,
            _that.poId,
            _that.carrierName,
            _that.trackingNumber,
            _that.dockDoor,
            _that.arrivalTime,
            _that.status);
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
            @JsonKey(name: 'carrier_name') String? carrierName,
            @JsonKey(name: 'tracking_number') String? trackingNumber,
            @JsonKey(name: 'dock_door') String? dockDoor,
            @JsonKey(name: 'arrival_time') DateTime? arrivalTime,
            String status)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ShipmentDto() when $default != null:
        return $default(
            _that.id,
            _that.poId,
            _that.carrierName,
            _that.trackingNumber,
            _that.dockDoor,
            _that.arrivalTime,
            _that.status);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ShipmentDto implements ShipmentDto {
  const _ShipmentDto(
      {required this.id,
      @JsonKey(name: 'po_id') required this.poId,
      @JsonKey(name: 'carrier_name') this.carrierName,
      @JsonKey(name: 'tracking_number') this.trackingNumber,
      @JsonKey(name: 'dock_door') this.dockDoor,
      @JsonKey(name: 'arrival_time') this.arrivalTime,
      this.status = 'expected'});
  factory _ShipmentDto.fromJson(Map<String, dynamic> json) =>
      _$ShipmentDtoFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'po_id')
  final String poId;
  @override
  @JsonKey(name: 'carrier_name')
  final String? carrierName;
  @override
  @JsonKey(name: 'tracking_number')
  final String? trackingNumber;
  @override
  @JsonKey(name: 'dock_door')
  final String? dockDoor;
  @override
  @JsonKey(name: 'arrival_time')
  final DateTime? arrivalTime;
  @override
  @JsonKey()
  final String status;

  /// Create a copy of ShipmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShipmentDtoCopyWith<_ShipmentDto> get copyWith =>
      __$ShipmentDtoCopyWithImpl<_ShipmentDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ShipmentDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShipmentDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.poId, poId) || other.poId == poId) &&
            (identical(other.carrierName, carrierName) ||
                other.carrierName == carrierName) &&
            (identical(other.trackingNumber, trackingNumber) ||
                other.trackingNumber == trackingNumber) &&
            (identical(other.dockDoor, dockDoor) ||
                other.dockDoor == dockDoor) &&
            (identical(other.arrivalTime, arrivalTime) ||
                other.arrivalTime == arrivalTime) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, poId, carrierName,
      trackingNumber, dockDoor, arrivalTime, status);

  @override
  String toString() {
    return 'ShipmentDto(id: $id, poId: $poId, carrierName: $carrierName, trackingNumber: $trackingNumber, dockDoor: $dockDoor, arrivalTime: $arrivalTime, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ShipmentDtoCopyWith<$Res>
    implements $ShipmentDtoCopyWith<$Res> {
  factory _$ShipmentDtoCopyWith(
          _ShipmentDto value, $Res Function(_ShipmentDto) _then) =
      __$ShipmentDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'po_id') String poId,
      @JsonKey(name: 'carrier_name') String? carrierName,
      @JsonKey(name: 'tracking_number') String? trackingNumber,
      @JsonKey(name: 'dock_door') String? dockDoor,
      @JsonKey(name: 'arrival_time') DateTime? arrivalTime,
      String status});
}

/// @nodoc
class __$ShipmentDtoCopyWithImpl<$Res> implements _$ShipmentDtoCopyWith<$Res> {
  __$ShipmentDtoCopyWithImpl(this._self, this._then);

  final _ShipmentDto _self;
  final $Res Function(_ShipmentDto) _then;

  /// Create a copy of ShipmentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? poId = null,
    Object? carrierName = freezed,
    Object? trackingNumber = freezed,
    Object? dockDoor = freezed,
    Object? arrivalTime = freezed,
    Object? status = null,
  }) {
    return _then(_ShipmentDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      poId: null == poId
          ? _self.poId
          : poId // ignore: cast_nullable_to_non_nullable
              as String,
      carrierName: freezed == carrierName
          ? _self.carrierName
          : carrierName // ignore: cast_nullable_to_non_nullable
              as String?,
      trackingNumber: freezed == trackingNumber
          ? _self.trackingNumber
          : trackingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      dockDoor: freezed == dockDoor
          ? _self.dockDoor
          : dockDoor // ignore: cast_nullable_to_non_nullable
              as String?,
      arrivalTime: freezed == arrivalTime
          ? _self.arrivalTime
          : arrivalTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
