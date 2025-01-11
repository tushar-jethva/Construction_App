// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'building_by_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BuildingByIdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(ProjectModel project) getProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(ProjectModel project)? getProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(ProjectModel project)? getProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetProject value) getProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetProject value)? getProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetProject value)? getProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingByIdEventCopyWith<$Res> {
  factory $BuildingByIdEventCopyWith(
          BuildingByIdEvent value, $Res Function(BuildingByIdEvent) then) =
      _$BuildingByIdEventCopyWithImpl<$Res, BuildingByIdEvent>;
}

/// @nodoc
class _$BuildingByIdEventCopyWithImpl<$Res, $Val extends BuildingByIdEvent>
    implements $BuildingByIdEventCopyWith<$Res> {
  _$BuildingByIdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuildingByIdEvent
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
    extends _$BuildingByIdEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuildingByIdEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'BuildingByIdEvent.initialize()';
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
    required TResult Function(ProjectModel project) getProject,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(ProjectModel project)? getProject,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(ProjectModel project)? getProject,
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
    required TResult Function(_GetProject value) getProject,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetProject value)? getProject,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetProject value)? getProject,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements BuildingByIdEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$GetProjectImplCopyWith<$Res> {
  factory _$$GetProjectImplCopyWith(
          _$GetProjectImpl value, $Res Function(_$GetProjectImpl) then) =
      __$$GetProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectModel project});
}

/// @nodoc
class __$$GetProjectImplCopyWithImpl<$Res>
    extends _$BuildingByIdEventCopyWithImpl<$Res, _$GetProjectImpl>
    implements _$$GetProjectImplCopyWith<$Res> {
  __$$GetProjectImplCopyWithImpl(
      _$GetProjectImpl _value, $Res Function(_$GetProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuildingByIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$GetProjectImpl(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectModel,
    ));
  }
}

/// @nodoc

class _$GetProjectImpl implements _GetProject {
  const _$GetProjectImpl({required this.project});

  @override
  final ProjectModel project;

  @override
  String toString() {
    return 'BuildingByIdEvent.getProject(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProjectImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  /// Create a copy of BuildingByIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProjectImplCopyWith<_$GetProjectImpl> get copyWith =>
      __$$GetProjectImplCopyWithImpl<_$GetProjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(ProjectModel project) getProject,
  }) {
    return getProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(ProjectModel project)? getProject,
  }) {
    return getProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(ProjectModel project)? getProject,
    required TResult orElse(),
  }) {
    if (getProject != null) {
      return getProject(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetProject value) getProject,
  }) {
    return getProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetProject value)? getProject,
  }) {
    return getProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetProject value)? getProject,
    required TResult orElse(),
  }) {
    if (getProject != null) {
      return getProject(this);
    }
    return orElse();
  }
}

abstract class _GetProject implements BuildingByIdEvent {
  const factory _GetProject({required final ProjectModel project}) =
      _$GetProjectImpl;

  ProjectModel get project;

  /// Create a copy of BuildingByIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetProjectImplCopyWith<_$GetProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BuildingByIdState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  ProjectModel? get project => throw _privateConstructorUsedError;

  /// Create a copy of BuildingByIdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuildingByIdStateCopyWith<BuildingByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuildingByIdStateCopyWith<$Res> {
  factory $BuildingByIdStateCopyWith(
          BuildingByIdState value, $Res Function(BuildingByIdState) then) =
      _$BuildingByIdStateCopyWithImpl<$Res, BuildingByIdState>;
  @useResult
  $Res call({RequestState state, String message, ProjectModel? project});
}

/// @nodoc
class _$BuildingByIdStateCopyWithImpl<$Res, $Val extends BuildingByIdState>
    implements $BuildingByIdStateCopyWith<$Res> {
  _$BuildingByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuildingByIdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? project = freezed,
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
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuildingByIdStateImplCopyWith<$Res>
    implements $BuildingByIdStateCopyWith<$Res> {
  factory _$$BuildingByIdStateImplCopyWith(_$BuildingByIdStateImpl value,
          $Res Function(_$BuildingByIdStateImpl) then) =
      __$$BuildingByIdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, ProjectModel? project});
}

/// @nodoc
class __$$BuildingByIdStateImplCopyWithImpl<$Res>
    extends _$BuildingByIdStateCopyWithImpl<$Res, _$BuildingByIdStateImpl>
    implements _$$BuildingByIdStateImplCopyWith<$Res> {
  __$$BuildingByIdStateImplCopyWithImpl(_$BuildingByIdStateImpl _value,
      $Res Function(_$BuildingByIdStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuildingByIdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? project = freezed,
  }) {
    return _then(_$BuildingByIdStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as ProjectModel?,
    ));
  }
}

/// @nodoc

class _$BuildingByIdStateImpl implements _BuildingByIdState {
  const _$BuildingByIdStateImpl(
      {required this.state, required this.message, required this.project});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final ProjectModel? project;

  @override
  String toString() {
    return 'BuildingByIdState(state: $state, message: $message, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuildingByIdStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, project);

  /// Create a copy of BuildingByIdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuildingByIdStateImplCopyWith<_$BuildingByIdStateImpl> get copyWith =>
      __$$BuildingByIdStateImplCopyWithImpl<_$BuildingByIdStateImpl>(
          this, _$identity);
}

abstract class _BuildingByIdState implements BuildingByIdState {
  const factory _BuildingByIdState(
      {required final RequestState state,
      required final String message,
      required final ProjectModel? project}) = _$BuildingByIdStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  ProjectModel? get project;

  /// Create a copy of BuildingByIdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuildingByIdStateImplCopyWith<_$BuildingByIdStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
