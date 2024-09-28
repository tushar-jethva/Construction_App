// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_out_other_expense_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentOutOtherExpenseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) getOtherExpenseValue,
    required TResult Function(String paymentOut) addPaymentOUt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? getOtherExpenseValue,
    TResult? Function(String paymentOut)? addPaymentOUt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? getOtherExpenseValue,
    TResult Function(String paymentOut)? addPaymentOUt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtherExpenseValue value) getOtherExpenseValue,
    required TResult Function(_AddPaymentOut value) addPaymentOUt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtherExpenseValue value)? getOtherExpenseValue,
    TResult? Function(_AddPaymentOut value)? addPaymentOUt,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtherExpenseValue value)? getOtherExpenseValue,
    TResult Function(_AddPaymentOut value)? addPaymentOUt,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentOutOtherExpenseEventCopyWith<$Res> {
  factory $PaymentOutOtherExpenseEventCopyWith(
          PaymentOutOtherExpenseEvent value,
          $Res Function(PaymentOutOtherExpenseEvent) then) =
      _$PaymentOutOtherExpenseEventCopyWithImpl<$Res,
          PaymentOutOtherExpenseEvent>;
}

/// @nodoc
class _$PaymentOutOtherExpenseEventCopyWithImpl<$Res,
        $Val extends PaymentOutOtherExpenseEvent>
    implements $PaymentOutOtherExpenseEventCopyWith<$Res> {
  _$PaymentOutOtherExpenseEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentOutOtherExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetOtherExpenseValueImplCopyWith<$Res> {
  factory _$$GetOtherExpenseValueImplCopyWith(_$GetOtherExpenseValueImpl value,
          $Res Function(_$GetOtherExpenseValueImpl) then) =
      __$$GetOtherExpenseValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$GetOtherExpenseValueImplCopyWithImpl<$Res>
    extends _$PaymentOutOtherExpenseEventCopyWithImpl<$Res,
        _$GetOtherExpenseValueImpl>
    implements _$$GetOtherExpenseValueImplCopyWith<$Res> {
  __$$GetOtherExpenseValueImplCopyWithImpl(_$GetOtherExpenseValueImpl _value,
      $Res Function(_$GetOtherExpenseValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentOutOtherExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$GetOtherExpenseValueImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetOtherExpenseValueImpl implements _GetOtherExpenseValue {
  _$GetOtherExpenseValueImpl({required this.value});

  @override
  final String value;

  @override
  String toString() {
    return 'PaymentOutOtherExpenseEvent.getOtherExpenseValue(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetOtherExpenseValueImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of PaymentOutOtherExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetOtherExpenseValueImplCopyWith<_$GetOtherExpenseValueImpl>
      get copyWith =>
          __$$GetOtherExpenseValueImplCopyWithImpl<_$GetOtherExpenseValueImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) getOtherExpenseValue,
    required TResult Function(String paymentOut) addPaymentOUt,
  }) {
    return getOtherExpenseValue(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? getOtherExpenseValue,
    TResult? Function(String paymentOut)? addPaymentOUt,
  }) {
    return getOtherExpenseValue?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? getOtherExpenseValue,
    TResult Function(String paymentOut)? addPaymentOUt,
    required TResult orElse(),
  }) {
    if (getOtherExpenseValue != null) {
      return getOtherExpenseValue(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtherExpenseValue value) getOtherExpenseValue,
    required TResult Function(_AddPaymentOut value) addPaymentOUt,
  }) {
    return getOtherExpenseValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtherExpenseValue value)? getOtherExpenseValue,
    TResult? Function(_AddPaymentOut value)? addPaymentOUt,
  }) {
    return getOtherExpenseValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtherExpenseValue value)? getOtherExpenseValue,
    TResult Function(_AddPaymentOut value)? addPaymentOUt,
    required TResult orElse(),
  }) {
    if (getOtherExpenseValue != null) {
      return getOtherExpenseValue(this);
    }
    return orElse();
  }
}

