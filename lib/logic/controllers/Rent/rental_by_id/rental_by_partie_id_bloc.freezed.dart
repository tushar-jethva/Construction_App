// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rental_by_partie_id_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RentalByPartieIdEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String partieId) getRentalByPartie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String partieId)? getRentalByPartie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String partieId)? getRentalByPartie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetRentalByPartie value) getRentalByPartie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetRentalByPartie value)? getRentalByPartie,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetRentalByPartie value)? getRentalByPartie,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalByPartieIdEventCopyWith<$Res> {
  factory $RentalByPartieIdEventCopyWith(RentalByPartieIdEvent value,
          $Res Function(RentalByPartieIdEvent) then) =
      _$RentalByPartieIdEventCopyWithImpl<$Res, RentalByPartieIdEvent>;
}

/// @nodoc
class _$RentalByPartieIdEventCopyWithImpl<$Res,
        $Val extends RentalByPartieIdEvent>
    implements $RentalByPartieIdEventCopyWith<$Res> {
  _$RentalByPartieIdEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalByPartieIdEvent
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
    extends _$RentalByPartieIdEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentalByPartieIdEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'RentalByPartieIdEvent.started()';
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
    required TResult Function(String partieId) getRentalByPartie,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String partieId)? getRentalByPartie,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String partieId)? getRentalByPartie,
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
    required TResult Function(_GetRentalByPartie value) getRentalByPartie,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetRentalByPartie value)? getRentalByPartie,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetRentalByPartie value)? getRentalByPartie,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements RentalByPartieIdEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetRentalByPartieImplCopyWith<$Res> {
  factory _$$GetRentalByPartieImplCopyWith(_$GetRentalByPartieImpl value,
          $Res Function(_$GetRentalByPartieImpl) then) =
      __$$GetRentalByPartieImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String partieId});
}

/// @nodoc
class __$$GetRentalByPartieImplCopyWithImpl<$Res>
    extends _$RentalByPartieIdEventCopyWithImpl<$Res, _$GetRentalByPartieImpl>
    implements _$$GetRentalByPartieImplCopyWith<$Res> {
  __$$GetRentalByPartieImplCopyWithImpl(_$GetRentalByPartieImpl _value,
      $Res Function(_$GetRentalByPartieImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentalByPartieIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partieId = null,
  }) {
    return _then(_$GetRentalByPartieImpl(
      partieId: null == partieId
          ? _value.partieId
          : partieId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRentalByPartieImpl implements _GetRentalByPartie {
  const _$GetRentalByPartieImpl({required this.partieId});

  @override
  final String partieId;

  @override
  String toString() {
    return 'RentalByPartieIdEvent.getRentalByPartie(partieId: $partieId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRentalByPartieImpl &&
            (identical(other.partieId, partieId) ||
                other.partieId == partieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partieId);

  /// Create a copy of RentalByPartieIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRentalByPartieImplCopyWith<_$GetRentalByPartieImpl> get copyWith =>
      __$$GetRentalByPartieImplCopyWithImpl<_$GetRentalByPartieImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String partieId) getRentalByPartie,
  }) {
    return getRentalByPartie(partieId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String partieId)? getRentalByPartie,
  }) {
    return getRentalByPartie?.call(partieId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String partieId)? getRentalByPartie,
    required TResult orElse(),
  }) {
    if (getRentalByPartie != null) {
      return getRentalByPartie(partieId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetRentalByPartie value) getRentalByPartie,
  }) {
    return getRentalByPartie(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetRentalByPartie value)? getRentalByPartie,
  }) {
    return getRentalByPartie?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetRentalByPartie value)? getRentalByPartie,
    required TResult orElse(),
  }) {
    if (getRentalByPartie != null) {
      return getRentalByPartie(this);
    }
    return orElse();
  }
}

abstract class _GetRentalByPartie implements RentalByPartieIdEvent {
  const factory _GetRentalByPartie({required final String partieId}) =
      _$GetRentalByPartieImpl;

