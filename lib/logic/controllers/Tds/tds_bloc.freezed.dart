// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tds_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TdsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? year) onFilterYearChanged,
    required TResult Function() fetchTds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchTds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchTds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnFilterYearChanged value) onFilterYearChanged,
    required TResult Function(_fetchTds value) fetchTds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchTds value)? fetchTds,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchTds value)? fetchTds,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TdsEventCopyWith<$Res> {
  factory $TdsEventCopyWith(TdsEvent value, $Res Function(TdsEvent) then) =
      _$TdsEventCopyWithImpl<$Res, TdsEvent>;
}

/// @nodoc
class _$TdsEventCopyWithImpl<$Res, $Val extends TdsEvent>
    implements $TdsEventCopyWith<$Res> {
  _$TdsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TdsEvent
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
    extends _$TdsEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of TdsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'TdsEvent.initialize()';
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
    required TResult Function(String? year) onFilterYearChanged,
    required TResult Function() fetchTds,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchTds,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchTds,
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
    required TResult Function(_OnFilterYearChanged value) onFilterYearChanged,
    required TResult Function(_fetchTds value) fetchTds,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchTds value)? fetchTds,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchTds value)? fetchTds,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements TdsEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$OnFilterYearChangedImplCopyWith<$Res> {
  factory _$$OnFilterYearChangedImplCopyWith(_$OnFilterYearChangedImpl value,
          $Res Function(_$OnFilterYearChangedImpl) then) =
      __$$OnFilterYearChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? year});
}

/// @nodoc
class __$$OnFilterYearChangedImplCopyWithImpl<$Res>
    extends _$TdsEventCopyWithImpl<$Res, _$OnFilterYearChangedImpl>
    implements _$$OnFilterYearChangedImplCopyWith<$Res> {
  __$$OnFilterYearChangedImplCopyWithImpl(_$OnFilterYearChangedImpl _value,
      $Res Function(_$OnFilterYearChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = freezed,
  }) {
    return _then(_$OnFilterYearChangedImpl(
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$OnFilterYearChangedImpl implements _OnFilterYearChanged {
  const _$OnFilterYearChangedImpl({this.year});

  @override
  final String? year;

  @override
  String toString() {
    return 'TdsEvent.onFilterYearChanged(year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnFilterYearChangedImpl &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, year);

  /// Create a copy of TdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnFilterYearChangedImplCopyWith<_$OnFilterYearChangedImpl> get copyWith =>
      __$$OnFilterYearChangedImplCopyWithImpl<_$OnFilterYearChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? year) onFilterYearChanged,
    required TResult Function() fetchTds,
  }) {
    return onFilterYearChanged(year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchTds,
  }) {
    return onFilterYearChanged?.call(year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchTds,
    required TResult orElse(),
  }) {
    if (onFilterYearChanged != null) {
      return onFilterYearChanged(year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnFilterYearChanged value) onFilterYearChanged,
    required TResult Function(_fetchTds value) fetchTds,
  }) {
    return onFilterYearChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchTds value)? fetchTds,
  }) {
    return onFilterYearChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchTds value)? fetchTds,
    required TResult orElse(),
  }) {
    if (onFilterYearChanged != null) {
      return onFilterYearChanged(this);
    }
    return orElse();
  }
}

abstract class _OnFilterYearChanged implements TdsEvent {
  const factory _OnFilterYearChanged({final String? year}) =
      _$OnFilterYearChangedImpl;

  String? get year;

  /// Create a copy of TdsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnFilterYearChangedImplCopyWith<_$OnFilterYearChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$fetchTdsImplCopyWith<$Res> {
  factory _$$fetchTdsImplCopyWith(
          _$fetchTdsImpl value, $Res Function(_$fetchTdsImpl) then) =
      __$$fetchTdsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$fetchTdsImplCopyWithImpl<$Res>
    extends _$TdsEventCopyWithImpl<$Res, _$fetchTdsImpl>
    implements _$$fetchTdsImplCopyWith<$Res> {
  __$$fetchTdsImplCopyWithImpl(
      _$fetchTdsImpl _value, $Res Function(_$fetchTdsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TdsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$fetchTdsImpl implements _fetchTds {
  const _$fetchTdsImpl();

  @override
  String toString() {
    return 'TdsEvent.fetchTds()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$fetchTdsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? year) onFilterYearChanged,
    required TResult Function() fetchTds,
  }) {
    return fetchTds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchTds,
  }) {
    return fetchTds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchTds,
    required TResult orElse(),
  }) {
    if (fetchTds != null) {
      return fetchTds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnFilterYearChanged value) onFilterYearChanged,
    required TResult Function(_fetchTds value) fetchTds,
  }) {
    return fetchTds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchTds value)? fetchTds,
  }) {
    return fetchTds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchTds value)? fetchTds,
    required TResult orElse(),
  }) {
    if (fetchTds != null) {
      return fetchTds(this);
    }
    return orElse();
  }
}

abstract class _fetchTds implements TdsEvent {
  const factory _fetchTds() = _$fetchTdsImpl;
}

