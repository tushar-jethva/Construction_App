// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verify_otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerifyOtpEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String otp) onOtpChanged,
    required TResult Function() onVerifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String otp)? onOtpChanged,
    TResult? Function()? onVerifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String otp)? onOtpChanged,
    TResult Function()? onVerifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnOtpChanged value) onOtpChanged,
    required TResult Function(_OnVerifyOtp value) onVerifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnOtpChanged value)? onOtpChanged,
    TResult? Function(_OnVerifyOtp value)? onVerifyOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnOtpChanged value)? onOtpChanged,
    TResult Function(_OnVerifyOtp value)? onVerifyOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpEventCopyWith<$Res> {
  factory $VerifyOtpEventCopyWith(
          VerifyOtpEvent value, $Res Function(VerifyOtpEvent) then) =
      _$VerifyOtpEventCopyWithImpl<$Res, VerifyOtpEvent>;
}

/// @nodoc
class _$VerifyOtpEventCopyWithImpl<$Res, $Val extends VerifyOtpEvent>
    implements $VerifyOtpEventCopyWith<$Res> {
  _$VerifyOtpEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpEvent
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
    extends _$VerifyOtpEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'VerifyOtpEvent.started()';
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
    required TResult Function(String otp) onOtpChanged,
    required TResult Function() onVerifyOtp,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String otp)? onOtpChanged,
    TResult? Function()? onVerifyOtp,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String otp)? onOtpChanged,
    TResult Function()? onVerifyOtp,
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
    required TResult Function(_OnOtpChanged value) onOtpChanged,
    required TResult Function(_OnVerifyOtp value) onVerifyOtp,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnOtpChanged value)? onOtpChanged,
    TResult? Function(_OnVerifyOtp value)? onVerifyOtp,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnOtpChanged value)? onOtpChanged,
    TResult Function(_OnVerifyOtp value)? onVerifyOtp,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements VerifyOtpEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$OnOtpChangedImplCopyWith<$Res> {
  factory _$$OnOtpChangedImplCopyWith(
          _$OnOtpChangedImpl value, $Res Function(_$OnOtpChangedImpl) then) =
      __$$OnOtpChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class __$$OnOtpChangedImplCopyWithImpl<$Res>
    extends _$VerifyOtpEventCopyWithImpl<$Res, _$OnOtpChangedImpl>
    implements _$$OnOtpChangedImplCopyWith<$Res> {
  __$$OnOtpChangedImplCopyWithImpl(
      _$OnOtpChangedImpl _value, $Res Function(_$OnOtpChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_$OnOtpChangedImpl(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnOtpChangedImpl implements _OnOtpChanged {
  const _$OnOtpChangedImpl({required this.otp});

  @override
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpEvent.onOtpChanged(otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnOtpChangedImpl &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp);

  /// Create a copy of VerifyOtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnOtpChangedImplCopyWith<_$OnOtpChangedImpl> get copyWith =>
      __$$OnOtpChangedImplCopyWithImpl<_$OnOtpChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String otp) onOtpChanged,
    required TResult Function() onVerifyOtp,
  }) {
    return onOtpChanged(otp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String otp)? onOtpChanged,
    TResult? Function()? onVerifyOtp,
  }) {
    return onOtpChanged?.call(otp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String otp)? onOtpChanged,
    TResult Function()? onVerifyOtp,
    required TResult orElse(),
  }) {
    if (onOtpChanged != null) {
      return onOtpChanged(otp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnOtpChanged value) onOtpChanged,
    required TResult Function(_OnVerifyOtp value) onVerifyOtp,
  }) {
    return onOtpChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnOtpChanged value)? onOtpChanged,
    TResult? Function(_OnVerifyOtp value)? onVerifyOtp,
  }) {
    return onOtpChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnOtpChanged value)? onOtpChanged,
    TResult Function(_OnVerifyOtp value)? onVerifyOtp,
    required TResult orElse(),
  }) {
    if (onOtpChanged != null) {
      return onOtpChanged(this);
    }
    return orElse();
  }
}

abstract class _OnOtpChanged implements VerifyOtpEvent {
  const factory _OnOtpChanged({required final String otp}) = _$OnOtpChangedImpl;

  String get otp;

