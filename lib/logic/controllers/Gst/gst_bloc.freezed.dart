// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gst_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GstEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? year) onFilterYearChanged,
    required TResult Function() fetchGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchGst,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnFilterYearChanged value) onFilterYearChanged,
    required TResult Function(_fetchGst value) fetchGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchGst value)? fetchGst,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchGst value)? fetchGst,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GstEventCopyWith<$Res> {
  factory $GstEventCopyWith(GstEvent value, $Res Function(GstEvent) then) =
      _$GstEventCopyWithImpl<$Res, GstEvent>;
}

/// @nodoc
class _$GstEventCopyWithImpl<$Res, $Val extends GstEvent>
    implements $GstEventCopyWith<$Res> {
  _$GstEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GstEvent
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
    extends _$GstEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of GstEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'GstEvent.initialize()';
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
    required TResult Function() fetchGst,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchGst,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchGst,
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
    required TResult Function(_fetchGst value) fetchGst,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchGst value)? fetchGst,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchGst value)? fetchGst,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements GstEvent {
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
    extends _$GstEventCopyWithImpl<$Res, _$OnFilterYearChangedImpl>
    implements _$$OnFilterYearChangedImplCopyWith<$Res> {
  __$$OnFilterYearChangedImplCopyWithImpl(_$OnFilterYearChangedImpl _value,
      $Res Function(_$OnFilterYearChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of GstEvent
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
    return 'GstEvent.onFilterYearChanged(year: $year)';
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

  /// Create a copy of GstEvent
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
    required TResult Function() fetchGst,
  }) {
    return onFilterYearChanged(year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchGst,
  }) {
    return onFilterYearChanged?.call(year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchGst,
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
    required TResult Function(_fetchGst value) fetchGst,
  }) {
    return onFilterYearChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchGst value)? fetchGst,
  }) {
    return onFilterYearChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchGst value)? fetchGst,
    required TResult orElse(),
  }) {
    if (onFilterYearChanged != null) {
      return onFilterYearChanged(this);
    }
    return orElse();
  }
}

abstract class _OnFilterYearChanged implements GstEvent {
  const factory _OnFilterYearChanged({final String? year}) =
      _$OnFilterYearChangedImpl;

  String? get year;

  /// Create a copy of GstEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnFilterYearChangedImplCopyWith<_$OnFilterYearChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$fetchGstImplCopyWith<$Res> {
  factory _$$fetchGstImplCopyWith(
          _$fetchGstImpl value, $Res Function(_$fetchGstImpl) then) =
      __$$fetchGstImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$fetchGstImplCopyWithImpl<$Res>
    extends _$GstEventCopyWithImpl<$Res, _$fetchGstImpl>
    implements _$$fetchGstImplCopyWith<$Res> {
  __$$fetchGstImplCopyWithImpl(
      _$fetchGstImpl _value, $Res Function(_$fetchGstImpl) _then)
      : super(_value, _then);

  /// Create a copy of GstEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$fetchGstImpl implements _fetchGst {
  const _$fetchGstImpl();

  @override
  String toString() {
    return 'GstEvent.fetchGst()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$fetchGstImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String? year) onFilterYearChanged,
    required TResult Function() fetchGst,
  }) {
    return fetchGst();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String? year)? onFilterYearChanged,
    TResult? Function()? fetchGst,
  }) {
    return fetchGst?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String? year)? onFilterYearChanged,
    TResult Function()? fetchGst,
    required TResult orElse(),
  }) {
    if (fetchGst != null) {
      return fetchGst();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnFilterYearChanged value) onFilterYearChanged,
    required TResult Function(_fetchGst value) fetchGst,
  }) {
    return fetchGst(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult? Function(_fetchGst value)? fetchGst,
  }) {
    return fetchGst?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnFilterYearChanged value)? onFilterYearChanged,
    TResult Function(_fetchGst value)? fetchGst,
    required TResult orElse(),
  }) {
    if (fetchGst != null) {
      return fetchGst(this);
    }
    return orElse();
  }
}

