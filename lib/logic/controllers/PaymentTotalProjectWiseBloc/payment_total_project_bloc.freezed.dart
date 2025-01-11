// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_total_project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentTotalProjectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String projectId) fetchAllTotalPayments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String projectId)? fetchAllTotalPayments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String projectId)? fetchAllTotalPayments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAllTotalPayments value)
        fetchAllTotalPayments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAllTotalPayments value)? fetchAllTotalPayments,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAllTotalPayments value)? fetchAllTotalPayments,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTotalProjectEventCopyWith<$Res> {
  factory $PaymentTotalProjectEventCopyWith(PaymentTotalProjectEvent value,
          $Res Function(PaymentTotalProjectEvent) then) =
      _$PaymentTotalProjectEventCopyWithImpl<$Res, PaymentTotalProjectEvent>;
}

/// @nodoc
class _$PaymentTotalProjectEventCopyWithImpl<$Res,
        $Val extends PaymentTotalProjectEvent>
    implements $PaymentTotalProjectEventCopyWith<$Res> {
  _$PaymentTotalProjectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentTotalProjectEvent
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
    extends _$PaymentTotalProjectEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentTotalProjectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl with DiagnosticableTreeMixin implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentTotalProjectEvent.initialize()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'PaymentTotalProjectEvent.initialize'));
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
    required TResult Function(String projectId) fetchAllTotalPayments,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String projectId)? fetchAllTotalPayments,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String projectId)? fetchAllTotalPayments,
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
    required TResult Function(_FetchAllTotalPayments value)
        fetchAllTotalPayments,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAllTotalPayments value)? fetchAllTotalPayments,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAllTotalPayments value)? fetchAllTotalPayments,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements PaymentTotalProjectEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$FetchAllTotalPaymentsImplCopyWith<$Res> {
  factory _$$FetchAllTotalPaymentsImplCopyWith(
          _$FetchAllTotalPaymentsImpl value,
          $Res Function(_$FetchAllTotalPaymentsImpl) then) =
      __$$FetchAllTotalPaymentsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$FetchAllTotalPaymentsImplCopyWithImpl<$Res>
    extends _$PaymentTotalProjectEventCopyWithImpl<$Res,
        _$FetchAllTotalPaymentsImpl>
    implements _$$FetchAllTotalPaymentsImplCopyWith<$Res> {
  __$$FetchAllTotalPaymentsImplCopyWithImpl(_$FetchAllTotalPaymentsImpl _value,
      $Res Function(_$FetchAllTotalPaymentsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentTotalProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$FetchAllTotalPaymentsImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchAllTotalPaymentsImpl
    with DiagnosticableTreeMixin
    implements _FetchAllTotalPayments {
  const _$FetchAllTotalPaymentsImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentTotalProjectEvent.fetchAllTotalPayments(projectId: $projectId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty(
          'type', 'PaymentTotalProjectEvent.fetchAllTotalPayments'))
      ..add(DiagnosticsProperty('projectId', projectId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllTotalPaymentsImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  /// Create a copy of PaymentTotalProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllTotalPaymentsImplCopyWith<_$FetchAllTotalPaymentsImpl>
      get copyWith => __$$FetchAllTotalPaymentsImplCopyWithImpl<
          _$FetchAllTotalPaymentsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String projectId) fetchAllTotalPayments,
  }) {
    return fetchAllTotalPayments(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String projectId)? fetchAllTotalPayments,
  }) {
    return fetchAllTotalPayments?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String projectId)? fetchAllTotalPayments,
    required TResult orElse(),
  }) {
    if (fetchAllTotalPayments != null) {
      return fetchAllTotalPayments(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_FetchAllTotalPayments value)
        fetchAllTotalPayments,
  }) {
    return fetchAllTotalPayments(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_FetchAllTotalPayments value)? fetchAllTotalPayments,
  }) {
    return fetchAllTotalPayments?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_FetchAllTotalPayments value)? fetchAllTotalPayments,
    required TResult orElse(),
  }) {
    if (fetchAllTotalPayments != null) {
      return fetchAllTotalPayments(this);
    }
    return orElse();
  }
}

