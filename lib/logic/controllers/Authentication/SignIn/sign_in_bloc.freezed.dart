// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginUser,
    required TResult Function() logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginUser,
    TResult? Function()? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordChanged,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_Logout value) logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordChanged,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_Logout value)? logout,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordChanged,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInEventCopyWith<$Res> {
  factory $SignInEventCopyWith(
          SignInEvent value, $Res Function(SignInEvent) then) =
      _$SignInEventCopyWithImpl<$Res, SignInEvent>;
}

/// @nodoc
class _$SignInEventCopyWithImpl<$Res, $Val extends SignInEvent>
    implements $SignInEventCopyWith<$Res> {
  _$SignInEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EmailOnChangedImplCopyWith<$Res> {
  factory _$$EmailOnChangedImplCopyWith(_$EmailOnChangedImpl value,
          $Res Function(_$EmailOnChangedImpl) then) =
      __$$EmailOnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$EmailOnChangedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$EmailOnChangedImpl>
    implements _$$EmailOnChangedImplCopyWith<$Res> {
  __$$EmailOnChangedImplCopyWithImpl(
      _$EmailOnChangedImpl _value, $Res Function(_$EmailOnChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$EmailOnChangedImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailOnChangedImpl implements _EmailOnChanged {
  const _$EmailOnChangedImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'SignInEvent.emailOnChanged(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailOnChangedImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailOnChangedImplCopyWith<_$EmailOnChangedImpl> get copyWith =>
      __$$EmailOnChangedImplCopyWithImpl<_$EmailOnChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginUser,
    required TResult Function() logout,
  }) {
    return emailOnChanged(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginUser,
    TResult? Function()? logout,
  }) {
    return emailOnChanged?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (emailOnChanged != null) {
      return emailOnChanged(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordChanged,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_Logout value) logout,
  }) {
    return emailOnChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordChanged,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return emailOnChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordChanged,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (emailOnChanged != null) {
      return emailOnChanged(this);
    }
    return orElse();
  }
}

abstract class _EmailOnChanged implements SignInEvent {
  const factory _EmailOnChanged(final String email) = _$EmailOnChangedImpl;

  String get email;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailOnChangedImplCopyWith<_$EmailOnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PasswordOnChangedImplCopyWith<$Res> {
  factory _$$PasswordOnChangedImplCopyWith(_$PasswordOnChangedImpl value,
          $Res Function(_$PasswordOnChangedImpl) then) =
      __$$PasswordOnChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$PasswordOnChangedImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$PasswordOnChangedImpl>
    implements _$$PasswordOnChangedImplCopyWith<$Res> {
  __$$PasswordOnChangedImplCopyWithImpl(_$PasswordOnChangedImpl _value,
      $Res Function(_$PasswordOnChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$PasswordOnChangedImpl(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PasswordOnChangedImpl implements _PasswordOnChanged {
  const _$PasswordOnChangedImpl(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'SignInEvent.passwordChanged(password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PasswordOnChangedImpl &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PasswordOnChangedImplCopyWith<_$PasswordOnChangedImpl> get copyWith =>
      __$$PasswordOnChangedImplCopyWithImpl<_$PasswordOnChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginUser,
    required TResult Function() logout,
  }) {
    return passwordChanged(password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginUser,
    TResult? Function()? logout,
  }) {
    return passwordChanged?.call(password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordChanged,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_Logout value) logout,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordChanged,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return passwordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordChanged,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class _PasswordOnChanged implements SignInEvent {
  const factory _PasswordOnChanged(final String password) =
      _$PasswordOnChangedImpl;

  String get password;

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PasswordOnChangedImplCopyWith<_$PasswordOnChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginUserImplCopyWith<$Res> {
  factory _$$LoginUserImplCopyWith(
          _$LoginUserImpl value, $Res Function(_$LoginUserImpl) then) =
      __$$LoginUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginUserImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$LoginUserImpl>
    implements _$$LoginUserImplCopyWith<$Res> {
  __$$LoginUserImplCopyWithImpl(
      _$LoginUserImpl _value, $Res Function(_$LoginUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoginUserImpl implements _LoginUser {
  const _$LoginUserImpl();

  @override
  String toString() {
    return 'SignInEvent.loginUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginUser,
    required TResult Function() logout,
  }) {
    return loginUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginUser,
    TResult? Function()? logout,
  }) {
    return loginUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (loginUser != null) {
      return loginUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordChanged,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_Logout value) logout,
  }) {
    return loginUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordChanged,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return loginUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordChanged,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (loginUser != null) {
      return loginUser(this);
    }
    return orElse();
  }
}

abstract class _LoginUser implements SignInEvent {
  const factory _LoginUser() = _$LoginUserImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$SignInEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'SignInEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) emailOnChanged,
    required TResult Function(String password) passwordChanged,
    required TResult Function() loginUser,
    required TResult Function() logout,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? emailOnChanged,
    TResult? Function(String password)? passwordChanged,
    TResult? Function()? loginUser,
    TResult? Function()? logout,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? emailOnChanged,
    TResult Function(String password)? passwordChanged,
    TResult Function()? loginUser,
    TResult Function()? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmailOnChanged value) emailOnChanged,
    required TResult Function(_PasswordOnChanged value) passwordChanged,
    required TResult Function(_LoginUser value) loginUser,
    required TResult Function(_Logout value) logout,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmailOnChanged value)? emailOnChanged,
    TResult? Function(_PasswordOnChanged value)? passwordChanged,
    TResult? Function(_LoginUser value)? loginUser,
    TResult? Function(_Logout value)? logout,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmailOnChanged value)? emailOnChanged,
    TResult Function(_PasswordOnChanged value)? passwordChanged,
    TResult Function(_LoginUser value)? loginUser,
    TResult Function(_Logout value)? logout,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements SignInEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
mixin _$SignInState {
  RequestState get state => throw _privateConstructorUsedError;
  RequestState get state1 => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SignInStateCopyWith<SignInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
  @useResult
  $Res call(
      {RequestState state,
      RequestState state1,
      String message,
      String email,
      String password});
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? state1 = null,
    Object? message = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      state1: null == state1
          ? _value.state1
          : state1 // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignInStateImplCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory _$$SignInStateImplCopyWith(
          _$SignInStateImpl value, $Res Function(_$SignInStateImpl) then) =
      __$$SignInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      RequestState state1,
      String message,
      String email,
      String password});
}

/// @nodoc
class __$$SignInStateImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateImpl>
    implements _$$SignInStateImplCopyWith<$Res> {
  __$$SignInStateImplCopyWithImpl(
      _$SignInStateImpl _value, $Res Function(_$SignInStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? state1 = null,
    Object? message = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$SignInStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      state1: null == state1
          ? _value.state1
          : state1 // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignInStateImpl implements _SignInState {
  const _$SignInStateImpl(
      {required this.state,
      required this.state1,
      required this.message,
      required this.email,
      required this.password});

  @override
  final RequestState state;
  @override
  final RequestState state1;
  @override
  final String message;
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInState(state: $state, state1: $state1, message: $message, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.state1, state1) || other.state1 == state1) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, state, state1, message, email, password);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      __$$SignInStateImplCopyWithImpl<_$SignInStateImpl>(this, _$identity);
}

abstract class _SignInState implements SignInState {
  const factory _SignInState(
      {required final RequestState state,
      required final RequestState state1,
      required final String message,
      required final String email,
      required final String password}) = _$SignInStateImpl;

  @override
  RequestState get state;
  @override
  RequestState get state1;
  @override
  String get message;
  @override
  String get email;
  @override
  String get password;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInStateImplCopyWith<_$SignInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