  /// Create a copy of VerifyOtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnOtpChangedImplCopyWith<_$OnOtpChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnVerifyOtpImplCopyWith<$Res> {
  factory _$$OnVerifyOtpImplCopyWith(
          _$OnVerifyOtpImpl value, $Res Function(_$OnVerifyOtpImpl) then) =
      __$$OnVerifyOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnVerifyOtpImplCopyWithImpl<$Res>
    extends _$VerifyOtpEventCopyWithImpl<$Res, _$OnVerifyOtpImpl>
    implements _$$OnVerifyOtpImplCopyWith<$Res> {
  __$$OnVerifyOtpImplCopyWithImpl(
      _$OnVerifyOtpImpl _value, $Res Function(_$OnVerifyOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnVerifyOtpImpl implements _OnVerifyOtp {
  const _$OnVerifyOtpImpl();

  @override
  String toString() {
    return 'VerifyOtpEvent.onVerifyOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnVerifyOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String otp) onOtpChanged,
    required TResult Function() onVerifyOtp,
  }) {
    return onVerifyOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String otp)? onOtpChanged,
    TResult? Function()? onVerifyOtp,
  }) {
    return onVerifyOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String otp)? onOtpChanged,
    TResult Function()? onVerifyOtp,
    required TResult orElse(),
  }) {
    if (onVerifyOtp != null) {
      return onVerifyOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnOtpChanged value) onOtpChanged,
    required TResult Function(_OnVerifyOtp value) onVerifyOtp,
  }) {
    return onVerifyOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnOtpChanged value)? onOtpChanged,
    TResult? Function(_OnVerifyOtp value)? onVerifyOtp,
  }) {
    return onVerifyOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnOtpChanged value)? onOtpChanged,
    TResult Function(_OnVerifyOtp value)? onVerifyOtp,
    required TResult orElse(),
  }) {
    if (onVerifyOtp != null) {
      return onVerifyOtp(this);
    }
    return orElse();
  }
}

abstract class _OnVerifyOtp implements VerifyOtpEvent {
  const factory _OnVerifyOtp() = _$OnVerifyOtpImpl;
}

/// @nodoc
mixin _$VerifyOtpState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get otp => throw _privateConstructorUsedError;

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerifyOtpStateCopyWith<VerifyOtpState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpStateCopyWith<$Res> {
  factory $VerifyOtpStateCopyWith(
          VerifyOtpState value, $Res Function(VerifyOtpState) then) =
      _$VerifyOtpStateCopyWithImpl<$Res, VerifyOtpState>;
  @useResult
  $Res call({RequestState state, String message, String otp});
}

/// @nodoc
class _$VerifyOtpStateCopyWithImpl<$Res, $Val extends VerifyOtpState>
    implements $VerifyOtpStateCopyWith<$Res> {
  _$VerifyOtpStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? otp = null,
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
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerifyOtpStateImplCopyWith<$Res>
    implements $VerifyOtpStateCopyWith<$Res> {
  factory _$$VerifyOtpStateImplCopyWith(_$VerifyOtpStateImpl value,
          $Res Function(_$VerifyOtpStateImpl) then) =
      __$$VerifyOtpStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, String otp});
}

/// @nodoc
class __$$VerifyOtpStateImplCopyWithImpl<$Res>
    extends _$VerifyOtpStateCopyWithImpl<$Res, _$VerifyOtpStateImpl>
    implements _$$VerifyOtpStateImplCopyWith<$Res> {
  __$$VerifyOtpStateImplCopyWithImpl(
      _$VerifyOtpStateImpl _value, $Res Function(_$VerifyOtpStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? otp = null,
  }) {
    return _then(_$VerifyOtpStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyOtpStateImpl implements _VerifyOtpState {
  const _$VerifyOtpStateImpl(
      {required this.state, required this.message, required this.otp});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpState(state: $state, message: $message, otp: $otp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyOtpStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, otp);

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyOtpStateImplCopyWith<_$VerifyOtpStateImpl> get copyWith =>
      __$$VerifyOtpStateImplCopyWithImpl<_$VerifyOtpStateImpl>(
          this, _$identity);
}

abstract class _VerifyOtpState implements VerifyOtpState {
  const factory _VerifyOtpState(
      {required final RequestState state,
      required final String message,
      required final String otp}) = _$VerifyOtpStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get otp;

  /// Create a copy of VerifyOtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyOtpStateImplCopyWith<_$VerifyOtpStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
