// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_material_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddMaterialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String? materialId)
        onAddMaterialTap,
    required TResult Function(String projectId) fetchAllMaterial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult? Function(String projectId)? fetchAllMaterial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult Function(String projectId)? fetchAllMaterial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnAddMaterialTap value) onAddMaterialTap,
    required TResult Function(_FetchAllMaterial value) fetchAllMaterial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult? Function(_FetchAllMaterial value)? fetchAllMaterial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult Function(_FetchAllMaterial value)? fetchAllMaterial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMaterialEventCopyWith<$Res> {
  factory $AddMaterialEventCopyWith(
          AddMaterialEvent value, $Res Function(AddMaterialEvent) then) =
      _$AddMaterialEventCopyWithImpl<$Res, AddMaterialEvent>;
}

/// @nodoc
class _$AddMaterialEventCopyWithImpl<$Res, $Val extends AddMaterialEvent>
    implements $AddMaterialEventCopyWith<$Res> {
  _$AddMaterialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddMaterialEvent
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
    extends _$AddMaterialEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'AddMaterialEvent.initialize()';
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
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String? materialId)
        onAddMaterialTap,
    required TResult Function(String projectId) fetchAllMaterial,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult? Function(String projectId)? fetchAllMaterial,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult Function(String projectId)? fetchAllMaterial,
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
    required TResult Function(_OnAddMaterialTap value) onAddMaterialTap,
    required TResult Function(_FetchAllMaterial value) fetchAllMaterial,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult? Function(_FetchAllMaterial value)? fetchAllMaterial,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult Function(_FetchAllMaterial value)? fetchAllMaterial,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AddMaterialEvent {
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
    extends _$AddMaterialEventCopyWithImpl<$Res, _$OnUnitChangedImpl>
    implements _$$OnUnitChangedImplCopyWith<$Res> {
  __$$OnUnitChangedImplCopyWithImpl(
      _$OnUnitChangedImpl _value, $Res Function(_$OnUnitChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMaterialEvent
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
    return 'AddMaterialEvent.onUnitChanged(unit: $unit)';
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

  /// Create a copy of AddMaterialEvent
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
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String? materialId)
        onAddMaterialTap,
    required TResult Function(String projectId) fetchAllMaterial,
  }) {
    return onUnitChanged(unit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult? Function(String projectId)? fetchAllMaterial,
  }) {
    return onUnitChanged?.call(unit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult Function(String projectId)? fetchAllMaterial,
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
    required TResult Function(_OnAddMaterialTap value) onAddMaterialTap,
    required TResult Function(_FetchAllMaterial value) fetchAllMaterial,
  }) {
    return onUnitChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult? Function(_FetchAllMaterial value)? fetchAllMaterial,
  }) {
    return onUnitChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult Function(_FetchAllMaterial value)? fetchAllMaterial,
    required TResult orElse(),
  }) {
    if (onUnitChanged != null) {
      return onUnitChanged(this);
    }
    return orElse();
  }
}

abstract class _OnUnitChanged implements AddMaterialEvent {
  const factory _OnUnitChanged({required final String unit}) =
      _$OnUnitChangedImpl;

  String get unit;

  /// Create a copy of AddMaterialEvent
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
    extends _$AddMaterialEventCopyWithImpl<$Res, _$onDateChangedImpl>
    implements _$$onDateChangedImplCopyWith<$Res> {
  __$$onDateChangedImplCopyWithImpl(
      _$onDateChangedImpl _value, $Res Function(_$onDateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMaterialEvent
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
    return 'AddMaterialEvent.onDateChanged(date: $date)';
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

  /// Create a copy of AddMaterialEvent
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
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String? materialId)
        onAddMaterialTap,
    required TResult Function(String projectId) fetchAllMaterial,
  }) {
    return onDateChanged(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult? Function(String projectId)? fetchAllMaterial,
  }) {
    return onDateChanged?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult Function(String projectId)? fetchAllMaterial,
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
    required TResult Function(_OnAddMaterialTap value) onAddMaterialTap,
    required TResult Function(_FetchAllMaterial value) fetchAllMaterial,
  }) {
    return onDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult? Function(_FetchAllMaterial value)? fetchAllMaterial,
  }) {
    return onDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult Function(_FetchAllMaterial value)? fetchAllMaterial,
    required TResult orElse(),
  }) {
    if (onDateChanged != null) {
      return onDateChanged(this);
    }
    return orElse();
  }
}