abstract class _fetchGst implements GstEvent {
  const factory _fetchGst() = _$fetchGstImpl;
}

/// @nodoc
mixin _$GstState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  num get total => throw _privateConstructorUsedError;
  int get startYear => throw _privateConstructorUsedError;
  int get endYear => throw _privateConstructorUsedError;
  String? get year => throw _privateConstructorUsedError;
  GstModel? get response => throw _privateConstructorUsedError;
  List<OthersTransactionDataModel> get listOfGst =>
      throw _privateConstructorUsedError;

  /// Create a copy of GstState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GstStateCopyWith<GstState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GstStateCopyWith<$Res> {
  factory $GstStateCopyWith(GstState value, $Res Function(GstState) then) =
      _$GstStateCopyWithImpl<$Res, GstState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      num total,
      int startYear,
      int endYear,
      String? year,
      GstModel? response,
      List<OthersTransactionDataModel> listOfGst});
}

/// @nodoc
class _$GstStateCopyWithImpl<$Res, $Val extends GstState>
    implements $GstStateCopyWith<$Res> {
  _$GstStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GstState
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
    Object? listOfGst = null,
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
              as GstModel?,
      listOfGst: null == listOfGst
          ? _value.listOfGst
          : listOfGst // ignore: cast_nullable_to_non_nullable
              as List<OthersTransactionDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GstStateImplCopyWith<$Res>
    implements $GstStateCopyWith<$Res> {
  factory _$$GstStateImplCopyWith(
          _$GstStateImpl value, $Res Function(_$GstStateImpl) then) =
      __$$GstStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      num total,
      int startYear,
      int endYear,
      String? year,
      GstModel? response,
      List<OthersTransactionDataModel> listOfGst});
}

/// @nodoc
class __$$GstStateImplCopyWithImpl<$Res>
    extends _$GstStateCopyWithImpl<$Res, _$GstStateImpl>
    implements _$$GstStateImplCopyWith<$Res> {
  __$$GstStateImplCopyWithImpl(
      _$GstStateImpl _value, $Res Function(_$GstStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GstState
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
    Object? listOfGst = null,
  }) {
    return _then(_$GstStateImpl(
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
              as GstModel?,
      listOfGst: null == listOfGst
          ? _value._listOfGst
          : listOfGst // ignore: cast_nullable_to_non_nullable
              as List<OthersTransactionDataModel>,
    ));
  }
}

/// @nodoc

class _$GstStateImpl implements _GstState {
  _$GstStateImpl(
      {required this.state,
      required this.message,
      required this.total,
      required this.startYear,
      required this.endYear,
      required this.year,
      required this.response,
      required final List<OthersTransactionDataModel> listOfGst})
      : _listOfGst = listOfGst;

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
  final GstModel? response;
  final List<OthersTransactionDataModel> _listOfGst;
  @override
  List<OthersTransactionDataModel> get listOfGst {
    if (_listOfGst is EqualUnmodifiableListView) return _listOfGst;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfGst);
  }

  @override
  String toString() {
    return 'GstState(state: $state, message: $message, total: $total, startYear: $startYear, endYear: $endYear, year: $year, response: $response, listOfGst: $listOfGst)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GstStateImpl &&
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
                .equals(other._listOfGst, _listOfGst));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, total, startYear,
      endYear, year, response, const DeepCollectionEquality().hash(_listOfGst));

  /// Create a copy of GstState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GstStateImplCopyWith<_$GstStateImpl> get copyWith =>
      __$$GstStateImplCopyWithImpl<_$GstStateImpl>(this, _$identity);
}

abstract class _GstState implements GstState {
  factory _GstState(
          {required final RequestState state,
          required final String message,
          required final num total,
          required final int startYear,
          required final int endYear,
          required final String? year,
          required final GstModel? response,
          required final List<OthersTransactionDataModel> listOfGst}) =
      _$GstStateImpl;

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
  GstModel? get response;
  @override
  List<OthersTransactionDataModel> get listOfGst;

  /// Create a copy of GstState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GstStateImplCopyWith<_$GstStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
