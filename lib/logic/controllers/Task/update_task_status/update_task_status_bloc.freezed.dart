// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_status_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateTaskStatusEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String taskId, String status) updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String taskId, String status)? updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String taskId, String status)? updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateStatus value) updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateStatus value)? updateStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskStatusEventCopyWith<$Res> {
  factory $UpdateTaskStatusEventCopyWith(UpdateTaskStatusEvent value,
          $Res Function(UpdateTaskStatusEvent) then) =
      _$UpdateTaskStatusEventCopyWithImpl<$Res, UpdateTaskStatusEvent>;
}

/// @nodoc
class _$UpdateTaskStatusEventCopyWithImpl<$Res,
        $Val extends UpdateTaskStatusEvent>
    implements $UpdateTaskStatusEventCopyWith<$Res> {
  _$UpdateTaskStatusEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTaskStatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$UpdateTaskStatusEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTaskStatusEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UpdateTaskStatusEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String taskId, String status) updateStatus,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String taskId, String status)? updateStatus,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String taskId, String status)? updateStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateStatus value) updateStatus,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateStatus value)? updateStatus,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UpdateTaskStatusEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$UpdateStatusImplCopyWith<$Res> {
  factory _$$UpdateStatusImplCopyWith(
          _$UpdateStatusImpl value, $Res Function(_$UpdateStatusImpl) then) =
      __$$UpdateStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId, String status});
}

/// @nodoc
class __$$UpdateStatusImplCopyWithImpl<$Res>
    extends _$UpdateTaskStatusEventCopyWithImpl<$Res, _$UpdateStatusImpl>
    implements _$$UpdateStatusImplCopyWith<$Res> {
  __$$UpdateStatusImplCopyWithImpl(
      _$UpdateStatusImpl _value, $Res Function(_$UpdateStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTaskStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? status = null,
  }) {
    return _then(_$UpdateStatusImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateStatusImpl implements _UpdateStatus {
  const _$UpdateStatusImpl({required this.taskId, required this.status});

  @override
  final String taskId;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateTaskStatusEvent.updateStatus(taskId: $taskId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateStatusImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, status);

  /// Create a copy of UpdateTaskStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateStatusImplCopyWith<_$UpdateStatusImpl> get copyWith =>
      __$$UpdateStatusImplCopyWithImpl<_$UpdateStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String taskId, String status) updateStatus,
  }) {
    return updateStatus(taskId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String taskId, String status)? updateStatus,
  }) {
    return updateStatus?.call(taskId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String taskId, String status)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(taskId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_UpdateStatus value) updateStatus,
  }) {
    return updateStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_UpdateStatus value)? updateStatus,
  }) {
    return updateStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_UpdateStatus value)? updateStatus,
    required TResult orElse(),
  }) {
    if (updateStatus != null) {
      return updateStatus(this);
    }
    return orElse();
  }
}

abstract class _UpdateStatus implements UpdateTaskStatusEvent {
  const factory _UpdateStatus(
      {required final String taskId,
      required final String status}) = _$UpdateStatusImpl;

  String get taskId;
  String get status;

  /// Create a copy of UpdateTaskStatusEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateStatusImplCopyWith<_$UpdateStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateTaskStatusState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTaskStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTaskStatusStateCopyWith<UpdateTaskStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskStatusStateCopyWith<$Res> {
  factory $UpdateTaskStatusStateCopyWith(UpdateTaskStatusState value,
          $Res Function(UpdateTaskStatusState) then) =
      _$UpdateTaskStatusStateCopyWithImpl<$Res, UpdateTaskStatusState>;
  @useResult
  $Res call({RequestState state, String message});
}

/// @nodoc
class _$UpdateTaskStatusStateCopyWithImpl<$Res,
        $Val extends UpdateTaskStatusState>
    implements $UpdateTaskStatusStateCopyWith<$Res> {
  _$UpdateTaskStatusStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTaskStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTaskStatusStateImplCopyWith<$Res>
    implements $UpdateTaskStatusStateCopyWith<$Res> {
  factory _$$UpdateTaskStatusStateImplCopyWith(
          _$UpdateTaskStatusStateImpl value,
          $Res Function(_$UpdateTaskStatusStateImpl) then) =
      __$$UpdateTaskStatusStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message});
}

/// @nodoc
class __$$UpdateTaskStatusStateImplCopyWithImpl<$Res>
    extends _$UpdateTaskStatusStateCopyWithImpl<$Res,
        _$UpdateTaskStatusStateImpl>
    implements _$$UpdateTaskStatusStateImplCopyWith<$Res> {
  __$$UpdateTaskStatusStateImplCopyWithImpl(_$UpdateTaskStatusStateImpl _value,
      $Res Function(_$UpdateTaskStatusStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTaskStatusState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
  }) {
    return _then(_$UpdateTaskStatusStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateTaskStatusStateImpl implements _UpdateTaskStatusState {
  const _$UpdateTaskStatusStateImpl(
      {required this.state, required this.message});

  @override
  final RequestState state;
  @override
  final String message;

  @override
  String toString() {
    return 'UpdateTaskStatusState(state: $state, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTaskStatusStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message);

  /// Create a copy of UpdateTaskStatusState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTaskStatusStateImplCopyWith<_$UpdateTaskStatusStateImpl>
      get copyWith => __$$UpdateTaskStatusStateImplCopyWithImpl<
          _$UpdateTaskStatusStateImpl>(this, _$identity);
}

abstract class _UpdateTaskStatusState implements UpdateTaskStatusState {
  const factory _UpdateTaskStatusState(
      {required final RequestState state,
      required final String message}) = _$UpdateTaskStatusStateImpl;

  @override
  RequestState get state;
  @override
  String get message;

  /// Create a copy of UpdateTaskStatusState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTaskStatusStateImplCopyWith<_$UpdateTaskStatusStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
