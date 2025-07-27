// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateTodoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String todoId) todoIdChanged,
    required TResult Function(String taskId, String todoId, String status)
        updateTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String todoId)? todoIdChanged,
    TResult? Function(String taskId, String todoId, String status)? updateTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String todoId)? todoIdChanged,
    TResult Function(String taskId, String todoId, String status)? updateTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_TodoIdChanged value) todoIdChanged,
    required TResult Function(_UpdateTodo value) updateTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_TodoIdChanged value)? todoIdChanged,
    TResult? Function(_UpdateTodo value)? updateTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_TodoIdChanged value)? todoIdChanged,
    TResult Function(_UpdateTodo value)? updateTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTodoEventCopyWith<$Res> {
  factory $UpdateTodoEventCopyWith(
          UpdateTodoEvent value, $Res Function(UpdateTodoEvent) then) =
      _$UpdateTodoEventCopyWithImpl<$Res, UpdateTodoEvent>;
}

/// @nodoc
class _$UpdateTodoEventCopyWithImpl<$Res, $Val extends UpdateTodoEvent>
    implements $UpdateTodoEventCopyWith<$Res> {
  _$UpdateTodoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTodoEvent
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
    extends _$UpdateTodoEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTodoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'UpdateTodoEvent.initialize()';
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
    required TResult Function(String todoId) todoIdChanged,
    required TResult Function(String taskId, String todoId, String status)
        updateTodo,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String todoId)? todoIdChanged,
    TResult? Function(String taskId, String todoId, String status)? updateTodo,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String todoId)? todoIdChanged,
    TResult Function(String taskId, String todoId, String status)? updateTodo,
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
    required TResult Function(_TodoIdChanged value) todoIdChanged,
    required TResult Function(_UpdateTodo value) updateTodo,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_TodoIdChanged value)? todoIdChanged,
    TResult? Function(_UpdateTodo value)? updateTodo,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_TodoIdChanged value)? todoIdChanged,
    TResult Function(_UpdateTodo value)? updateTodo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements UpdateTodoEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$TodoIdChangedImplCopyWith<$Res> {
  factory _$$TodoIdChangedImplCopyWith(
          _$TodoIdChangedImpl value, $Res Function(_$TodoIdChangedImpl) then) =
      __$$TodoIdChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String todoId});
}

/// @nodoc
class __$$TodoIdChangedImplCopyWithImpl<$Res>
    extends _$UpdateTodoEventCopyWithImpl<$Res, _$TodoIdChangedImpl>
    implements _$$TodoIdChangedImplCopyWith<$Res> {
  __$$TodoIdChangedImplCopyWithImpl(
      _$TodoIdChangedImpl _value, $Res Function(_$TodoIdChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todoId = null,
  }) {
    return _then(_$TodoIdChangedImpl(
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TodoIdChangedImpl implements _TodoIdChanged {
  const _$TodoIdChangedImpl({required this.todoId});

  @override
  final String todoId;

  @override
  String toString() {
    return 'UpdateTodoEvent.todoIdChanged(todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoIdChangedImpl &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todoId);

  /// Create a copy of UpdateTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoIdChangedImplCopyWith<_$TodoIdChangedImpl> get copyWith =>
      __$$TodoIdChangedImplCopyWithImpl<_$TodoIdChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String todoId) todoIdChanged,
    required TResult Function(String taskId, String todoId, String status)
        updateTodo,
  }) {
    return todoIdChanged(todoId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String todoId)? todoIdChanged,
    TResult? Function(String taskId, String todoId, String status)? updateTodo,
  }) {
    return todoIdChanged?.call(todoId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String todoId)? todoIdChanged,
    TResult Function(String taskId, String todoId, String status)? updateTodo,
    required TResult orElse(),
  }) {
    if (todoIdChanged != null) {
      return todoIdChanged(todoId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_TodoIdChanged value) todoIdChanged,
    required TResult Function(_UpdateTodo value) updateTodo,
  }) {
    return todoIdChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_TodoIdChanged value)? todoIdChanged,
    TResult? Function(_UpdateTodo value)? updateTodo,
  }) {
    return todoIdChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_TodoIdChanged value)? todoIdChanged,
    TResult Function(_UpdateTodo value)? updateTodo,
    required TResult orElse(),
  }) {
    if (todoIdChanged != null) {
      return todoIdChanged(this);
    }
    return orElse();
  }
}

abstract class _TodoIdChanged implements UpdateTodoEvent {
  const factory _TodoIdChanged({required final String todoId}) =
      _$TodoIdChangedImpl;

  String get todoId;

  /// Create a copy of UpdateTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodoIdChangedImplCopyWith<_$TodoIdChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTodoImplCopyWith<$Res> {
  factory _$$UpdateTodoImplCopyWith(
          _$UpdateTodoImpl value, $Res Function(_$UpdateTodoImpl) then) =
      __$$UpdateTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId, String todoId, String status});
}

