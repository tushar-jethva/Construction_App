// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_progress_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UpdateTaskProgressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(num progress) onProgressChanged,
    required TResult Function(String taskId) updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(num progress)? onProgressChanged,
    TResult? Function(String taskId)? updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(num progress)? onProgressChanged,
    TResult Function(String taskId)? updateProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnProgressChanged value) onProgressChanged,
    required TResult Function(_UpdateProgress value) updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnProgressChanged value)? onProgressChanged,
    TResult? Function(_UpdateProgress value)? updateProgress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnProgressChanged value)? onProgressChanged,
    TResult Function(_UpdateProgress value)? updateProgress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskProgressEventCopyWith<$Res> {
  factory $UpdateTaskProgressEventCopyWith(UpdateTaskProgressEvent value,
          $Res Function(UpdateTaskProgressEvent) then) =
      _$UpdateTaskProgressEventCopyWithImpl<$Res, UpdateTaskProgressEvent>;
}

/// @nodoc
class _$UpdateTaskProgressEventCopyWithImpl<$Res,
        $Val extends UpdateTaskProgressEvent>
    implements $UpdateTaskProgressEventCopyWith<$Res> {
  _$UpdateTaskProgressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTaskProgressEvent
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
    extends _$UpdateTaskProgressEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTaskProgressEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'UpdateTaskProgressEvent.initialize()';
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
    required TResult Function(num progress) onProgressChanged,
    required TResult Function(String taskId) updateProgress,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(num progress)? onProgressChanged,
    TResult? Function(String taskId)? updateProgress,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(num progress)? onProgressChanged,
    TResult Function(String taskId)? updateProgress,
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
    required TResult Function(_OnProgressChanged value) onProgressChanged,
    required TResult Function(_UpdateProgress value) updateProgress,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnProgressChanged value)? onProgressChanged,
    TResult? Function(_UpdateProgress value)? updateProgress,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnProgressChanged value)? onProgressChanged,
    TResult Function(_UpdateProgress value)? updateProgress,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements UpdateTaskProgressEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$OnProgressChangedImplCopyWith<$Res> {
  factory _$$OnProgressChangedImplCopyWith(_$OnProgressChangedImpl value,
          $Res Function(_$OnProgressChangedImpl) then) =
      __$$OnProgressChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({num progress});
}

/// @nodoc
class __$$OnProgressChangedImplCopyWithImpl<$Res>
    extends _$UpdateTaskProgressEventCopyWithImpl<$Res, _$OnProgressChangedImpl>
    implements _$$OnProgressChangedImplCopyWith<$Res> {
  __$$OnProgressChangedImplCopyWithImpl(_$OnProgressChangedImpl _value,
      $Res Function(_$OnProgressChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTaskProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$OnProgressChangedImpl(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$OnProgressChangedImpl implements _OnProgressChanged {
  const _$OnProgressChangedImpl({required this.progress});

  @override
  final num progress;

  @override
  String toString() {
    return 'UpdateTaskProgressEvent.onProgressChanged(progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnProgressChangedImpl &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress);

  /// Create a copy of UpdateTaskProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnProgressChangedImplCopyWith<_$OnProgressChangedImpl> get copyWith =>
      __$$OnProgressChangedImplCopyWithImpl<_$OnProgressChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(num progress) onProgressChanged,
    required TResult Function(String taskId) updateProgress,
  }) {
    return onProgressChanged(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(num progress)? onProgressChanged,
    TResult? Function(String taskId)? updateProgress,
  }) {
    return onProgressChanged?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(num progress)? onProgressChanged,
    TResult Function(String taskId)? updateProgress,
    required TResult orElse(),
  }) {
    if (onProgressChanged != null) {
      return onProgressChanged(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnProgressChanged value) onProgressChanged,
    required TResult Function(_UpdateProgress value) updateProgress,
  }) {
    return onProgressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnProgressChanged value)? onProgressChanged,
    TResult? Function(_UpdateProgress value)? updateProgress,
  }) {
    return onProgressChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnProgressChanged value)? onProgressChanged,
    TResult Function(_UpdateProgress value)? updateProgress,
    required TResult orElse(),
  }) {
    if (onProgressChanged != null) {
      return onProgressChanged(this);
    }
    return orElse();
  }
}

abstract class _OnProgressChanged implements UpdateTaskProgressEvent {
  const factory _OnProgressChanged({required final num progress}) =
      _$OnProgressChangedImpl;

  num get progress;

