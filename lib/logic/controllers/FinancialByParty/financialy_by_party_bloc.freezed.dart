// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financialy_by_party_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FinancialyByPartyEvent {
  String get partyId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String partyId) fetchFinancialsByParty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String partyId)? fetchFinancialsByParty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String partyId)? fetchFinancialsByParty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFinancialByParty value)
        fetchFinancialsByParty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFinancialByParty value)? fetchFinancialsByParty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFinancialByParty value)? fetchFinancialsByParty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FinancialyByPartyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialyByPartyEventCopyWith<FinancialyByPartyEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialyByPartyEventCopyWith<$Res> {
  factory $FinancialyByPartyEventCopyWith(FinancialyByPartyEvent value,
          $Res Function(FinancialyByPartyEvent) then) =
      _$FinancialyByPartyEventCopyWithImpl<$Res, FinancialyByPartyEvent>;
  @useResult
  $Res call({String partyId});
}

/// @nodoc
class _$FinancialyByPartyEventCopyWithImpl<$Res,
        $Val extends FinancialyByPartyEvent>
    implements $FinancialyByPartyEventCopyWith<$Res> {
  _$FinancialyByPartyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialyByPartyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partyId = null,
  }) {
    return _then(_value.copyWith(
      partyId: null == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchFinancialByPartyImplCopyWith<$Res>
    implements $FinancialyByPartyEventCopyWith<$Res> {
  factory _$$FetchFinancialByPartyImplCopyWith(
          _$FetchFinancialByPartyImpl value,
          $Res Function(_$FetchFinancialByPartyImpl) then) =
      __$$FetchFinancialByPartyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String partyId});
}

/// @nodoc
class __$$FetchFinancialByPartyImplCopyWithImpl<$Res>
    extends _$FinancialyByPartyEventCopyWithImpl<$Res,
        _$FetchFinancialByPartyImpl>
    implements _$$FetchFinancialByPartyImplCopyWith<$Res> {
  __$$FetchFinancialByPartyImplCopyWithImpl(_$FetchFinancialByPartyImpl _value,
      $Res Function(_$FetchFinancialByPartyImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinancialyByPartyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partyId = null,
  }) {
    return _then(_$FetchFinancialByPartyImpl(
      partyId: null == partyId
          ? _value.partyId
          : partyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchFinancialByPartyImpl implements _FetchFinancialByParty {
  const _$FetchFinancialByPartyImpl({required this.partyId});

  @override
  final String partyId;

  @override
  String toString() {
    return 'FinancialyByPartyEvent.fetchFinancialsByParty(partyId: $partyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchFinancialByPartyImpl &&
            (identical(other.partyId, partyId) || other.partyId == partyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partyId);

  /// Create a copy of FinancialyByPartyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchFinancialByPartyImplCopyWith<_$FetchFinancialByPartyImpl>
      get copyWith => __$$FetchFinancialByPartyImplCopyWithImpl<
          _$FetchFinancialByPartyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String partyId) fetchFinancialsByParty,
  }) {
    return fetchFinancialsByParty(partyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String partyId)? fetchFinancialsByParty,
  }) {
    return fetchFinancialsByParty?.call(partyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String partyId)? fetchFinancialsByParty,
    required TResult orElse(),
  }) {
    if (fetchFinancialsByParty != null) {
      return fetchFinancialsByParty(partyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchFinancialByParty value)
        fetchFinancialsByParty,
  }) {
    return fetchFinancialsByParty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchFinancialByParty value)? fetchFinancialsByParty,
  }) {
    return fetchFinancialsByParty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchFinancialByParty value)? fetchFinancialsByParty,
    required TResult orElse(),
  }) {
    if (fetchFinancialsByParty != null) {
      return fetchFinancialsByParty(this);
    }
    return orElse();
  }
}

abstract class _FetchFinancialByParty implements FinancialyByPartyEvent {
  const factory _FetchFinancialByParty({required final String partyId}) =
      _$FetchFinancialByPartyImpl;

  @override
  String get partyId;

  /// Create a copy of FinancialyByPartyEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchFinancialByPartyImplCopyWith<_$FetchFinancialByPartyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FinancialyByPartyState {
  RequestState get state => throw _privateConstructorUsedError;
  FinancialModel get financialModel => throw _privateConstructorUsedError;

  /// Create a copy of FinancialyByPartyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinancialyByPartyStateCopyWith<FinancialyByPartyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialyByPartyStateCopyWith<$Res> {
  factory $FinancialyByPartyStateCopyWith(FinancialyByPartyState value,
          $Res Function(FinancialyByPartyState) then) =
      _$FinancialyByPartyStateCopyWithImpl<$Res, FinancialyByPartyState>;
  @useResult
  $Res call({RequestState state, FinancialModel financialModel});
}

/// @nodoc
class _$FinancialyByPartyStateCopyWithImpl<$Res,
        $Val extends FinancialyByPartyState>
    implements $FinancialyByPartyStateCopyWith<$Res> {
  _$FinancialyByPartyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinancialyByPartyState
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
abstract class _$$FinancialyByPartyStateImplCopyWith<$Res>
    implements $FinancialyByPartyStateCopyWith<$Res> {
  factory _$$FinancialyByPartyStateImplCopyWith(
          _$FinancialyByPartyStateImpl value,
          $Res Function(_$FinancialyByPartyStateImpl) then) =
      __$$FinancialyByPartyStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, FinancialModel financialModel});
}

/// @nodoc
class __$$FinancialyByPartyStateImplCopyWithImpl<$Res>
    extends _$FinancialyByPartyStateCopyWithImpl<$Res,
        _$FinancialyByPartyStateImpl>
    implements _$$FinancialyByPartyStateImplCopyWith<$Res> {
  __$$FinancialyByPartyStateImplCopyWithImpl(
      _$FinancialyByPartyStateImpl _value,
      $Res Function(_$FinancialyByPartyStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinancialyByPartyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? financialModel = null,
  }) {
    return _then(_$FinancialyByPartyStateImpl(
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

class _$FinancialyByPartyStateImpl implements _FinancialyByPartyState {
  const _$FinancialyByPartyStateImpl(
      {required this.state, required this.financialModel});

  @override
  final RequestState state;
  @override
  final FinancialModel financialModel;

  @override
  String toString() {
    return 'FinancialyByPartyState(state: $state, financialModel: $financialModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialyByPartyStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.financialModel, financialModel) ||
                other.financialModel == financialModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, financialModel);

  /// Create a copy of FinancialyByPartyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialyByPartyStateImplCopyWith<_$FinancialyByPartyStateImpl>
      get copyWith => __$$FinancialyByPartyStateImplCopyWithImpl<
          _$FinancialyByPartyStateImpl>(this, _$identity);
}

abstract class _FinancialyByPartyState implements FinancialyByPartyState {
  const factory _FinancialyByPartyState(
          {required final RequestState state,
          required final FinancialModel financialModel}) =
      _$FinancialyByPartyStateImpl;

  @override
  RequestState get state;
  @override
  FinancialModel get financialModel;

  /// Create a copy of FinancialyByPartyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FinancialyByPartyStateImplCopyWith<_$FinancialyByPartyStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
