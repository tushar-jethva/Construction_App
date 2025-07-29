// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'current_task_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrentTaskEvent {
  GetTaskModel? get task => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetTaskModel? task) setCurrentTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetTaskModel? task)? setCurrentTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetTaskModel? task)? setCurrentTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetCurrentTask value) setCurrentTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetCurrentTask value)? setCurrentTask,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetCurrentTask value)? setCurrentTask,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of CurrentTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentTaskEventCopyWith<CurrentTaskEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentTaskEventCopyWith<$Res> {
  factory $CurrentTaskEventCopyWith(
          CurrentTaskEvent value, $Res Function(CurrentTaskEvent) then) =
      _$CurrentTaskEventCopyWithImpl<$Res, CurrentTaskEvent>;
  @useResult
  $Res call({GetTaskModel? task});
}

/// @nodoc
class _$CurrentTaskEventCopyWithImpl<$Res, $Val extends CurrentTaskEvent>
    implements $CurrentTaskEventCopyWith<$Res> {
  _$CurrentTaskEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_value.copyWith(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as GetTaskModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetCurrentTaskImplCopyWith<$Res>
    implements $CurrentTaskEventCopyWith<$Res> {
  factory _$$SetCurrentTaskImplCopyWith(_$SetCurrentTaskImpl value,
          $Res Function(_$SetCurrentTaskImpl) then) =
      __$$SetCurrentTaskImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetTaskModel? task});
}

/// @nodoc
class __$$SetCurrentTaskImplCopyWithImpl<$Res>
    extends _$CurrentTaskEventCopyWithImpl<$Res, _$SetCurrentTaskImpl>
    implements _$$SetCurrentTaskImplCopyWith<$Res> {
  __$$SetCurrentTaskImplCopyWithImpl(
      _$SetCurrentTaskImpl _value, $Res Function(_$SetCurrentTaskImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$SetCurrentTaskImpl(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as GetTaskModel?,
    ));
  }
}

/// @nodoc

class _$SetCurrentTaskImpl implements _SetCurrentTask {
  const _$SetCurrentTaskImpl({required this.task});

  @override
  final GetTaskModel? task;

  @override
  String toString() {
    return 'CurrentTaskEvent.setCurrentTask(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetCurrentTaskImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of CurrentTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetCurrentTaskImplCopyWith<_$SetCurrentTaskImpl> get copyWith =>
      __$$SetCurrentTaskImplCopyWithImpl<_$SetCurrentTaskImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GetTaskModel? task) setCurrentTask,
  }) {
    return setCurrentTask(task);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GetTaskModel? task)? setCurrentTask,
  }) {
    return setCurrentTask?.call(task);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GetTaskModel? task)? setCurrentTask,
    required TResult orElse(),
  }) {
    if (setCurrentTask != null) {
      return setCurrentTask(task);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetCurrentTask value) setCurrentTask,
  }) {
    return setCurrentTask(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetCurrentTask value)? setCurrentTask,
  }) {
    return setCurrentTask?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetCurrentTask value)? setCurrentTask,
    required TResult orElse(),
  }) {
    if (setCurrentTask != null) {
      return setCurrentTask(this);
    }
    return orElse();
  }
}

abstract class _SetCurrentTask implements CurrentTaskEvent {
  const factory _SetCurrentTask({required final GetTaskModel? task}) =
      _$SetCurrentTaskImpl;

  @override
  GetTaskModel? get task;

  /// Create a copy of CurrentTaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetCurrentTaskImplCopyWith<_$SetCurrentTaskImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CurrentTaskState {
  GetTaskModel? get task => throw _privateConstructorUsedError;

  /// Create a copy of CurrentTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentTaskStateCopyWith<CurrentTaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentTaskStateCopyWith<$Res> {
  factory $CurrentTaskStateCopyWith(
          CurrentTaskState value, $Res Function(CurrentTaskState) then) =
      _$CurrentTaskStateCopyWithImpl<$Res, CurrentTaskState>;
  @useResult
  $Res call({GetTaskModel? task});
}

/// @nodoc
class _$CurrentTaskStateCopyWithImpl<$Res, $Val extends CurrentTaskState>
    implements $CurrentTaskStateCopyWith<$Res> {
  _$CurrentTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_value.copyWith(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as GetTaskModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentTaskStateImplCopyWith<$Res>
    implements $CurrentTaskStateCopyWith<$Res> {
  factory _$$CurrentTaskStateImplCopyWith(_$CurrentTaskStateImpl value,
          $Res Function(_$CurrentTaskStateImpl) then) =
      __$$CurrentTaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GetTaskModel? task});
}

/// @nodoc
class __$$CurrentTaskStateImplCopyWithImpl<$Res>
    extends _$CurrentTaskStateCopyWithImpl<$Res, _$CurrentTaskStateImpl>
    implements _$$CurrentTaskStateImplCopyWith<$Res> {
  __$$CurrentTaskStateImplCopyWithImpl(_$CurrentTaskStateImpl _value,
      $Res Function(_$CurrentTaskStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
  }) {
    return _then(_$CurrentTaskStateImpl(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as GetTaskModel?,
    ));
  }
}

/// @nodoc

class _$CurrentTaskStateImpl implements _CurrentTaskState {
  const _$CurrentTaskStateImpl({required this.task});

  @override
  final GetTaskModel? task;

  @override
  String toString() {
    return 'CurrentTaskState(task: $task)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentTaskStateImpl &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  /// Create a copy of CurrentTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentTaskStateImplCopyWith<_$CurrentTaskStateImpl> get copyWith =>
      __$$CurrentTaskStateImplCopyWithImpl<_$CurrentTaskStateImpl>(
          this, _$identity);
}

abstract class _CurrentTaskState implements CurrentTaskState {
  const factory _CurrentTaskState({required final GetTaskModel? task}) =
      _$CurrentTaskStateImpl;

  @override
  GetTaskModel? get task;

  /// Create a copy of CurrentTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentTaskStateImplCopyWith<_$CurrentTaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
