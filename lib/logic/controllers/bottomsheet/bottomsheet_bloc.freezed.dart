// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bottomsheet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomsheetEvent {
  bool get isSheetOpen => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isSheetOpen) openBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isSheetOpen)? openBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isSheetOpen)? openBottomSheet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenBottomSheet value) openBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenBottomSheet value)? openBottomSheet,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenBottomSheet value)? openBottomSheet,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of BottomsheetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomsheetEventCopyWith<BottomsheetEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomsheetEventCopyWith<$Res> {
  factory $BottomsheetEventCopyWith(
          BottomsheetEvent value, $Res Function(BottomsheetEvent) then) =
      _$BottomsheetEventCopyWithImpl<$Res, BottomsheetEvent>;
  @useResult
  $Res call({bool isSheetOpen});
}

/// @nodoc
class _$BottomsheetEventCopyWithImpl<$Res, $Val extends BottomsheetEvent>
    implements $BottomsheetEventCopyWith<$Res> {
  _$BottomsheetEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomsheetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSheetOpen = null,
  }) {
    return _then(_value.copyWith(
      isSheetOpen: null == isSheetOpen
          ? _value.isSheetOpen
          : isSheetOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OpenBottomSheetImplCopyWith<$Res>
    implements $BottomsheetEventCopyWith<$Res> {
  factory _$$OpenBottomSheetImplCopyWith(_$OpenBottomSheetImpl value,
          $Res Function(_$OpenBottomSheetImpl) then) =
      __$$OpenBottomSheetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isSheetOpen});
}

/// @nodoc
class __$$OpenBottomSheetImplCopyWithImpl<$Res>
    extends _$BottomsheetEventCopyWithImpl<$Res, _$OpenBottomSheetImpl>
    implements _$$OpenBottomSheetImplCopyWith<$Res> {
  __$$OpenBottomSheetImplCopyWithImpl(
      _$OpenBottomSheetImpl _value, $Res Function(_$OpenBottomSheetImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomsheetEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSheetOpen = null,
  }) {
    return _then(_$OpenBottomSheetImpl(
      null == isSheetOpen
          ? _value.isSheetOpen
          : isSheetOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OpenBottomSheetImpl implements _OpenBottomSheet {
  const _$OpenBottomSheetImpl(this.isSheetOpen);

  @override
  final bool isSheetOpen;

  @override
  String toString() {
    return 'BottomsheetEvent.openBottomSheet(isSheetOpen: $isSheetOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OpenBottomSheetImpl &&
            (identical(other.isSheetOpen, isSheetOpen) ||
                other.isSheetOpen == isSheetOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSheetOpen);

  /// Create a copy of BottomsheetEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OpenBottomSheetImplCopyWith<_$OpenBottomSheetImpl> get copyWith =>
      __$$OpenBottomSheetImplCopyWithImpl<_$OpenBottomSheetImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isSheetOpen) openBottomSheet,
  }) {
    return openBottomSheet(isSheetOpen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isSheetOpen)? openBottomSheet,
  }) {
    return openBottomSheet?.call(isSheetOpen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isSheetOpen)? openBottomSheet,
    required TResult orElse(),
  }) {
    if (openBottomSheet != null) {
      return openBottomSheet(isSheetOpen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OpenBottomSheet value) openBottomSheet,
  }) {
    return openBottomSheet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OpenBottomSheet value)? openBottomSheet,
  }) {
    return openBottomSheet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OpenBottomSheet value)? openBottomSheet,
    required TResult orElse(),
  }) {
    if (openBottomSheet != null) {
      return openBottomSheet(this);
    }
    return orElse();
  }
}

abstract class _OpenBottomSheet implements BottomsheetEvent {
  const factory _OpenBottomSheet(final bool isSheetOpen) =
      _$OpenBottomSheetImpl;

  @override
  bool get isSheetOpen;

  /// Create a copy of BottomsheetEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OpenBottomSheetImplCopyWith<_$OpenBottomSheetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BottomsheetState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSheetOpen => throw _privateConstructorUsedError;

  /// Create a copy of BottomsheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BottomsheetStateCopyWith<BottomsheetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomsheetStateCopyWith<$Res> {
  factory $BottomsheetStateCopyWith(
          BottomsheetState value, $Res Function(BottomsheetState) then) =
      _$BottomsheetStateCopyWithImpl<$Res, BottomsheetState>;
  @useResult
  $Res call({RequestState state, String message, bool isSheetOpen});
}

/// @nodoc
class _$BottomsheetStateCopyWithImpl<$Res, $Val extends BottomsheetState>
    implements $BottomsheetStateCopyWith<$Res> {
  _$BottomsheetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BottomsheetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSheetOpen = null,
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
      isSheetOpen: null == isSheetOpen
          ? _value.isSheetOpen
          : isSheetOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomsheetStateImplCopyWith<$Res>
    implements $BottomsheetStateCopyWith<$Res> {
  factory _$$BottomsheetStateImplCopyWith(_$BottomsheetStateImpl value,
          $Res Function(_$BottomsheetStateImpl) then) =
      __$$BottomsheetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, bool isSheetOpen});
}

/// @nodoc
class __$$BottomsheetStateImplCopyWithImpl<$Res>
    extends _$BottomsheetStateCopyWithImpl<$Res, _$BottomsheetStateImpl>
    implements _$$BottomsheetStateImplCopyWith<$Res> {
  __$$BottomsheetStateImplCopyWithImpl(_$BottomsheetStateImpl _value,
      $Res Function(_$BottomsheetStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BottomsheetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSheetOpen = null,
  }) {
    return _then(_$BottomsheetStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isSheetOpen: null == isSheetOpen
          ? _value.isSheetOpen
          : isSheetOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BottomsheetStateImpl implements _BottomsheetState {
  const _$BottomsheetStateImpl(
      {required this.state, required this.message, required this.isSheetOpen});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSheetOpen;

  @override
  String toString() {
    return 'BottomsheetState(state: $state, message: $message, isSheetOpen: $isSheetOpen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomsheetStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSheetOpen, isSheetOpen) ||
                other.isSheetOpen == isSheetOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, isSheetOpen);

  /// Create a copy of BottomsheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomsheetStateImplCopyWith<_$BottomsheetStateImpl> get copyWith =>
      __$$BottomsheetStateImplCopyWithImpl<_$BottomsheetStateImpl>(
          this, _$identity);
}

abstract class _BottomsheetState implements BottomsheetState {
  const factory _BottomsheetState(
      {required final RequestState state,
      required final String message,
      required final bool isSheetOpen}) = _$BottomsheetStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSheetOpen;

  /// Create a copy of BottomsheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BottomsheetStateImplCopyWith<_$BottomsheetStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
