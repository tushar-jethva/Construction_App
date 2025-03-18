// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) onEmailChanged,
    required TResult Function() verifyEmail,
    required TResult Function() sendForgotPasswordOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? onEmailChanged,
    TResult? Function()? verifyEmail,
    TResult? Function()? sendForgotPasswordOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? onEmailChanged,
    TResult Function()? verifyEmail,
    TResult Function()? sendForgotPasswordOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_VerifyEmail value) verifyEmail,
    required TResult Function(_SendForgotPasswordOtp value)
        sendForgotPasswordOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_VerifyEmail value)? verifyEmail,
    TResult? Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_VerifyEmail value)? verifyEmail,
    TResult Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordEvent
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
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'ForgotPasswordEvent.started()';
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
    required TResult Function(String email) onEmailChanged,
    required TResult Function() verifyEmail,
    required TResult Function() sendForgotPasswordOtp,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? onEmailChanged,
    TResult? Function()? verifyEmail,
    TResult? Function()? sendForgotPasswordOtp,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? onEmailChanged,
    TResult Function()? verifyEmail,
    TResult Function()? sendForgotPasswordOtp,
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
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_VerifyEmail value) verifyEmail,
    required TResult Function(_SendForgotPasswordOtp value)
        sendForgotPasswordOtp,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_VerifyEmail value)? verifyEmail,
    TResult? Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_VerifyEmail value)? verifyEmail,
    TResult Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ForgotPasswordEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$OnEmailChangedImplCopyWith<$Res> {
  factory _$$OnEmailChangedImplCopyWith(_$OnEmailChangedImpl value,
          $Res Function(_$OnEmailChangedImpl) then) =
      __$$OnEmailChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$OnEmailChangedImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$OnEmailChangedImpl>
    implements _$$OnEmailChangedImplCopyWith<$Res> {
  __$$OnEmailChangedImplCopyWithImpl(
      _$OnEmailChangedImpl _value, $Res Function(_$OnEmailChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$OnEmailChangedImpl(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnEmailChangedImpl implements _OnEmailChanged {
  const _$OnEmailChangedImpl({required this.email});

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordEvent.onEmailChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnEmailChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnEmailChangedImplCopyWith<_$OnEmailChangedImpl> get copyWith =>
      __$$OnEmailChangedImplCopyWithImpl<_$OnEmailChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) onEmailChanged,
    required TResult Function() verifyEmail,
    required TResult Function() sendForgotPasswordOtp,
  }) {
    return onEmailChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? onEmailChanged,
    TResult? Function()? verifyEmail,
    TResult? Function()? sendForgotPasswordOtp,
  }) {
    return onEmailChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? onEmailChanged,
    TResult Function()? verifyEmail,
    TResult Function()? sendForgotPasswordOtp,
    required TResult orElse(),
  }) {
    if (onEmailChanged != null) {
      return onEmailChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_VerifyEmail value) verifyEmail,
    required TResult Function(_SendForgotPasswordOtp value)
        sendForgotPasswordOtp,
  }) {
    return onEmailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_VerifyEmail value)? verifyEmail,
    TResult? Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
  }) {
    return onEmailChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_VerifyEmail value)? verifyEmail,
    TResult Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
    required TResult orElse(),
  }) {
    if (onEmailChanged != null) {
      return onEmailChanged(this);
    }
    return orElse();
  }
}

abstract class _OnEmailChanged implements ForgotPasswordEvent {
  const factory _OnEmailChanged({required final String email}) =
      _$OnEmailChangedImpl;

  String get email;

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnEmailChangedImplCopyWith<_$OnEmailChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyEmailImplCopyWith<$Res> {
  factory _$$VerifyEmailImplCopyWith(
          _$VerifyEmailImpl value, $Res Function(_$VerifyEmailImpl) then) =
      __$$VerifyEmailImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyEmailImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$VerifyEmailImpl>
    implements _$$VerifyEmailImplCopyWith<$Res> {
  __$$VerifyEmailImplCopyWithImpl(
      _$VerifyEmailImpl _value, $Res Function(_$VerifyEmailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyEmailImpl implements _VerifyEmail {
  const _$VerifyEmailImpl();

  @override
  String toString() {
    return 'ForgotPasswordEvent.verifyEmail()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyEmailImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) onEmailChanged,
    required TResult Function() verifyEmail,
    required TResult Function() sendForgotPasswordOtp,
  }) {
    return verifyEmail();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? onEmailChanged,
    TResult? Function()? verifyEmail,
    TResult? Function()? sendForgotPasswordOtp,
  }) {
    return verifyEmail?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? onEmailChanged,
    TResult Function()? verifyEmail,
    TResult Function()? sendForgotPasswordOtp,
    required TResult orElse(),
  }) {
    if (verifyEmail != null) {
      return verifyEmail();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_VerifyEmail value) verifyEmail,
    required TResult Function(_SendForgotPasswordOtp value)
        sendForgotPasswordOtp,
  }) {
    return verifyEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_VerifyEmail value)? verifyEmail,
    TResult? Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
  }) {
    return verifyEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_VerifyEmail value)? verifyEmail,
    TResult Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
    required TResult orElse(),
  }) {
    if (verifyEmail != null) {
      return verifyEmail(this);
    }
    return orElse();
  }
}