abstract class _GetOtherExpenseValue implements PaymentOutOtherExpenseEvent {
  factory _GetOtherExpenseValue({required final String value}) =
      _$GetOtherExpenseValueImpl;

  String get value;

  /// Create a copy of PaymentOutOtherExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetOtherExpenseValueImplCopyWith<_$GetOtherExpenseValueImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPaymentOutImplCopyWith<$Res> {
  factory _$$AddPaymentOutImplCopyWith(
          _$AddPaymentOutImpl value, $Res Function(_$AddPaymentOutImpl) then) =
      __$$AddPaymentOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String paymentOut});
}

/// @nodoc
class __$$AddPaymentOutImplCopyWithImpl<$Res>
    extends _$PaymentOutOtherExpenseEventCopyWithImpl<$Res, _$AddPaymentOutImpl>
    implements _$$AddPaymentOutImplCopyWith<$Res> {
  __$$AddPaymentOutImplCopyWithImpl(
      _$AddPaymentOutImpl _value, $Res Function(_$AddPaymentOutImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentOutOtherExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentOut = null,
  }) {
    return _then(_$AddPaymentOutImpl(
      paymentOut: null == paymentOut
          ? _value.paymentOut
          : paymentOut // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddPaymentOutImpl implements _AddPaymentOut {
  _$AddPaymentOutImpl({required this.paymentOut});

  @override
  final String paymentOut;

  @override
  String toString() {
    return 'PaymentOutOtherExpenseEvent.addPaymentOUt(paymentOut: $paymentOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentOutImpl &&
            (identical(other.paymentOut, paymentOut) ||
                other.paymentOut == paymentOut));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentOut);

  /// Create a copy of PaymentOutOtherExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentOutImplCopyWith<_$AddPaymentOutImpl> get copyWith =>
      __$$AddPaymentOutImplCopyWithImpl<_$AddPaymentOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String value) getOtherExpenseValue,
    required TResult Function(String paymentOut) addPaymentOUt,
  }) {
    return addPaymentOUt(paymentOut);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String value)? getOtherExpenseValue,
    TResult? Function(String paymentOut)? addPaymentOUt,
  }) {
    return addPaymentOUt?.call(paymentOut);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String value)? getOtherExpenseValue,
    TResult Function(String paymentOut)? addPaymentOUt,
    required TResult orElse(),
  }) {
    if (addPaymentOUt != null) {
      return addPaymentOUt(paymentOut);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetOtherExpenseValue value) getOtherExpenseValue,
    required TResult Function(_AddPaymentOut value) addPaymentOUt,
  }) {
    return addPaymentOUt(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetOtherExpenseValue value)? getOtherExpenseValue,
    TResult? Function(_AddPaymentOut value)? addPaymentOUt,
  }) {
    return addPaymentOUt?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetOtherExpenseValue value)? getOtherExpenseValue,
    TResult Function(_AddPaymentOut value)? addPaymentOUt,
    required TResult orElse(),
  }) {
    if (addPaymentOUt != null) {
      return addPaymentOUt(this);
    }
    return orElse();
  }
}

abstract class _AddPaymentOut implements PaymentOutOtherExpenseEvent {
  factory _AddPaymentOut({required final String paymentOut}) =
      _$AddPaymentOutImpl;

  String get paymentOut;

  /// Create a copy of PaymentOutOtherExpenseEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPaymentOutImplCopyWith<_$AddPaymentOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PaymentOutOtherExpenseState {
  String get expenseValue => throw _privateConstructorUsedError;
  String get paymentOut => throw _privateConstructorUsedError;