abstract class _onDateChanged implements AddMaterialEvent {
  const factory _onDateChanged({required final String date}) =
      _$onDateChangedImpl;

  String get date;

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$onDateChangedImplCopyWith<_$onDateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnAddMaterialTapImplCopyWith<$Res> {
  factory _$$OnAddMaterialTapImplCopyWith(_$OnAddMaterialTapImpl value,
          $Res Function(_$OnAddMaterialTapImpl) then) =
      __$$OnAddMaterialTapImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String projectId,
      String materialName,
      String quantity,
      String description,
      bool isUpdate,
      String? materialId});
}

/// @nodoc
class __$$OnAddMaterialTapImplCopyWithImpl<$Res>
    extends _$AddMaterialEventCopyWithImpl<$Res, _$OnAddMaterialTapImpl>
    implements _$$OnAddMaterialTapImplCopyWith<$Res> {
  __$$OnAddMaterialTapImplCopyWithImpl(_$OnAddMaterialTapImpl _value,
      $Res Function(_$OnAddMaterialTapImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? description = null,
    Object? isUpdate = null,
    Object? materialId = freezed,
  }) {
    return _then(_$OnAddMaterialTapImpl(
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
      materialId: freezed == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnAddMaterialTapImpl implements _OnAddMaterialTap {
  const _$OnAddMaterialTapImpl(
      {required this.projectId,
      required this.materialName,
      required this.quantity,
      required this.description,
      required this.isUpdate,
      this.materialId});

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
  final String? materialId;

  @override
  String toString() {
    return 'AddMaterialEvent.onAddMaterialTap(projectId: $projectId, materialName: $materialName, quantity: $quantity, description: $description, isUpdate: $isUpdate, materialId: $materialId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnAddMaterialTapImpl &&
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
            (identical(other.materialId, materialId) ||
                other.materialId == materialId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, materialName,
      quantity, description, isUpdate, materialId);

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnAddMaterialTapImplCopyWith<_$OnAddMaterialTapImpl> get copyWith =>
      __$$OnAddMaterialTapImplCopyWithImpl<_$OnAddMaterialTapImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String? materialId)
        onAddMaterialTap,
    required TResult Function(String projectId) fetchAllMaterial,
  }) {
    return onAddMaterialTap(
        projectId, materialName, quantity, description, isUpdate, materialId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult? Function(String projectId)? fetchAllMaterial,
  }) {
    return onAddMaterialTap?.call(
        projectId, materialName, quantity, description, isUpdate, materialId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult Function(String projectId)? fetchAllMaterial,
    required TResult orElse(),
  }) {
    if (onAddMaterialTap != null) {
      return onAddMaterialTap(
          projectId, materialName, quantity, description, isUpdate, materialId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnAddMaterialTap value) onAddMaterialTap,
    required TResult Function(_FetchAllMaterial value) fetchAllMaterial,
  }) {
    return onAddMaterialTap(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult? Function(_FetchAllMaterial value)? fetchAllMaterial,
  }) {
    return onAddMaterialTap?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult Function(_FetchAllMaterial value)? fetchAllMaterial,
    required TResult orElse(),
  }) {
    if (onAddMaterialTap != null) {
      return onAddMaterialTap(this);
    }
    return orElse();
  }
}

abstract class _OnAddMaterialTap implements AddMaterialEvent {
  const factory _OnAddMaterialTap(
      {required final String projectId,
      required final String materialName,
      required final String quantity,
      required final String description,
      required final bool isUpdate,
      final String? materialId}) = _$OnAddMaterialTapImpl;

  String get projectId;
  String get materialName;
  String get quantity;
  String get description;
  bool get isUpdate;
  String? get materialId;

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnAddMaterialTapImplCopyWith<_$OnAddMaterialTapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAllMaterialImplCopyWith<$Res> {
  factory _$$FetchAllMaterialImplCopyWith(_$FetchAllMaterialImpl value,
          $Res Function(_$FetchAllMaterialImpl) then) =
      __$$FetchAllMaterialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$FetchAllMaterialImplCopyWithImpl<$Res>
    extends _$AddMaterialEventCopyWithImpl<$Res, _$FetchAllMaterialImpl>
    implements _$$FetchAllMaterialImplCopyWith<$Res> {
  __$$FetchAllMaterialImplCopyWithImpl(_$FetchAllMaterialImpl _value,
      $Res Function(_$FetchAllMaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$FetchAllMaterialImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchAllMaterialImpl implements _FetchAllMaterial {
  const _$FetchAllMaterialImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString() {
    return 'AddMaterialEvent.fetchAllMaterial(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllMaterialImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllMaterialImplCopyWith<_$FetchAllMaterialImpl> get copyWith =>
      __$$FetchAllMaterialImplCopyWithImpl<_$FetchAllMaterialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String unit) onUnitChanged,
    required TResult Function(String date) onDateChanged,
    required TResult Function(
            String projectId,
            String materialName,
            String quantity,
            String description,
            bool isUpdate,
            String? materialId)
        onAddMaterialTap,
    required TResult Function(String projectId) fetchAllMaterial,
  }) {
    return fetchAllMaterial(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String unit)? onUnitChanged,
    TResult? Function(String date)? onDateChanged,
    TResult? Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult? Function(String projectId)? fetchAllMaterial,
  }) {
    return fetchAllMaterial?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String unit)? onUnitChanged,
    TResult Function(String date)? onDateChanged,
    TResult Function(String projectId, String materialName, String quantity,
            String description, bool isUpdate, String? materialId)?
        onAddMaterialTap,
    TResult Function(String projectId)? fetchAllMaterial,
    required TResult orElse(),
  }) {
    if (fetchAllMaterial != null) {
      return fetchAllMaterial(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnUnitChanged value) onUnitChanged,
    required TResult Function(_onDateChanged value) onDateChanged,
    required TResult Function(_OnAddMaterialTap value) onAddMaterialTap,
    required TResult Function(_FetchAllMaterial value) fetchAllMaterial,
  }) {
    return fetchAllMaterial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnUnitChanged value)? onUnitChanged,
    TResult? Function(_onDateChanged value)? onDateChanged,
    TResult? Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult? Function(_FetchAllMaterial value)? fetchAllMaterial,
  }) {
    return fetchAllMaterial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnUnitChanged value)? onUnitChanged,
    TResult Function(_onDateChanged value)? onDateChanged,
    TResult Function(_OnAddMaterialTap value)? onAddMaterialTap,
    TResult Function(_FetchAllMaterial value)? fetchAllMaterial,
    required TResult orElse(),
  }) {
    if (fetchAllMaterial != null) {
      return fetchAllMaterial(this);
    }
    return orElse();
  }
}

