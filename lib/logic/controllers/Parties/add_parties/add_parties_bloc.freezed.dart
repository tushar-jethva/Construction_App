// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_parties_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddPartiesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(PartyType partyType) onPartyTypeChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(PartyType partyType)? onPartyTypeChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(PartyType partyType)? onPartyTypeChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnPartyTypeChange value) onPartyTypeChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnPartyTypeChange value)? onPartyTypeChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnPartyTypeChange value)? onPartyTypeChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPartiesEventCopyWith<$Res> {
  factory $AddPartiesEventCopyWith(
          AddPartiesEvent value, $Res Function(AddPartiesEvent) then) =
      _$AddPartiesEventCopyWithImpl<$Res, AddPartiesEvent>;
}

/// @nodoc
class _$AddPartiesEventCopyWithImpl<$Res, $Val extends AddPartiesEvent>
    implements $AddPartiesEventCopyWith<$Res> {
  _$AddPartiesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPartiesEvent
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
    extends _$AddPartiesEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPartiesEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl with DiagnosticableTreeMixin implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPartiesEvent.initialize()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'AddPartiesEvent.initialize'));
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
    required TResult Function(PartyType partyType) onPartyTypeChange,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(PartyType partyType)? onPartyTypeChange,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(PartyType partyType)? onPartyTypeChange,
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
    required TResult Function(_OnPartyTypeChange value) onPartyTypeChange,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnPartyTypeChange value)? onPartyTypeChange,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnPartyTypeChange value)? onPartyTypeChange,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AddPartiesEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$OnPartyTypeChangeImplCopyWith<$Res> {
  factory _$$OnPartyTypeChangeImplCopyWith(_$OnPartyTypeChangeImpl value,
          $Res Function(_$OnPartyTypeChangeImpl) then) =
      __$$OnPartyTypeChangeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PartyType partyType});
}

/// @nodoc
class __$$OnPartyTypeChangeImplCopyWithImpl<$Res>
    extends _$AddPartiesEventCopyWithImpl<$Res, _$OnPartyTypeChangeImpl>
    implements _$$OnPartyTypeChangeImplCopyWith<$Res> {
  __$$OnPartyTypeChangeImplCopyWithImpl(_$OnPartyTypeChangeImpl _value,
      $Res Function(_$OnPartyTypeChangeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPartiesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partyType = null,
  }) {
    return _then(_$OnPartyTypeChangeImpl(
      partyType: null == partyType
          ? _value.partyType
          : partyType // ignore: cast_nullable_to_non_nullable
              as PartyType,
    ));
  }
}

/// @nodoc

class _$OnPartyTypeChangeImpl
    with DiagnosticableTreeMixin
    implements _OnPartyTypeChange {
  const _$OnPartyTypeChangeImpl({required this.partyType});

  @override
  final PartyType partyType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPartiesEvent.onPartyTypeChange(partyType: $partyType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPartiesEvent.onPartyTypeChange'))
      ..add(DiagnosticsProperty('partyType', partyType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnPartyTypeChangeImpl &&
            (identical(other.partyType, partyType) ||
                other.partyType == partyType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, partyType);

  /// Create a copy of AddPartiesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnPartyTypeChangeImplCopyWith<_$OnPartyTypeChangeImpl> get copyWith =>
      __$$OnPartyTypeChangeImplCopyWithImpl<_$OnPartyTypeChangeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(PartyType partyType) onPartyTypeChange,
  }) {
    return onPartyTypeChange(partyType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(PartyType partyType)? onPartyTypeChange,
  }) {
    return onPartyTypeChange?.call(partyType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(PartyType partyType)? onPartyTypeChange,
    required TResult orElse(),
  }) {
    if (onPartyTypeChange != null) {
      return onPartyTypeChange(partyType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnPartyTypeChange value) onPartyTypeChange,
  }) {
    return onPartyTypeChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnPartyTypeChange value)? onPartyTypeChange,
  }) {
    return onPartyTypeChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnPartyTypeChange value)? onPartyTypeChange,
    required TResult orElse(),
  }) {
    if (onPartyTypeChange != null) {
      return onPartyTypeChange(this);
    }
    return orElse();
  }
}

abstract class _OnPartyTypeChange implements AddPartiesEvent {
  const factory _OnPartyTypeChange({required final PartyType partyType}) =
      _$OnPartyTypeChangeImpl;

  PartyType get partyType;

  /// Create a copy of AddPartiesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnPartyTypeChangeImplCopyWith<_$OnPartyTypeChangeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPartiesState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  PartyType get partyType => throw _privateConstructorUsedError;

  /// Create a copy of AddPartiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPartiesStateCopyWith<AddPartiesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPartiesStateCopyWith<$Res> {
  factory $AddPartiesStateCopyWith(
          AddPartiesState value, $Res Function(AddPartiesState) then) =
      _$AddPartiesStateCopyWithImpl<$Res, AddPartiesState>;
  @useResult
  $Res call({RequestState state, String message, PartyType partyType});
}

/// @nodoc
class _$AddPartiesStateCopyWithImpl<$Res, $Val extends AddPartiesState>
    implements $AddPartiesStateCopyWith<$Res> {
  _$AddPartiesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPartiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? partyType = null,
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
      partyType: null == partyType
          ? _value.partyType
          : partyType // ignore: cast_nullable_to_non_nullable
              as PartyType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPartiesStateImplCopyWith<$Res>
    implements $AddPartiesStateCopyWith<$Res> {
  factory _$$AddPartiesStateImplCopyWith(_$AddPartiesStateImpl value,
          $Res Function(_$AddPartiesStateImpl) then) =
      __$$AddPartiesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, PartyType partyType});
}

/// @nodoc
class __$$AddPartiesStateImplCopyWithImpl<$Res>
    extends _$AddPartiesStateCopyWithImpl<$Res, _$AddPartiesStateImpl>
    implements _$$AddPartiesStateImplCopyWith<$Res> {
  __$$AddPartiesStateImplCopyWithImpl(
      _$AddPartiesStateImpl _value, $Res Function(_$AddPartiesStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPartiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? partyType = null,
  }) {
    return _then(_$AddPartiesStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      partyType: null == partyType
          ? _value.partyType
          : partyType // ignore: cast_nullable_to_non_nullable
              as PartyType,
    ));
  }
}

/// @nodoc

class _$AddPartiesStateImpl
    with DiagnosticableTreeMixin
    implements _AddPartiesState {
  const _$AddPartiesStateImpl(
      {required this.state, required this.message, required this.partyType});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final PartyType partyType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddPartiesState(state: $state, message: $message, partyType: $partyType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddPartiesState'))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('partyType', partyType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPartiesStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.partyType, partyType) ||
                other.partyType == partyType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, partyType);

  /// Create a copy of AddPartiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPartiesStateImplCopyWith<_$AddPartiesStateImpl> get copyWith =>
      __$$AddPartiesStateImplCopyWithImpl<_$AddPartiesStateImpl>(
          this, _$identity);
}

abstract class _AddPartiesState implements AddPartiesState {
  const factory _AddPartiesState(
      {required final RequestState state,
      required final String message,
      required final PartyType partyType}) = _$AddPartiesStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  PartyType get partyType;

  /// Create a copy of AddPartiesState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPartiesStateImplCopyWith<_$AddPartiesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
