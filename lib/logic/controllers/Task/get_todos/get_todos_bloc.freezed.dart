// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_todos_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetTodosEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String taskId) getTodos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String taskId)? getTodos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String taskId)? getTodos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetTodos value) getTodos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetTodos value)? getTodos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetTodos value)? getTodos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTodosEventCopyWith<$Res> {
  factory $GetTodosEventCopyWith(
          GetTodosEvent value, $Res Function(GetTodosEvent) then) =
      _$GetTodosEventCopyWithImpl<$Res, GetTodosEvent>;
}

/// @nodoc
class _$GetTodosEventCopyWithImpl<$Res, $Val extends GetTodosEvent>
    implements $GetTodosEventCopyWith<$Res> {
  _$GetTodosEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTodosEvent
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
    extends _$GetTodosEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTodosEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'GetTodosEvent.initialize()';
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
    required TResult Function(String taskId) getTodos,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String taskId)? getTodos,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String taskId)? getTodos,
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
    required TResult Function(_GetTodos value) getTodos,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetTodos value)? getTodos,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetTodos value)? getTodos,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements GetTodosEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$GetTodosImplCopyWith<$Res> {
  factory _$$GetTodosImplCopyWith(
          _$GetTodosImpl value, $Res Function(_$GetTodosImpl) then) =
      __$$GetTodosImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$GetTodosImplCopyWithImpl<$Res>
    extends _$GetTodosEventCopyWithImpl<$Res, _$GetTodosImpl>
    implements _$$GetTodosImplCopyWith<$Res> {
  __$$GetTodosImplCopyWithImpl(
      _$GetTodosImpl _value, $Res Function(_$GetTodosImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$GetTodosImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetTodosImpl implements _GetTodos {
  const _$GetTodosImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'GetTodosEvent.getTodos(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTodosImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of GetTodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTodosImplCopyWith<_$GetTodosImpl> get copyWith =>
      __$$GetTodosImplCopyWithImpl<_$GetTodosImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String taskId) getTodos,
  }) {
    return getTodos(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String taskId)? getTodos,
  }) {
    return getTodos?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String taskId)? getTodos,
    required TResult orElse(),
  }) {
    if (getTodos != null) {
      return getTodos(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_GetTodos value) getTodos,
  }) {
    return getTodos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_GetTodos value)? getTodos,
  }) {
    return getTodos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_GetTodos value)? getTodos,
    required TResult orElse(),
  }) {
    if (getTodos != null) {
      return getTodos(this);
    }
    return orElse();
  }
}

abstract class _GetTodos implements GetTodosEvent {
  const factory _GetTodos({required final String taskId}) = _$GetTodosImpl;

  String get taskId;

  /// Create a copy of GetTodosEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTodosImplCopyWith<_$GetTodosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetTodosState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<GetTodoModel> get todosPending => throw _privateConstructorUsedError;
  List<GetTodoModel> get todosCompleted => throw _privateConstructorUsedError;

  /// Create a copy of GetTodosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTodosStateCopyWith<GetTodosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTodosStateCopyWith<$Res> {
  factory $GetTodosStateCopyWith(
          GetTodosState value, $Res Function(GetTodosState) then) =
      _$GetTodosStateCopyWithImpl<$Res, GetTodosState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      List<GetTodoModel> todosPending,
      List<GetTodoModel> todosCompleted});
}

/// @nodoc
class _$GetTodosStateCopyWithImpl<$Res, $Val extends GetTodosState>
    implements $GetTodosStateCopyWith<$Res> {
  _$GetTodosStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTodosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? todosPending = null,
    Object? todosCompleted = null,
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
      todosPending: null == todosPending
          ? _value.todosPending
          : todosPending // ignore: cast_nullable_to_non_nullable
              as List<GetTodoModel>,
      todosCompleted: null == todosCompleted
          ? _value.todosCompleted
          : todosCompleted // ignore: cast_nullable_to_non_nullable
              as List<GetTodoModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTodosStateImplCopyWith<$Res>
    implements $GetTodosStateCopyWith<$Res> {
  factory _$$GetTodosStateImplCopyWith(
          _$GetTodosStateImpl value, $Res Function(_$GetTodosStateImpl) then) =
      __$$GetTodosStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      List<GetTodoModel> todosPending,
      List<GetTodoModel> todosCompleted});
}

/// @nodoc
class __$$GetTodosStateImplCopyWithImpl<$Res>
    extends _$GetTodosStateCopyWithImpl<$Res, _$GetTodosStateImpl>
    implements _$$GetTodosStateImplCopyWith<$Res> {
  __$$GetTodosStateImplCopyWithImpl(
      _$GetTodosStateImpl _value, $Res Function(_$GetTodosStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTodosState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? todosPending = null,
    Object? todosCompleted = null,
  }) {
    return _then(_$GetTodosStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      todosPending: null == todosPending
          ? _value._todosPending
          : todosPending // ignore: cast_nullable_to_non_nullable
              as List<GetTodoModel>,
      todosCompleted: null == todosCompleted
          ? _value._todosCompleted
          : todosCompleted // ignore: cast_nullable_to_non_nullable
              as List<GetTodoModel>,
    ));
  }
}

/// @nodoc

class _$GetTodosStateImpl implements _GetTodosState {
  const _$GetTodosStateImpl(
      {required this.state,
      required this.message,
      required final List<GetTodoModel> todosPending,
      required final List<GetTodoModel> todosCompleted})
      : _todosPending = todosPending,
        _todosCompleted = todosCompleted;

  @override
  final RequestState state;
  @override
  final String message;
  final List<GetTodoModel> _todosPending;
  @override
  List<GetTodoModel> get todosPending {
    if (_todosPending is EqualUnmodifiableListView) return _todosPending;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todosPending);
  }

  final List<GetTodoModel> _todosCompleted;
  @override
  List<GetTodoModel> get todosCompleted {
    if (_todosCompleted is EqualUnmodifiableListView) return _todosCompleted;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todosCompleted);
  }

  @override
  String toString() {
    return 'GetTodosState(state: $state, message: $message, todosPending: $todosPending, todosCompleted: $todosCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTodosStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._todosPending, _todosPending) &&
            const DeepCollectionEquality()
                .equals(other._todosCompleted, _todosCompleted));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      message,
      const DeepCollectionEquality().hash(_todosPending),
      const DeepCollectionEquality().hash(_todosCompleted));

  /// Create a copy of GetTodosState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTodosStateImplCopyWith<_$GetTodosStateImpl> get copyWith =>
      __$$GetTodosStateImplCopyWithImpl<_$GetTodosStateImpl>(this, _$identity);
}

abstract class _GetTodosState implements GetTodosState {
  const factory _GetTodosState(
      {required final RequestState state,
      required final String message,
      required final List<GetTodoModel> todosPending,
      required final List<GetTodoModel> todosCompleted}) = _$GetTodosStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  List<GetTodoModel> get todosPending;
  @override
  List<GetTodoModel> get todosCompleted;

  /// Create a copy of GetTodosState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTodosStateImplCopyWith<_$GetTodosStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
