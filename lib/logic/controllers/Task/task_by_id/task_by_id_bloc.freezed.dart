// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_by_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskByIdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String taskId) getTaskById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String taskId)? getTaskById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String taskId)? getTaskById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetTaskById value) getTaskById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetTaskById value)? getTaskById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetTaskById value)? getTaskById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskByIdEventCopyWith<$Res> {
  factory $TaskByIdEventCopyWith(
          TaskByIdEvent value, $Res Function(TaskByIdEvent) then) =
      _$TaskByIdEventCopyWithImpl<$Res, TaskByIdEvent>;
}

/// @nodoc
class _$TaskByIdEventCopyWithImpl<$Res, $Val extends TaskByIdEvent>
    implements $TaskByIdEventCopyWith<$Res> {
  _$TaskByIdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskByIdEvent
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
    extends _$TaskByIdEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskByIdEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'TaskByIdEvent.initialize()';
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
    required TResult Function(String taskId) getTaskById,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String taskId)? getTaskById,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String taskId)? getTaskById,
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
    required TResult Function(_GetTaskById value) getTaskById,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetTaskById value)? getTaskById,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetTaskById value)? getTaskById,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements TaskByIdEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$GetTaskByIdImplCopyWith<$Res> {
  factory _$$GetTaskByIdImplCopyWith(
          _$GetTaskByIdImpl value, $Res Function(_$GetTaskByIdImpl) then) =
      __$$GetTaskByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$GetTaskByIdImplCopyWithImpl<$Res>
    extends _$TaskByIdEventCopyWithImpl<$Res, _$GetTaskByIdImpl>
    implements _$$GetTaskByIdImplCopyWith<$Res> {
  __$$GetTaskByIdImplCopyWithImpl(
      _$GetTaskByIdImpl _value, $Res Function(_$GetTaskByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskByIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$GetTaskByIdImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTaskByIdImpl implements _GetTaskById {
  const _$GetTaskByIdImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'TaskByIdEvent.getTaskById(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTaskByIdImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of TaskByIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTaskByIdImplCopyWith<_$GetTaskByIdImpl> get copyWith =>
      __$$GetTaskByIdImplCopyWithImpl<_$GetTaskByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String taskId) getTaskById,
  }) {
    return getTaskById(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String taskId)? getTaskById,
  }) {
    return getTaskById?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String taskId)? getTaskById,
    required TResult orElse(),
  }) {
    if (getTaskById != null) {
      return getTaskById(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetTaskById value) getTaskById,
  }) {
    return getTaskById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetTaskById value)? getTaskById,
  }) {
    return getTaskById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetTaskById value)? getTaskById,
    required TResult orElse(),
  }) {
    if (getTaskById != null) {
      return getTaskById(this);
    }
    return orElse();
  }
}

abstract class _GetTaskById implements TaskByIdEvent {
  const factory _GetTaskById({required final String taskId}) =
      _$GetTaskByIdImpl;

  String get taskId;

  /// Create a copy of TaskByIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTaskByIdImplCopyWith<_$GetTaskByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TaskByIdState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  GetTaskModel? get task => throw _privateConstructorUsedError;

  /// Create a copy of TaskByIdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaskByIdStateCopyWith<TaskByIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskByIdStateCopyWith<$Res> {
  factory $TaskByIdStateCopyWith(
          TaskByIdState value, $Res Function(TaskByIdState) then) =
      _$TaskByIdStateCopyWithImpl<$Res, TaskByIdState>;
  @useResult
  $Res call({RequestState state, String message, GetTaskModel? task});
}

/// @nodoc
class _$TaskByIdStateCopyWithImpl<$Res, $Val extends TaskByIdState>
    implements $TaskByIdStateCopyWith<$Res> {
  _$TaskByIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaskByIdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? task = freezed,
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
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as GetTaskModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskByIdStateImplCopyWith<$Res>
    implements $TaskByIdStateCopyWith<$Res> {
  factory _$$TaskByIdStateImplCopyWith(
          _$TaskByIdStateImpl value, $Res Function(_$TaskByIdStateImpl) then) =
      __$$TaskByIdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, GetTaskModel? task});
}

/// @nodoc
class __$$TaskByIdStateImplCopyWithImpl<$Res>
    extends _$TaskByIdStateCopyWithImpl<$Res, _$TaskByIdStateImpl>
    implements _$$TaskByIdStateImplCopyWith<$Res> {
  __$$TaskByIdStateImplCopyWithImpl(
      _$TaskByIdStateImpl _value, $Res Function(_$TaskByIdStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaskByIdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? task = freezed,
  }) {
    return _then(_$TaskByIdStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as GetTaskModel?,
    ));
  }
}

/// @nodoc

class _$TaskByIdStateImpl implements _TaskByIdState {
  const _$TaskByIdStateImpl(
      {required this.state, required this.message, required this.task});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final GetTaskModel? task;

  @override
  String toString() {
    return 'TaskByIdState(state: $state, message: $message, task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskByIdStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, task);

  /// Create a copy of TaskByIdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskByIdStateImplCopyWith<_$TaskByIdStateImpl> get copyWith =>
      __$$TaskByIdStateImplCopyWithImpl<_$TaskByIdStateImpl>(this, _$identity);
}

abstract class _TaskByIdState implements TaskByIdState {
  const factory _TaskByIdState(
      {required final RequestState state,
      required final String message,
      required final GetTaskModel? task}) = _$TaskByIdStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  GetTaskModel? get task;

  /// Create a copy of TaskByIdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaskByIdStateImplCopyWith<_$TaskByIdStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