/// @nodoc
mixin _$TdsState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  num get total => throw _privateConstructorUsedError;
  int get startYear => throw _privateConstructorUsedError;
  int get endYear => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  TdsModel? get response => throw _privateConstructorUsedError;
  List<OthersTransactionDataModel> get listOfTds =>
      throw _privateConstructorUsedError;

  /// Create a copy of TdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TdsStateCopyWith<TdsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TdsStateCopyWith<$Res> {
  factory $TdsStateCopyWith(TdsState value, $Res Function(TdsState) then) =
      _$TdsStateCopyWithImpl<$Res, TdsState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      num total,
      int startYear,
      int endYear,
      String? year,
      TdsModel? response,
      List<OthersTransactionDataModel> listOfTds});
}

/// @nodoc
class _$TdsStateCopyWithImpl<$Res, $Val extends TdsState>
    implements $TdsStateCopyWith<$Res> {
  _$TdsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? total = null,
    Object? startYear = null,
    Object? endYear = null,
    Object? year = freezed,
    Object? response = freezed,
    Object? listOfTds = null,
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
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      startYear: null == startYear
          ? _value.startYear
          : startYear // ignore: cast_nullable_to_non_nullable
              as int,
      endYear: null == endYear
          ? _value.endYear
          : endYear // ignore: cast_nullable_to_non_nullable
              as int,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as TdsModel?,
      listOfTds: null == listOfTds
          ? _value.listOfTds
          : listOfTds // ignore: cast_nullable_to_non_nullable
              as List<OthersTransactionDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TdsStateImplCopyWith<$Res>
    implements $TdsStateCopyWith<$Res> {
  factory _$$TdsStateImplCopyWith(
          _$TdsStateImpl value, $Res Function(_$TdsStateImpl) then) =
      __$$TdsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      num total,
      int startYear,
      int endYear,
      String? year,
      TdsModel? response,
      List<OthersTransactionDataModel> listOfTds});
}

/// @nodoc
class __$$TdsStateImplCopyWithImpl<$Res>
    extends _$TdsStateCopyWithImpl<$Res, _$TdsStateImpl>
    implements _$$TdsStateImplCopyWith<$Res> {
  __$$TdsStateImplCopyWithImpl(
      _$TdsStateImpl _value, $Res Function(_$TdsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TdsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? total = null,
    Object? startYear = null,
    Object? endYear = null,
    Object? year = freezed,
    Object? response = freezed,
    Object? listOfTds = null,
  }) {
    return _then(_$TdsStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as num,
      startYear: null == startYear
          ? _value.startYear
          : startYear // ignore: cast_nullable_to_non_nullable
              as int,
      endYear: null == endYear
          ? _value.endYear
          : endYear // ignore: cast_nullable_to_non_nullable
              as int,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as TdsModel?,
      listOfTds: null == listOfTds
          ? _value._listOfTds
          : listOfTds // ignore: cast_nullable_to_non_nullable
              as List<OthersTransactionDataModel>,
    ));
  }
}

/// @nodoc

class _$TdsStateImpl implements _TdsState {
  _$TdsStateImpl(
      {required this.state,
      required this.message,
      required this.total,
      required this.startYear,
      required this.endYear,
      required this.year,
      required this.response,
      required final List<OthersTransactionDataModel> listOfTds})
      : _listOfTds = listOfTds;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final num total;
  @override
  final int startYear;
  @override
  final int endYear;
  @override
  final String? year;
  @override
  final TdsModel? response;
  final List<OthersTransactionDataModel> _listOfTds;
  @override
  List<OthersTransactionDataModel> get listOfTds {
    if (_listOfTds is EqualUnmodifiableListView) return _listOfTds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfTds);
  }

  @override
  String toString() {
    return 'TdsState(state: $state, message: $message, total: $total, startYear: $startYear, endYear: $endYear, year: $year, response: $response, listOfTds: $listOfTds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TdsStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.startYear, startYear) ||
                other.startYear == startYear) &&
            (identical(other.endYear, endYear) || other.endYear == endYear) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality()
                .equals(other._listOfTds, _listOfTds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, total, startYear,
      endYear, year, response, const DeepCollectionEquality().hash(_listOfTds));

  /// Create a copy of TdsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TdsStateImplCopyWith<_$TdsStateImpl> get copyWith =>
      __$$TdsStateImplCopyWithImpl<_$TdsStateImpl>(this, _$identity);
}

abstract class _TdsState implements TdsState {
  factory _TdsState(
          {required final RequestState state,
          required final String message,
          required final num total,
          required final int startYear,
          required final int endYear,
          required final String? year,
          required final TdsModel? response,
          required final List<OthersTransactionDataModel> listOfTds}) =
      _$TdsStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  num get total;
  @override
  int get startYear;
  @override
  int get endYear;
  @override
  String? get year;
  @override
  TdsModel? get response;
  @override
  List<OthersTransactionDataModel> get listOfTds;

  /// Create a copy of TdsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TdsStateImplCopyWith<_$TdsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