abstract class _FetchAllMaterial implements AddMaterialEvent {
  const factory _FetchAllMaterial({required final String projectId}) =
      _$FetchAllMaterialImpl;

  String get projectId;

  /// Create a copy of AddMaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllMaterialImplCopyWith<_$FetchAllMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddMaterialState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get projectId => throw _privateConstructorUsedError;
  String get materialName => throw _privateConstructorUsedError;
  String get quantity => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<MaterialModel> get materialList => throw _privateConstructorUsedError;
  bool get isUpdate => throw _privateConstructorUsedError;

  /// Create a copy of AddMaterialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddMaterialStateCopyWith<AddMaterialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddMaterialStateCopyWith<$Res> {
  factory $AddMaterialStateCopyWith(
          AddMaterialState value, $Res Function(AddMaterialState) then) =
      _$AddMaterialStateCopyWithImpl<$Res, AddMaterialState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String projectId,
      String materialName,
      String quantity,
      String description,
      String unit,
      String date,
      List<MaterialModel> materialList,
      bool isUpdate});
}

/// @nodoc
class _$AddMaterialStateCopyWithImpl<$Res, $Val extends AddMaterialState>
    implements $AddMaterialStateCopyWith<$Res> {
  _$AddMaterialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddMaterialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? projectId = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? description = null,
    Object? unit = null,
    Object? date = null,
    Object? materialList = null,
    Object? isUpdate = null,
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
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      materialList: null == materialList
          ? _value.materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialModel>,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddMaterialStateImplCopyWith<$Res>
    implements $AddMaterialStateCopyWith<$Res> {
  factory _$$AddMaterialStateImplCopyWith(_$AddMaterialStateImpl value,
          $Res Function(_$AddMaterialStateImpl) then) =
      __$$AddMaterialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String projectId,
      String materialName,
      String quantity,
      String description,
      String unit,
      String date,
      List<MaterialModel> materialList,
      bool isUpdate});
}