abstract class _FetchAllTotalPayments implements PaymentTotalProjectEvent {
  const factory _FetchAllTotalPayments({required final String projectId}) =
      _$FetchAllTotalPaymentsImpl;

  String get projectId;

  /// Create a copy of PaymentTotalProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllTotalPaymentsImplCopyWith<_$FetchAllTotalPaymentsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentTotalProjectState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get paymentOut => throw _privateConstructorUsedError;
  String get paymentIn => throw _privateConstructorUsedError;

  /// Create a copy of PaymentTotalProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentTotalProjectStateCopyWith<PaymentTotalProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentTotalProjectStateCopyWith<$Res> {
  factory $PaymentTotalProjectStateCopyWith(PaymentTotalProjectState value,
          $Res Function(PaymentTotalProjectState) then) =
      _$PaymentTotalProjectStateCopyWithImpl<$Res, PaymentTotalProjectState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String paymentOut,
      String paymentIn});
}

/// @nodoc
class _$PaymentTotalProjectStateCopyWithImpl<$Res,
        $Val extends PaymentTotalProjectState>
    implements $PaymentTotalProjectStateCopyWith<$Res> {
  _$PaymentTotalProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentTotalProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? paymentOut = null,
    Object? paymentIn = null,
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
      paymentOut: null == paymentOut
          ? _value.paymentOut
          : paymentOut // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIn: null == paymentIn
          ? _value.paymentIn
          : paymentIn // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentTotalProjectStateImplCopyWith<$Res>
    implements $PaymentTotalProjectStateCopyWith<$Res> {
  factory _$$PaymentTotalProjectStateImplCopyWith(
          _$PaymentTotalProjectStateImpl value,
          $Res Function(_$PaymentTotalProjectStateImpl) then) =
      __$$PaymentTotalProjectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String paymentOut,
      String paymentIn});
}

/// @nodoc
class __$$PaymentTotalProjectStateImplCopyWithImpl<$Res>
    extends _$PaymentTotalProjectStateCopyWithImpl<$Res,
        _$PaymentTotalProjectStateImpl>
    implements _$$PaymentTotalProjectStateImplCopyWith<$Res> {
  __$$PaymentTotalProjectStateImplCopyWithImpl(
      _$PaymentTotalProjectStateImpl _value,
      $Res Function(_$PaymentTotalProjectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentTotalProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? paymentOut = null,
    Object? paymentIn = null,
  }) {
    return _then(_$PaymentTotalProjectStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      paymentOut: null == paymentOut
          ? _value.paymentOut
          : paymentOut // ignore: cast_nullable_to_non_nullable
              as String,
      paymentIn: null == paymentIn
          ? _value.paymentIn
          : paymentIn // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentTotalProjectStateImpl
    with DiagnosticableTreeMixin
    implements _PaymentTotalProjectState {
  const _$PaymentTotalProjectStateImpl(
      {required this.state,
      required this.message,
      required this.paymentOut,
      required this.paymentIn});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String paymentOut;
  @override
  final String paymentIn;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PaymentTotalProjectState(state: $state, message: $message, paymentOut: $paymentOut, paymentIn: $paymentIn)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PaymentTotalProjectState'))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('paymentOut', paymentOut))
      ..add(DiagnosticsProperty('paymentIn', paymentIn));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentTotalProjectStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.paymentOut, paymentOut) ||
                other.paymentOut == paymentOut) &&
            (identical(other.paymentIn, paymentIn) ||
                other.paymentIn == paymentIn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, state, message, paymentOut, paymentIn);

  /// Create a copy of PaymentTotalProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentTotalProjectStateImplCopyWith<_$PaymentTotalProjectStateImpl>
      get copyWith => __$$PaymentTotalProjectStateImplCopyWithImpl<
          _$PaymentTotalProjectStateImpl>(this, _$identity);
}

abstract class _PaymentTotalProjectState implements PaymentTotalProjectState {
  const factory _PaymentTotalProjectState(
      {required final RequestState state,
      required final String message,
      required final String paymentOut,
      required final String paymentIn}) = _$PaymentTotalProjectStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get paymentOut;
  @override
  String get paymentIn;

  /// Create a copy of PaymentTotalProjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentTotalProjectStateImplCopyWith<_$PaymentTotalProjectStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