abstract class _VerifyEmail implements ForgotPasswordEvent {
  const factory _VerifyEmail() = _$VerifyEmailImpl;
}

/// @nodoc
abstract class _$$SendForgotPasswordOtpImplCopyWith<$Res> {
  factory _$$SendForgotPasswordOtpImplCopyWith(
          _$SendForgotPasswordOtpImpl value,
          $Res Function(_$SendForgotPasswordOtpImpl) then) =
      __$$SendForgotPasswordOtpImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendForgotPasswordOtpImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$SendForgotPasswordOtpImpl>
    implements _$$SendForgotPasswordOtpImplCopyWith<$Res> {
  __$$SendForgotPasswordOtpImplCopyWithImpl(_$SendForgotPasswordOtpImpl _value,
      $Res Function(_$SendForgotPasswordOtpImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendForgotPasswordOtpImpl implements _SendForgotPasswordOtp {
  const _$SendForgotPasswordOtpImpl();

  @override
  String toString() {
    return 'ForgotPasswordEvent.sendForgotPasswordOtp()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendForgotPasswordOtpImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String email) onEmailChanged,
    required TResult Function() verifyEmail,
    required TResult Function() sendForgotPasswordOtp,
  }) {
    return sendForgotPasswordOtp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String email)? onEmailChanged,
    TResult? Function()? verifyEmail,
    TResult? Function()? sendForgotPasswordOtp,
  }) {
    return sendForgotPasswordOtp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String email)? onEmailChanged,
    TResult Function()? verifyEmail,
    TResult Function()? sendForgotPasswordOtp,
    required TResult orElse(),
  }) {
    if (sendForgotPasswordOtp != null) {
      return sendForgotPasswordOtp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_OnEmailChanged value) onEmailChanged,
    required TResult Function(_VerifyEmail value) verifyEmail,
    required TResult Function(_SendForgotPasswordOtp value)
        sendForgotPasswordOtp,
  }) {
    return sendForgotPasswordOtp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_OnEmailChanged value)? onEmailChanged,
    TResult? Function(_VerifyEmail value)? verifyEmail,
    TResult? Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
  }) {
    return sendForgotPasswordOtp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_OnEmailChanged value)? onEmailChanged,
    TResult Function(_VerifyEmail value)? verifyEmail,
    TResult Function(_SendForgotPasswordOtp value)? sendForgotPasswordOtp,
    required TResult orElse(),
  }) {
    if (sendForgotPasswordOtp != null) {
      return sendForgotPasswordOtp(this);
    }
    return orElse();
  }
}

abstract class _SendForgotPasswordOtp implements ForgotPasswordEvent {
  const factory _SendForgotPasswordOtp() = _$SendForgotPasswordOtpImpl;
}

/// @nodoc
mixin _$ForgotPasswordState {
  ForgotState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
  @useResult
  $Res call({ForgotState state, String message, String email});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ForgotState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordStateImplCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$$ForgotPasswordStateImplCopyWith(_$ForgotPasswordStateImpl value,
          $Res Function(_$ForgotPasswordStateImpl) then) =
      __$$ForgotPasswordStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ForgotState state, String message, String email});
}

/// @nodoc
class __$$ForgotPasswordStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res, _$ForgotPasswordStateImpl>
    implements _$$ForgotPasswordStateImplCopyWith<$Res> {
  __$$ForgotPasswordStateImplCopyWithImpl(_$ForgotPasswordStateImpl _value,
      $Res Function(_$ForgotPasswordStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ForgotState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordStateImpl implements _ForgotPasswordState {
  const _$ForgotPasswordStateImpl(
      {required this.state, required this.message, required this.email});

  @override
  final ForgotState state;
  @override
  final String message;
  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordState(state: $state, message: $message, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, email);

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      __$$ForgotPasswordStateImplCopyWithImpl<_$ForgotPasswordStateImpl>(
          this, _$identity);
}

abstract class _ForgotPasswordState implements ForgotPasswordState {
  const factory _ForgotPasswordState(
      {required final ForgotState state,
      required final String message,
      required final String email}) = _$ForgotPasswordStateImpl;

  @override
  ForgotState get state;
  @override
  String get message;
  @override
  String get email;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForgotPasswordStateImplCopyWith<_$ForgotPasswordStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
