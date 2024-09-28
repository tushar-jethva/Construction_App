// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financial_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FinancialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchFinancials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchFinancials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchFinancials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFinancials value) fetchFinancials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFinancials value)? fetchFinancials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFinancials value)? fetchFinancials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialEventCopyWith<$Res> {
  factory $FinancialEventCopyWith(
          FinancialEvent value, $Res Function(FinancialEvent) then) =
      _$FinancialEventCopyWithImpl<$Res, FinancialEvent>;
}

/// @nodoc
class _$FinancialEventCopyWithImpl<$Res, $Val extends FinancialEvent>
    implements $FinancialEventCopyWith<$Res> {
  _$FinancialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchFinancialsImplCopyWith<$Res> {
  factory _$$FetchFinancialsImplCopyWith(_$FetchFinancialsImpl value,
          $Res Function(_$FetchFinancialsImpl) then) =
      __$$FetchFinancialsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchFinancialsImplCopyWithImpl<$Res>
    extends _$FinancialEventCopyWithImpl<$Res, _$FetchFinancialsImpl>
    implements _$$FetchFinancialsImplCopyWith<$Res> {
  __$$FetchFinancialsImplCopyWithImpl(
      _$FetchFinancialsImpl _value, $Res Function(_$FetchFinancialsImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinancialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchFinancialsImpl implements _FetchFinancials {
  const _$FetchFinancialsImpl();

  @override
  String toString() {
    return 'FinancialEvent.fetchFinancials()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchFinancialsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchFinancials,
  }) {
    return fetchFinancials();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchFinancials,
  }) {
    return fetchFinancials?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchFinancials,
    required TResult orElse(),
  }) {
    if (fetchFinancials != null) {
      return fetchFinancials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFinancials value) fetchFinancials,
  }) {
    return fetchFinancials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFinancials value)? fetchFinancials,
  }) {
    return fetchFinancials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFinancials value)? fetchFinancials,
    required TResult orElse(),
  }) {
    if (fetchFinancials != null) {
      return fetchFinancials(this);
    }
    return orElse();
  }
}

abstract class _FetchFinancials implements FinancialEvent {
  const factory _FetchFinancials() = _$FetchFinancialsImpl;
}

/// @nodoc
mixin _$FinancialState {
  RequestState get state => throw _privateConstructorUsedError;
  FinancialModel get financialModel => throw _privateConstructorUsedError;

  /// Create a copy of FinancialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialStateCopyWith<FinancialState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialStateCopyWith<$Res> {
  factory $FinancialStateCopyWith(
          FinancialState value, $Res Function(FinancialState) then) =
      _$FinancialStateCopyWithImpl<$Res, FinancialState>;
  @useResult
  $Res call({RequestState state, FinancialModel financialModel});
}

/// @nodoc
class _$FinancialStateCopyWithImpl<$Res, $Val extends FinancialState>
    implements $FinancialStateCopyWith<$Res> {
  _$FinancialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? financialModel = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      financialModel: null == financialModel
          ? _value.financialModel
          : financialModel // ignore: cast_nullable_to_non_nullable
              as FinancialModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinancialStateImplCopyWith<$Res>
    implements $FinancialStateCopyWith<$Res> {
  factory _$$FinancialStateImplCopyWith(_$FinancialStateImpl value,
          $Res Function(_$FinancialStateImpl) then) =
      __$$FinancialStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, FinancialModel financialModel});
}

/// @nodoc
class __$$FinancialStateImplCopyWithImpl<$Res>
    extends _$FinancialStateCopyWithImpl<$Res, _$FinancialStateImpl>
    implements _$$FinancialStateImplCopyWith<$Res> {
  __$$FinancialStateImplCopyWithImpl(
      _$FinancialStateImpl _value, $Res Function(_$FinancialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinancialState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? financialModel = null,
  }) {
    return _then(_$FinancialStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      financialModel: null == financialModel
          ? _value.financialModel
          : financialModel // ignore: cast_nullable_to_non_nullable
              as FinancialModel,
    ));
  }
}

/// @nodoc

class _$FinancialStateImpl implements _FinancialState {
  const _$FinancialStateImpl(
      {required this.state, required this.financialModel});

  @override
  final RequestState state;
  @override
  final FinancialModel financialModel;

  @override
  String toString() {
    return 'FinancialState(state: $state, financialModel: $financialModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.financialModel, financialModel) ||
                other.financialModel == financialModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, financialModel);

  /// Create a copy of FinancialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialStateImplCopyWith<_$FinancialStateImpl> get copyWith =>
      __$$FinancialStateImplCopyWithImpl<_$FinancialStateImpl>(
          this, _$identity);
}

abstract class _FinancialState implements FinancialState {
  const factory _FinancialState(
      {required final RequestState state,
      required final FinancialModel financialModel}) = _$FinancialStateImpl;

  @override
  RequestState get state;
  @override
  FinancialModel get financialModel;

  /// Create a copy of FinancialState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancialStateImplCopyWith<_$FinancialStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