  /// Create a copy of PaymentOutOtherExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentOutOtherExpenseStateCopyWith<PaymentOutOtherExpenseState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentOutOtherExpenseStateCopyWith<$Res> {
  factory $PaymentOutOtherExpenseStateCopyWith(
          PaymentOutOtherExpenseState value,
          $Res Function(PaymentOutOtherExpenseState) then) =
      _$PaymentOutOtherExpenseStateCopyWithImpl<$Res,
          PaymentOutOtherExpenseState>;
  @useResult
  $Res call({String expenseValue, String paymentOut});
}

/// @nodoc
class _$PaymentOutOtherExpenseStateCopyWithImpl<$Res,
        $Val extends PaymentOutOtherExpenseState>
    implements $PaymentOutOtherExpenseStateCopyWith<$Res> {
  _$PaymentOutOtherExpenseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentOutOtherExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseValue = null,
    Object? paymentOut = null,
  }) {
    return _then(_value.copyWith(
      expenseValue: null == expenseValue
          ? _value.expenseValue
          : expenseValue // ignore: cast_nullable_to_non_nullable
              as String,
      paymentOut: null == paymentOut
          ? _value.paymentOut
          : paymentOut // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentOutOtherExpenseStateImplCopyWith<$Res>
    implements $PaymentOutOtherExpenseStateCopyWith<$Res> {
  factory _$$PaymentOutOtherExpenseStateImplCopyWith(
          _$PaymentOutOtherExpenseStateImpl value,
          $Res Function(_$PaymentOutOtherExpenseStateImpl) then) =
      __$$PaymentOutOtherExpenseStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String expenseValue, String paymentOut});
}

/// @nodoc
class __$$PaymentOutOtherExpenseStateImplCopyWithImpl<$Res>
    extends _$PaymentOutOtherExpenseStateCopyWithImpl<$Res,
        _$PaymentOutOtherExpenseStateImpl>
    implements _$$PaymentOutOtherExpenseStateImplCopyWith<$Res> {
  __$$PaymentOutOtherExpenseStateImplCopyWithImpl(
      _$PaymentOutOtherExpenseStateImpl _value,
      $Res Function(_$PaymentOutOtherExpenseStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentOutOtherExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expenseValue = null,
    Object? paymentOut = null,
  }) {
    return _then(_$PaymentOutOtherExpenseStateImpl(
      expenseValue: null == expenseValue
          ? _value.expenseValue
          : expenseValue // ignore: cast_nullable_to_non_nullable
              as String,
      paymentOut: null == paymentOut
          ? _value.paymentOut
          : paymentOut // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentOutOtherExpenseStateImpl
    implements _PaymentOutOtherExpenseState {
  const _$PaymentOutOtherExpenseStateImpl(
      {required this.expenseValue, required this.paymentOut});

  @override
  final String expenseValue;
  @override
  final String paymentOut;

  @override
  String toString() {
    return 'PaymentOutOtherExpenseState(expenseValue: $expenseValue, paymentOut: $paymentOut)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentOutOtherExpenseStateImpl &&
            (identical(other.expenseValue, expenseValue) ||
                other.expenseValue == expenseValue) &&
            (identical(other.paymentOut, paymentOut) ||
                other.paymentOut == paymentOut));
  }

  @override
  int get hashCode => Object.hash(runtimeType, expenseValue, paymentOut);

  /// Create a copy of PaymentOutOtherExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentOutOtherExpenseStateImplCopyWith<_$PaymentOutOtherExpenseStateImpl>
      get copyWith => __$$PaymentOutOtherExpenseStateImplCopyWithImpl<
          _$PaymentOutOtherExpenseStateImpl>(this, _$identity);
}

abstract class _PaymentOutOtherExpenseState
    implements PaymentOutOtherExpenseState {
  const factory _PaymentOutOtherExpenseState(
      {required final String expenseValue,
      required final String paymentOut}) = _$PaymentOutOtherExpenseStateImpl;

  @override
  String get expenseValue;
  @override
  String get paymentOut;

  /// Create a copy of PaymentOutOtherExpenseState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentOutOtherExpenseStateImplCopyWith<_$PaymentOutOtherExpenseStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
