// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'switch_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SwitchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() switched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? switched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? switched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Switched value) switched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Switched value)? switched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Switched value)? switched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchEventCopyWith<$Res> {
  factory $SwitchEventCopyWith(
          SwitchEvent value, $Res Function(SwitchEvent) then) =
      _$SwitchEventCopyWithImpl<$Res, SwitchEvent>;
}

/// @nodoc
class _$SwitchEventCopyWithImpl<$Res, $Val extends SwitchEvent>
    implements $SwitchEventCopyWith<$Res> {
  _$SwitchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwitchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SwitchedImplCopyWith<$Res> {
  factory _$$SwitchedImplCopyWith(
          _$SwitchedImpl value, $Res Function(_$SwitchedImpl) then) =
      __$$SwitchedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SwitchedImplCopyWithImpl<$Res>
    extends _$SwitchEventCopyWithImpl<$Res, _$SwitchedImpl>
    implements _$$SwitchedImplCopyWith<$Res> {
  __$$SwitchedImplCopyWithImpl(
      _$SwitchedImpl _value, $Res Function(_$SwitchedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwitchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SwitchedImpl implements _Switched {
  _$SwitchedImpl();

  @override
  String toString() {
    return 'SwitchEvent.switched()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SwitchedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() switched,
  }) {
    return switched();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? switched,
  }) {
    return switched?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? switched,
    required TResult orElse(),
  }) {
    if (switched != null) {
      return switched();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Switched value) switched,
  }) {
    return switched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Switched value)? switched,
  }) {
    return switched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Switched value)? switched,
    required TResult orElse(),
  }) {
    if (switched != null) {
      return switched(this);
    }
    return orElse();
  }
}

abstract class _Switched implements SwitchEvent {
  factory _Switched() = _$SwitchedImpl;
}

/// @nodoc
mixin _$SwitchState {
  bool get isSwitched => throw _privateConstructorUsedError;
  RequestState get state => throw _privateConstructorUsedError;

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SwitchStateCopyWith<SwitchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwitchStateCopyWith<$Res> {
  factory $SwitchStateCopyWith(
          SwitchState value, $Res Function(SwitchState) then) =
      _$SwitchStateCopyWithImpl<$Res, SwitchState>;
  @useResult
  $Res call({bool isSwitched, RequestState state});
}

/// @nodoc
class _$SwitchStateCopyWithImpl<$Res, $Val extends SwitchState>
    implements $SwitchStateCopyWith<$Res> {
  _$SwitchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSwitched = null,
    Object? state = null,
  }) {
    return _then(_value.copyWith(
      isSwitched: null == isSwitched
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwitchStateImplCopyWith<$Res>
    implements $SwitchStateCopyWith<$Res> {
  factory _$$SwitchStateImplCopyWith(
          _$SwitchStateImpl value, $Res Function(_$SwitchStateImpl) then) =
      __$$SwitchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSwitched, RequestState state});
}

/// @nodoc
class __$$SwitchStateImplCopyWithImpl<$Res>
    extends _$SwitchStateCopyWithImpl<$Res, _$SwitchStateImpl>
    implements _$$SwitchStateImplCopyWith<$Res> {
  __$$SwitchStateImplCopyWithImpl(
      _$SwitchStateImpl _value, $Res Function(_$SwitchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSwitched = null,
    Object? state = null,
  }) {
    return _then(_$SwitchStateImpl(
      isSwitched: null == isSwitched
          ? _value.isSwitched
          : isSwitched // ignore: cast_nullable_to_non_nullable
              as bool,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
    ));
  }
}

/// @nodoc

class _$SwitchStateImpl implements _SwitchState {
  const _$SwitchStateImpl({required this.isSwitched, required this.state});

  @override
  final bool isSwitched;
  @override
  final RequestState state;

  @override
  String toString() {
    return 'SwitchState(isSwitched: $isSwitched, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwitchStateImpl &&
            (identical(other.isSwitched, isSwitched) ||
                other.isSwitched == isSwitched) &&
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSwitched, state);

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SwitchStateImplCopyWith<_$SwitchStateImpl> get copyWith =>
      __$$SwitchStateImplCopyWithImpl<_$SwitchStateImpl>(this, _$identity);
}

abstract class _SwitchState implements SwitchState {
  const factory _SwitchState(
      {required final bool isSwitched,
      required final RequestState state}) = _$SwitchStateImpl;

  @override
  bool get isSwitched;
  @override
  RequestState get state;

  /// Create a copy of SwitchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SwitchStateImplCopyWith<_$SwitchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