  String get partieId;

  /// Create a copy of RentalByPartieIdEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRentalByPartieImplCopyWith<_$GetRentalByPartieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RentalByPartieIdState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<RentalModel> get listOfRentals => throw _privateConstructorUsedError;

  /// Create a copy of RentalByPartieIdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RentalByPartieIdStateCopyWith<RentalByPartieIdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RentalByPartieIdStateCopyWith<$Res> {
  factory $RentalByPartieIdStateCopyWith(RentalByPartieIdState value,
          $Res Function(RentalByPartieIdState) then) =
      _$RentalByPartieIdStateCopyWithImpl<$Res, RentalByPartieIdState>;
  @useResult
  $Res call(
      {RequestState state, String message, List<RentalModel> listOfRentals});
}

/// @nodoc
class _$RentalByPartieIdStateCopyWithImpl<$Res,
        $Val extends RentalByPartieIdState>
    implements $RentalByPartieIdStateCopyWith<$Res> {
  _$RentalByPartieIdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RentalByPartieIdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? listOfRentals = null,
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
      listOfRentals: null == listOfRentals
          ? _value.listOfRentals
          : listOfRentals // ignore: cast_nullable_to_non_nullable
              as List<RentalModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RentalByPartieIdStateImplCopyWith<$Res>
    implements $RentalByPartieIdStateCopyWith<$Res> {
  factory _$$RentalByPartieIdStateImplCopyWith(
          _$RentalByPartieIdStateImpl value,
          $Res Function(_$RentalByPartieIdStateImpl) then) =
      __$$RentalByPartieIdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state, String message, List<RentalModel> listOfRentals});
}

/// @nodoc
class __$$RentalByPartieIdStateImplCopyWithImpl<$Res>
    extends _$RentalByPartieIdStateCopyWithImpl<$Res,
        _$RentalByPartieIdStateImpl>
    implements _$$RentalByPartieIdStateImplCopyWith<$Res> {
  __$$RentalByPartieIdStateImplCopyWithImpl(_$RentalByPartieIdStateImpl _value,
      $Res Function(_$RentalByPartieIdStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RentalByPartieIdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? listOfRentals = null,
  }) {
    return _then(_$RentalByPartieIdStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      listOfRentals: null == listOfRentals
          ? _value._listOfRentals
          : listOfRentals // ignore: cast_nullable_to_non_nullable
              as List<RentalModel>,
    ));
  }
}

/// @nodoc

class _$RentalByPartieIdStateImpl implements _RentalByPartieIdState {
  const _$RentalByPartieIdStateImpl(
      {required this.state,
      required this.message,
      required final List<RentalModel> listOfRentals})
      : _listOfRentals = listOfRentals;

  @override
  final RequestState state;
  @override
  final String message;
  final List<RentalModel> _listOfRentals;
  @override
  List<RentalModel> get listOfRentals {
    if (_listOfRentals is EqualUnmodifiableListView) return _listOfRentals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfRentals);
  }

  @override
  String toString() {
    return 'RentalByPartieIdState(state: $state, message: $message, listOfRentals: $listOfRentals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RentalByPartieIdStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._listOfRentals, _listOfRentals));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message,
      const DeepCollectionEquality().hash(_listOfRentals));

  /// Create a copy of RentalByPartieIdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RentalByPartieIdStateImplCopyWith<_$RentalByPartieIdStateImpl>
      get copyWith => __$$RentalByPartieIdStateImplCopyWithImpl<
          _$RentalByPartieIdStateImpl>(this, _$identity);
}

abstract class _RentalByPartieIdState implements RentalByPartieIdState {
  const factory _RentalByPartieIdState(
          {required final RequestState state,
          required final String message,
          required final List<RentalModel> listOfRentals}) =
      _$RentalByPartieIdStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  List<RentalModel> get listOfRentals;

  /// Create a copy of RentalByPartieIdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RentalByPartieIdStateImplCopyWith<_$RentalByPartieIdStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