/// @nodoc
class __$$UpdateTodoImplCopyWithImpl<$Res>
    extends _$UpdateTodoEventCopyWithImpl<$Res, _$UpdateTodoImpl>
    implements _$$UpdateTodoImplCopyWith<$Res> {
  __$$UpdateTodoImplCopyWithImpl(
      _$UpdateTodoImpl _value, $Res Function(_$UpdateTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
    Object? todoId = null,
    Object? status = null,
  }) {
    return _then(_$UpdateTodoImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateTodoImpl implements _UpdateTodo {
  const _$UpdateTodoImpl(
      {required this.taskId, required this.todoId, required this.status});

  @override
  final String taskId;
  @override
  final String todoId;
  @override
  final String status;

  @override
  String toString() {
    return 'UpdateTodoEvent.updateTodo(taskId: $taskId, todoId: $todoId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.todoId, todoId) || other.todoId == todoId) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId, todoId, status);

  /// Create a copy of UpdateTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      __$$UpdateTodoImplCopyWithImpl<_$UpdateTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String todoId) todoIdChanged,
    required TResult Function(String taskId, String todoId, String status)
        updateTodo,
  }) {
    return updateTodo(taskId, todoId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String todoId)? todoIdChanged,
    TResult? Function(String taskId, String todoId, String status)? updateTodo,
  }) {
    return updateTodo?.call(taskId, todoId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String todoId)? todoIdChanged,
    TResult Function(String taskId, String todoId, String status)? updateTodo,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(taskId, todoId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_TodoIdChanged value) todoIdChanged,
    required TResult Function(_UpdateTodo value) updateTodo,
  }) {
    return updateTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_TodoIdChanged value)? todoIdChanged,
    TResult? Function(_UpdateTodo value)? updateTodo,
  }) {
    return updateTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_TodoIdChanged value)? todoIdChanged,
    TResult Function(_UpdateTodo value)? updateTodo,
    required TResult orElse(),
  }) {
    if (updateTodo != null) {
      return updateTodo(this);
    }
    return orElse();
  }
}

abstract class _UpdateTodo implements UpdateTodoEvent {
  const factory _UpdateTodo(
      {required final String taskId,
      required final String todoId,
      required final String status}) = _$UpdateTodoImpl;

  String get taskId;
  String get todoId;
  String get status;

  /// Create a copy of UpdateTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTodoImplCopyWith<_$UpdateTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateTodoState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get todoId => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTodoStateCopyWith<UpdateTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTodoStateCopyWith<$Res> {
  factory $UpdateTodoStateCopyWith(
          UpdateTodoState value, $Res Function(UpdateTodoState) then) =
      _$UpdateTodoStateCopyWithImpl<$Res, UpdateTodoState>;
  @useResult
  $Res call({RequestState state, String message, String todoId});
}

/// @nodoc
class _$UpdateTodoStateCopyWithImpl<$Res, $Val extends UpdateTodoState>
    implements $UpdateTodoStateCopyWith<$Res> {
  _$UpdateTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? todoId = null,
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
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTodoStateImplCopyWith<$Res>
    implements $UpdateTodoStateCopyWith<$Res> {
  factory _$$UpdateTodoStateImplCopyWith(_$UpdateTodoStateImpl value,
          $Res Function(_$UpdateTodoStateImpl) then) =
      __$$UpdateTodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, String todoId});
}

/// @nodoc
class __$$UpdateTodoStateImplCopyWithImpl<$Res>
    extends _$UpdateTodoStateCopyWithImpl<$Res, _$UpdateTodoStateImpl>
    implements _$$UpdateTodoStateImplCopyWith<$Res> {
  __$$UpdateTodoStateImplCopyWithImpl(
      _$UpdateTodoStateImpl _value, $Res Function(_$UpdateTodoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? todoId = null,
  }) {
    return _then(_$UpdateTodoStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      todoId: null == todoId
          ? _value.todoId
          : todoId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateTodoStateImpl implements _UpdateTodoState {
  const _$UpdateTodoStateImpl(
      {required this.state, required this.message, required this.todoId});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String todoId;

  @override
  String toString() {
    return 'UpdateTodoState(state: $state, message: $message, todoId: $todoId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTodoStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.todoId, todoId) || other.todoId == todoId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, todoId);

  /// Create a copy of UpdateTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTodoStateImplCopyWith<_$UpdateTodoStateImpl> get copyWith =>
      __$$UpdateTodoStateImplCopyWithImpl<_$UpdateTodoStateImpl>(
          this, _$identity);
}

abstract class _UpdateTodoState implements UpdateTodoState {
  const factory _UpdateTodoState(
      {required final RequestState state,
      required final String message,
      required final String todoId}) = _$UpdateTodoStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get todoId;

  /// Create a copy of UpdateTodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTodoStateImplCopyWith<_$UpdateTodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