/// @nodoc
class __$$AddMaterialStateImplCopyWithImpl<$Res>
    extends _$AddMaterialStateCopyWithImpl<$Res, _$AddMaterialStateImpl>
    implements _$$AddMaterialStateImplCopyWith<$Res> {
  __$$AddMaterialStateImplCopyWithImpl(_$AddMaterialStateImpl _value,
      $Res Function(_$AddMaterialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddMaterialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? projectId = null,
    Object? materialName = null,
    Object? quantity = null,
    Object? description = null,
    Object? unit = null,
    Object? date = null,
    Object? materialList = null,
    Object? isUpdate = null,
  }) {
    return _then(_$AddMaterialStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
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
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      materialList: null == materialList
          ? _value._materialList
          : materialList // ignore: cast_nullable_to_non_nullable
              as List<MaterialModel>,
      isUpdate: null == isUpdate
          ? _value.isUpdate
          : isUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddMaterialStateImpl implements _AddMaterialState {
  _$AddMaterialStateImpl(
      {required this.state,
      required this.message,
      required this.projectId,
      required this.materialName,
      required this.quantity,
      required this.description,
      required this.unit,
      required this.date,
      required final List<MaterialModel> materialList,
      required this.isUpdate})
      : _materialList = materialList;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String projectId;
  @override
  final String materialName;
  @override
  final String quantity;
  @override
  final String description;
  @override
  final String unit;
  @override
  final String date;
  final List<MaterialModel> _materialList;
  @override
  List<MaterialModel> get materialList {
    if (_materialList is EqualUnmodifiableListView) return _materialList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materialList);
  }

  @override
  final bool isUpdate;

  @override
  String toString() {
    return 'AddMaterialState(state: $state, message: $message, projectId: $projectId, materialName: $materialName, quantity: $quantity, description: $description, unit: $unit, date: $date, materialList: $materialList, isUpdate: $isUpdate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddMaterialStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality()
                .equals(other._materialList, _materialList) &&
            (identical(other.isUpdate, isUpdate) ||
                other.isUpdate == isUpdate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      message,
      projectId,
      materialName,
      quantity,
      description,
      unit,
      date,
      const DeepCollectionEquality().hash(_materialList),
      isUpdate);

  /// Create a copy of AddMaterialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddMaterialStateImplCopyWith<_$AddMaterialStateImpl> get copyWith =>
      __$$AddMaterialStateImplCopyWithImpl<_$AddMaterialStateImpl>(
          this, _$identity);
}

abstract class _AddMaterialState implements AddMaterialState {
  factory _AddMaterialState(
      {required final RequestState state,
      required final String message,
      required final String projectId,
      required final String materialName,
      required final String quantity,
      required final String description,
      required final String unit,
      required final String date,
      required final List<MaterialModel> materialList,
      required final bool isUpdate}) = _$AddMaterialStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get projectId;
  @override
  String get materialName;
  @override
  String get quantity;
  @override
  String get description;
  @override
  String get unit;
  @override
  String get date;
  @override
  List<MaterialModel> get materialList;
  @override
  bool get isUpdate;

  /// Create a copy of AddMaterialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddMaterialStateImplCopyWith<_$AddMaterialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
