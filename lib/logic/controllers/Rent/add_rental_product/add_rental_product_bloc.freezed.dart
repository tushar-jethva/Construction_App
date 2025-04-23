// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_rental_product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddRentalProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddRentalProductEventCopyWith<$Res> {
  factory $AddRentalProductEventCopyWith(AddRentalProductEvent value,
          $Res Function(AddRentalProductEvent) then) =
      _$AddRentalProductEventCopyWithImpl<$Res, AddRentalProductEvent>;
}

/// @nodoc
class _$AddRentalProductEventCopyWithImpl<$Res,
        $Val extends AddRentalProductEvent>
    implements $AddRentalProductEventCopyWith<$Res> {
  _$AddRentalProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'AddRentalProductEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AddRentalProductEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$OnUnitChangedImplCopyWith<$Res> {
  factory _$$OnUnitChangedImplCopyWith(
          _$OnUnitChangedImpl value, $Res Function(_$OnUnitChangedImpl) then) =
      __$$OnUnitChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String unit});
}

/// @nodoc
class __$$OnUnitChangedImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res, _$OnUnitChangedImpl>
    implements _$$OnUnitChangedImplCopyWith<$Res> {
  __$$OnUnitChangedImplCopyWithImpl(
      _$OnUnitChangedImpl _value, $Res Function(_$OnUnitChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unit = null,
  }) {
    return _then(_$OnUnitChangedImpl(
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnUnitChangedImpl implements _OnUnitChanged {
  const _$OnUnitChangedImpl({required this.unit});

  @override
  final String unit;

  @override
  String toString() {
    return 'AddRentalProductEvent.onUnitChanged(unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUnitChangedImpl &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unit);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUnitChangedImplCopyWith<_$OnUnitChangedImpl> get copyWith =>
      __$$OnUnitChangedImplCopyWithImpl<_$OnUnitChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return onUnitChanged(unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return onUnitChanged?.call(unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onUnitChanged != null) {
      return onUnitChanged(unit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return onUnitChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return onUnitChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onUnitChanged != null) {
      return onUnitChanged(this);
    }
    return orElse();
  }
}

abstract class _OnUnitChanged implements AddRentalProductEvent {
  const factory _OnUnitChanged({required final String unit}) =
      _$OnUnitChangedImpl;

  String get unit;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnUnitChangedImplCopyWith<_$OnUnitChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$onDateChangedImplCopyWith<$Res> {
  factory _$$onDateChangedImplCopyWith(
          _$onDateChangedImpl value, $Res Function(_$onDateChangedImpl) then) =
      __$$onDateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String date});
}

/// @nodoc
class __$$onDateChangedImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res, _$onDateChangedImpl>
    implements _$$onDateChangedImplCopyWith<$Res> {
  __$$onDateChangedImplCopyWithImpl(
      _$onDateChangedImpl _value, $Res Function(_$onDateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$onDateChangedImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$onDateChangedImpl implements _onDateChanged {
  const _$onDateChangedImpl({required this.date});

  @override
  final String date;

  @override
  String toString() {
    return 'AddRentalProductEvent.onDateChanged(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$onDateChangedImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$onDateChangedImplCopyWith<_$onDateChangedImpl> get copyWith =>
      __$$onDateChangedImplCopyWithImpl<_$onDateChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return onDateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return onDateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onDateChanged != null) {
      return onDateChanged(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return onDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return onDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onDateChanged != null) {
      return onDateChanged(this);
    }
    return orElse();
  }
}

abstract class _onDateChanged implements AddRentalProductEvent {
  const factory _onDateChanged({required final String date}) =
      _$onDateChangedImpl;

  String get date;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$onDateChangedImplCopyWith<_$onDateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnRentalPartyIdChangedImplCopyWith<$Res> {
  factory _$$OnRentalPartyIdChangedImplCopyWith(
          _$OnRentalPartyIdChangedImpl value,
          $Res Function(_$OnRentalPartyIdChangedImpl) then) =
      __$$OnRentalPartyIdChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String rentalPartyId});
}

/// @nodoc
class __$$OnRentalPartyIdChangedImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res,
        _$OnRentalPartyIdChangedImpl>
    implements _$$OnRentalPartyIdChangedImplCopyWith<$Res> {
  __$$OnRentalPartyIdChangedImplCopyWithImpl(
      _$OnRentalPartyIdChangedImpl _value,
      $Res Function(_$OnRentalPartyIdChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rentalPartyId = null,
  }) {
    return _then(_$OnRentalPartyIdChangedImpl(
      rentalPartyId: null == rentalPartyId
          ? _value.rentalPartyId
          : rentalPartyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnRentalPartyIdChangedImpl implements _OnRentalPartyIdChanged {
  const _$OnRentalPartyIdChangedImpl({required this.rentalPartyId});

  @override
  final String rentalPartyId;

  @override
  String toString() {
    return 'AddRentalProductEvent.onRentalPartyIdChanged(rentalPartyId: $rentalPartyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnRentalPartyIdChangedImpl &&
            (identical(other.rentalPartyId, rentalPartyId) ||
                other.rentalPartyId == rentalPartyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rentalPartyId);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnRentalPartyIdChangedImplCopyWith<_$OnRentalPartyIdChangedImpl>
      get copyWith => __$$OnRentalPartyIdChangedImplCopyWithImpl<
          _$OnRentalPartyIdChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return onRentalPartyIdChanged(rentalPartyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return onRentalPartyIdChanged?.call(rentalPartyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onRentalPartyIdChanged != null) {
      return onRentalPartyIdChanged(rentalPartyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return onRentalPartyIdChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return onRentalPartyIdChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onRentalPartyIdChanged != null) {
      return onRentalPartyIdChanged(this);
    }
    return orElse();
  }
}

abstract class _OnRentalPartyIdChanged implements AddRentalProductEvent {
  const factory _OnRentalPartyIdChanged({required final String rentalPartyId}) =
      _$OnRentalPartyIdChangedImpl;

  String get rentalPartyId;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnRentalPartyIdChangedImplCopyWith<_$OnRentalPartyIdChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnStartDateChangedImplCopyWith<$Res> {
  factory _$$OnStartDateChangedImplCopyWith(_$OnStartDateChangedImpl value,
          $Res Function(_$OnStartDateChangedImpl) then) =
      __$$OnStartDateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime startDate});
}

/// @nodoc
class __$$OnStartDateChangedImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res, _$OnStartDateChangedImpl>
    implements _$$OnStartDateChangedImplCopyWith<$Res> {
  __$$OnStartDateChangedImplCopyWithImpl(_$OnStartDateChangedImpl _value,
      $Res Function(_$OnStartDateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = null,
  }) {
    return _then(_$OnStartDateChangedImpl(
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$OnStartDateChangedImpl implements _OnStartDateChanged {
  const _$OnStartDateChangedImpl({required this.startDate});

  @override
  final DateTime startDate;

  @override
  String toString() {
    return 'AddRentalProductEvent.onStartDateChanged(startDate: $startDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnStartDateChangedImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startDate);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnStartDateChangedImplCopyWith<_$OnStartDateChangedImpl> get copyWith =>
      __$$OnStartDateChangedImplCopyWithImpl<_$OnStartDateChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return onStartDateChanged(startDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return onStartDateChanged?.call(startDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onStartDateChanged != null) {
      return onStartDateChanged(startDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return onStartDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return onStartDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onStartDateChanged != null) {
      return onStartDateChanged(this);
    }
    return orElse();
  }
}

abstract class _OnStartDateChanged implements AddRentalProductEvent {
  const factory _OnStartDateChanged({required final DateTime startDate}) =
      _$OnStartDateChangedImpl;

  DateTime get startDate;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnStartDateChangedImplCopyWith<_$OnStartDateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnEndDateChangedImplCopyWith<$Res> {
  factory _$$OnEndDateChangedImplCopyWith(_$OnEndDateChangedImpl value,
          $Res Function(_$OnEndDateChangedImpl) then) =
      __$$OnEndDateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime endDate});
}

/// @nodoc
class __$$OnEndDateChangedImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res, _$OnEndDateChangedImpl>
    implements _$$OnEndDateChangedImplCopyWith<$Res> {
  __$$OnEndDateChangedImplCopyWithImpl(_$OnEndDateChangedImpl _value,
      $Res Function(_$OnEndDateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? endDate = null,
  }) {
    return _then(_$OnEndDateChangedImpl(
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$OnEndDateChangedImpl implements _OnEndDateChanged {
  const _$OnEndDateChangedImpl({required this.endDate});

  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'AddRentalProductEvent.onEndDateChanged(endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEndDateChangedImpl &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, endDate);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEndDateChangedImplCopyWith<_$OnEndDateChangedImpl> get copyWith =>
      __$$OnEndDateChangedImplCopyWithImpl<_$OnEndDateChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return onEndDateChanged(endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return onEndDateChanged?.call(endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onEndDateChanged != null) {
      return onEndDateChanged(endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return onEndDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return onEndDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onEndDateChanged != null) {
      return onEndDateChanged(this);
    }
    return orElse();
  }
}

abstract class _OnEndDateChanged implements AddRentalProductEvent {
  const factory _OnEndDateChanged({required final DateTime endDate}) =
      _$OnEndDateChangedImpl;

  DateTime get endDate;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnEndDateChangedImplCopyWith<_$OnEndDateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnAddRentalImplCopyWith<$Res> {
  factory _$$OnAddRentalImplCopyWith(
          _$OnAddRentalImpl value, $Res Function(_$OnAddRentalImpl) then) =
      __$$OnAddRentalImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String materialName,
      String quantity,
      String description,
      bool isUpdate,
      String pricePerUnit,
      String? rentalPartyId,
      String rentalProductId});
}

/// @nodoc
class __$$OnAddRentalImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res, _$OnAddRentalImpl>
    implements _$$OnAddRentalImplCopyWith<$Res> {
  __$$OnAddRentalImplCopyWithImpl(
      _$OnAddRentalImpl _value, $Res Function(_$OnAddRentalImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? description = null,
    Object? isUpdate = null,
    Object? pricePerUnit = null,
    Object? rentalPartyId = freezed,
    Object? rentalProductId = null,
  }) {
    return _then(_$OnAddRentalImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      pricePerUnit: null == pricePerUnit
          ? _value.pricePerUnit
          : pricePerUnit // ignore: cast_nullable_to_non_nullable
              as String,
      rentalPartyId: freezed == rentalPartyId
          ? _value.rentalPartyId
          : rentalPartyId // ignore: cast_nullable_to_non_nullable
              as String?,
      rentalProductId: null == rentalProductId
          ? _value.rentalProductId
          : rentalProductId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnAddRentalImpl implements _OnAddRental {
  const _$OnAddRentalImpl(
      {required this.projectId,
      required this.materialName,
      required this.quantity,
      required this.description,
      required this.isUpdate,
      required this.pricePerUnit,
      this.rentalPartyId,
      required this.rentalProductId});

  @override
  final String projectId;
  @override
  final String materialName;
  @override
  final String quantity;
  @override
  final String description;
  @override
  final bool isUpdate;
  @override
  final String pricePerUnit;
  @override
  final String? rentalPartyId;
  @override
  final String rentalProductId;

  @override
  String toString() {
    return 'AddRentalProductEvent.onAddRental(projectId: $projectId, materialName: $materialName, quantity: $quantity, description: $description, isUpdate: $isUpdate, pricePerUnit: $pricePerUnit, rentalPartyId: $rentalPartyId, rentalProductId: $rentalProductId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnAddRentalImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate) &&
            (identical(other.pricePerUnit, pricePerUnit) ||
                other.pricePerUnit == pricePerUnit) &&
            (identical(other.rentalPartyId, rentalPartyId) ||
                other.rentalPartyId == rentalPartyId) &&
            (identical(other.rentalProductId, rentalProductId) ||
                other.rentalProductId == rentalProductId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      projectId,
      materialName,
      quantity,
      description,
      isUpdate,
      pricePerUnit,
      rentalPartyId,
      rentalProductId);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnAddRentalImplCopyWith<_$OnAddRentalImpl> get copyWith =>
      __$$OnAddRentalImplCopyWithImpl<_$OnAddRentalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return onAddRental(projectId, materialName, quantity, description, isUpdate,
        pricePerUnit, rentalPartyId, rentalProductId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return onAddRental?.call(projectId, materialName, quantity, description,
        isUpdate, pricePerUnit, rentalPartyId, rentalProductId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onAddRental != null) {
      return onAddRental(projectId, materialName, quantity, description,
          isUpdate, pricePerUnit, rentalPartyId, rentalProductId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return onAddRental(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return onAddRental?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (onAddRental != null) {
      return onAddRental(this);
    }
    return orElse();
  }
}

abstract class _OnAddRental implements AddRentalProductEvent {
  const factory _OnAddRental(
      {required final String projectId,
      required final String materialName,
      required final String quantity,
      required final String description,
      required final bool isUpdate,
      required final String pricePerUnit,
      final String? rentalPartyId,
      required final String rentalProductId}) = _$OnAddRentalImpl;

  String get projectId;
  String get materialName;
  String get quantity;
  String get description;
  bool get isUpdate;
  String get pricePerUnit;
  String? get rentalPartyId;
  String get rentalProductId;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnAddRentalImplCopyWith<_$OnAddRentalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAllRentalImplCopyWith<$Res> {
  factory _$$FetchAllRentalImplCopyWith(_$FetchAllRentalImpl value,
          $Res Function(_$FetchAllRentalImpl) then) =
      __$$FetchAllRentalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$FetchAllRentalImplCopyWithImpl<$Res>
    extends _$AddRentalProductEventCopyWithImpl<$Res, _$FetchAllRentalImpl>
    implements _$$FetchAllRentalImplCopyWith<$Res> {
  __$$FetchAllRentalImplCopyWithImpl(
      _$FetchAllRentalImpl _value, $Res Function(_$FetchAllRentalImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$FetchAllRentalImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchAllRentalImpl implements _FetchAllRental {
  const _$FetchAllRentalImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString() {
    return 'AddRentalProductEvent.fetchAllRental(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllRentalImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllRentalImplCopyWith<_$FetchAllRentalImpl> get copyWith =>
      __$$FetchAllRentalImplCopyWithImpl<_$FetchAllRentalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(String rentalPartyId) onRentalPartyIdChanged,
    required TResult Function(DateTime startDate) onStartDateChanged,
    required TResult Function(DateTime endDate) onEndDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)
        onAddRental,
    required TResult Function(String projectId) fetchAllRental,
  }) {
    return fetchAllRental(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult? Function(DateTime startDate)? onStartDateChanged,
    TResult? Function(DateTime endDate)? onEndDateChanged,
    TResult? Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult? Function(String projectId)? fetchAllRental,
  }) {
    return fetchAllRental?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String rentalPartyId)? onRentalPartyIdChanged,
    TResult Function(DateTime startDate)? onStartDateChanged,
    TResult Function(DateTime endDate)? onEndDateChanged,
    TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String pricePerUnit,
            String? rentalPartyId,
            String rentalProductId)?
        onAddRental,
    TResult Function(String projectId)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (fetchAllRental != null) {
      return fetchAllRental(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnRentalPartyIdChanged value)
        onRentalPartyIdChanged,
    required TResult Function(_OnStartDateChanged value) onStartDateChanged,
    required TResult Function(_OnEndDateChanged value) onEndDateChanged,
    required TResult Function(_OnAddRental value) onAddRental,
    required TResult Function(_FetchAllRental value) fetchAllRental,
  }) {
    return fetchAllRental(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult? Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult? Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult? Function(_OnAddRental value)? onAddRental,
    TResult? Function(_FetchAllRental value)? fetchAllRental,
  }) {
    return fetchAllRental?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnRentalPartyIdChanged value)? onRentalPartyIdChanged,
    TResult Function(_OnStartDateChanged value)? onStartDateChanged,
    TResult Function(_OnEndDateChanged value)? onEndDateChanged,
    TResult Function(_OnAddRental value)? onAddRental,
    TResult Function(_FetchAllRental value)? fetchAllRental,
    required TResult orElse(),
  }) {
    if (fetchAllRental != null) {
      return fetchAllRental(this);
    }
    return orElse();
  }
}

abstract class _FetchAllRental implements AddRentalProductEvent {
  const factory _FetchAllRental({required final String projectId}) =
      _$FetchAllRentalImpl;

  String get projectId;

  /// Create a copy of AddRentalProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllRentalImplCopyWith<_$FetchAllRentalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddRentalProductState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<GetRentalModel> get rentalList => throw _privateConstructorUsedError;
  String get rentalPartyId => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;

  /// Create a copy of AddRentalProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddRentalProductStateCopyWith<AddRentalProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddRentalProductStateCopyWith<$Res> {
  factory $AddRentalProductStateCopyWith(AddRentalProductState value,
          $Res Function(AddRentalProductState) then) =
      _$AddRentalProductStateCopyWithImpl<$Res, AddRentalProductState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String unit,
      String date,
      List<GetRentalModel> rentalList,
      String rentalPartyId,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class _$AddRentalProductStateCopyWithImpl<$Res,
        $Val extends AddRentalProductState>
    implements $AddRentalProductStateCopyWith<$Res> {
  _$AddRentalProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddRentalProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? unit = null,
    Object? date = null,
    Object? rentalList = null,
    Object? rentalPartyId = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rentalList: null == rentalList
          ? _value.rentalList
          : rentalList // ignore: cast_nullable_to_non_nullable
              as List<GetRentalModel>,
      rentalPartyId: null == rentalPartyId
          ? _value.rentalPartyId
          : rentalPartyId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddRentalProductStateImplCopyWith<$Res>
    implements $AddRentalProductStateCopyWith<$Res> {
  factory _$$AddRentalProductStateImplCopyWith(
          _$AddRentalProductStateImpl value,
          $Res Function(_$AddRentalProductStateImpl) then) =
      __$$AddRentalProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String unit,
      String date,
      List<GetRentalModel> rentalList,
      String rentalPartyId,
      DateTime startDate,
      DateTime endDate});
}

/// @nodoc
class __$$AddRentalProductStateImplCopyWithImpl<$Res>
    extends _$AddRentalProductStateCopyWithImpl<$Res,
        _$AddRentalProductStateImpl>
    implements _$$AddRentalProductStateImplCopyWith<$Res> {
  __$$AddRentalProductStateImplCopyWithImpl(_$AddRentalProductStateImpl _value,
      $Res Function(_$AddRentalProductStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddRentalProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? unit = null,
    Object? date = null,
    Object? rentalList = null,
    Object? rentalPartyId = null,
    Object? startDate = null,
    Object? endDate = null,
  }) {
    return _then(_$AddRentalProductStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      rentalList: null == rentalList
          ? _value._rentalList
          : rentalList // ignore: cast_nullable_to_non_nullable
              as List<GetRentalModel>,
      rentalPartyId: null == rentalPartyId
          ? _value.rentalPartyId
          : rentalPartyId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$AddRentalProductStateImpl implements _AddRentalProductState {
  const _$AddRentalProductStateImpl(
      {required this.state,
      required this.message,
      required this.unit,
      required this.date,
      required final List<GetRentalModel> rentalList,
      required this.rentalPartyId,
      required this.startDate,
      required this.endDate})
      : _rentalList = rentalList;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String unit;
  @override
  final String date;
  final List<GetRentalModel> _rentalList;
  @override
  List<GetRentalModel> get rentalList {
    if (_rentalList is EqualUnmodifiableListView) return _rentalList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rentalList);
  }

  @override
  final String rentalPartyId;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;

  @override
  String toString() {
    return 'AddRentalProductState(state: $state, message: $message, unit: $unit, date: $date, rentalList: $rentalList, rentalPartyId: $rentalPartyId, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddRentalProductStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._rentalList, _rentalList) &&
            (identical(other.rentalPartyId, rentalPartyId) ||
                other.rentalPartyId == rentalPartyId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      message,
      unit,
      date,
      const DeepCollectionEquality().hash(_rentalList),
      rentalPartyId,
      startDate,
      endDate);

  /// Create a copy of AddRentalProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddRentalProductStateImplCopyWith<_$AddRentalProductStateImpl>
      get copyWith => __$$AddRentalProductStateImplCopyWithImpl<
          _$AddRentalProductStateImpl>(this, _$identity);
}

abstract class _AddRentalProductState implements AddRentalProductState {
  const factory _AddRentalProductState(
      {required final RequestState state,
      required final String message,
      required final String unit,
      required final String date,
      required final List<GetRentalModel> rentalList,
      required final String rentalPartyId,
      required final DateTime startDate,
      required final DateTime endDate}) = _$AddRentalProductStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get unit;
  @override
  String get date;
  @override
  List<GetRentalModel> get rentalList;
  @override
  String get rentalPartyId;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;

  /// Create a copy of AddRentalProductState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddRentalProductStateImplCopyWith<_$AddRentalProductStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