  /// Create a copy of UpdateTaskProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnProgressChangedImplCopyWith<_$OnProgressChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProgressImplCopyWith<$Res> {
  factory _$$UpdateProgressImplCopyWith(_$UpdateProgressImpl value,
          $Res Function(_$UpdateProgressImpl) then) =
      __$$UpdateProgressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$UpdateProgressImplCopyWithImpl<$Res>
    extends _$UpdateTaskProgressEventCopyWithImpl<$Res, _$UpdateProgressImpl>
    implements _$$UpdateProgressImplCopyWith<$Res> {
  __$$UpdateProgressImplCopyWithImpl(
      _$UpdateProgressImpl _value, $Res Function(_$UpdateProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTaskProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$UpdateProgressImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateProgressImpl implements _UpdateProgress {
  const _$UpdateProgressImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'UpdateTaskProgressEvent.updateProgress(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProgressImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of UpdateTaskProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProgressImplCopyWith<_$UpdateProgressImpl> get copyWith =>
      __$$UpdateProgressImplCopyWithImpl<_$UpdateProgressImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(num progress) onProgressChanged,
    required TResult Function(String taskId) updateProgress,
  }) {
    return updateProgress(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(num progress)? onProgressChanged,
    TResult? Function(String taskId)? updateProgress,
  }) {
    return updateProgress?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(num progress)? onProgressChanged,
    TResult Function(String taskId)? updateProgress,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnProgressChanged value) onProgressChanged,
    required TResult Function(_UpdateProgress value) updateProgress,
  }) {
    return updateProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnProgressChanged value)? onProgressChanged,
    TResult? Function(_UpdateProgress value)? updateProgress,
  }) {
    return updateProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnProgressChanged value)? onProgressChanged,
    TResult Function(_UpdateProgress value)? updateProgress,
    required TResult orElse(),
  }) {
    if (updateProgress != null) {
      return updateProgress(this);
    }
    return orElse();
  }
}

abstract class _UpdateProgress implements UpdateTaskProgressEvent {
  const factory _UpdateProgress({required final String taskId}) =
      _$UpdateProgressImpl;

  String get taskId;

  /// Create a copy of UpdateTaskProgressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProgressImplCopyWith<_$UpdateProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UpdateTaskProgressState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  num get progress => throw _privateConstructorUsedError;

  /// Create a copy of UpdateTaskProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateTaskProgressStateCopyWith<UpdateTaskProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateTaskProgressStateCopyWith<$Res> {
  factory $UpdateTaskProgressStateCopyWith(UpdateTaskProgressState value,
          $Res Function(UpdateTaskProgressState) then) =
      _$UpdateTaskProgressStateCopyWithImpl<$Res, UpdateTaskProgressState>;
  @useResult
  $Res call({RequestState state, String message, num progress});
}

/// @nodoc
class _$UpdateTaskProgressStateCopyWithImpl<$Res,
        $Val extends UpdateTaskProgressState>
    implements $UpdateTaskProgressStateCopyWith<$Res> {
  _$UpdateTaskProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateTaskProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? progress = null,
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
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateTaskProgressStateImplCopyWith<$Res>
    implements $UpdateTaskProgressStateCopyWith<$Res> {
  factory _$$UpdateTaskProgressStateImplCopyWith(
          _$UpdateTaskProgressStateImpl value,
          $Res Function(_$UpdateTaskProgressStateImpl) then) =
      __$$UpdateTaskProgressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, num progress});
}

/// @nodoc
class __$$UpdateTaskProgressStateImplCopyWithImpl<$Res>
    extends _$UpdateTaskProgressStateCopyWithImpl<$Res,
        _$UpdateTaskProgressStateImpl>
    implements _$$UpdateTaskProgressStateImplCopyWith<$Res> {
  __$$UpdateTaskProgressStateImplCopyWithImpl(
      _$UpdateTaskProgressStateImpl _value,
      $Res Function(_$UpdateTaskProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateTaskProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? progress = null,
  }) {
    return _then(_$UpdateTaskProgressStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$UpdateTaskProgressStateImpl implements _UpdateTaskProgressState {
  const _$UpdateTaskProgressStateImpl(
      {required this.state, required this.message, required this.progress});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final num progress;

  @override
  String toString() {
    return 'UpdateTaskProgressState(state: $state, message: $message, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTaskProgressStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, progress);

  /// Create a copy of UpdateTaskProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTaskProgressStateImplCopyWith<_$UpdateTaskProgressStateImpl>
      get copyWith => __$$UpdateTaskProgressStateImplCopyWithImpl<
          _$UpdateTaskProgressStateImpl>(this, _$identity);
}

abstract class _UpdateTaskProgressState implements UpdateTaskProgressState {
  const factory _UpdateTaskProgressState(
      {required final RequestState state,
      required final String message,
      required final num progress}) = _$UpdateTaskProgressStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  num get progress;

  /// Create a copy of UpdateTaskProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTaskProgressStateImplCopyWith<_$UpdateTaskProgressStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
