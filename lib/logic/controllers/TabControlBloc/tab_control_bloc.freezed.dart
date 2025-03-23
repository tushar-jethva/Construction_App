// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tab_control_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TabControlEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) tabIndexChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? tabIndexChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? tabIndexChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_TabIndexChanged value) tabIndexChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TabIndexChanged value)? tabIndexChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TabIndexChanged value)? tabIndexChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabControlEventCopyWith<$Res> {
  factory $TabControlEventCopyWith(
          TabControlEvent value, $Res Function(TabControlEvent) then) =
      _$TabControlEventCopyWithImpl<$Res, TabControlEvent>;
}

/// @nodoc
class _$TabControlEventCopyWithImpl<$Res, $Val extends TabControlEvent>
    implements $TabControlEventCopyWith<$Res> {
  _$TabControlEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabControlEvent
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
    extends _$TabControlEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabControlEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TabControlEvent.started()';
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
    required TResult Function(int index) tabIndexChanged,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? tabIndexChanged,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? tabIndexChanged,
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
    required TResult Function(_TabIndexChanged value) tabIndexChanged,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TabIndexChanged value)? tabIndexChanged,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TabIndexChanged value)? tabIndexChanged,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TabControlEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$TabIndexChangedImplCopyWith<$Res> {
  factory _$$TabIndexChangedImplCopyWith(_$TabIndexChangedImpl value,
          $Res Function(_$TabIndexChangedImpl) then) =
      __$$TabIndexChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$TabIndexChangedImplCopyWithImpl<$Res>
    extends _$TabControlEventCopyWithImpl<$Res, _$TabIndexChangedImpl>
    implements _$$TabIndexChangedImplCopyWith<$Res> {
  __$$TabIndexChangedImplCopyWithImpl(
      _$TabIndexChangedImpl _value, $Res Function(_$TabIndexChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabControlEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$TabIndexChangedImpl(
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TabIndexChangedImpl implements _TabIndexChanged {
  const _$TabIndexChangedImpl({required this.index});

  @override
  final int index;

  @override
  String toString() {
    return 'TabControlEvent.tabIndexChanged(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabIndexChangedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  /// Create a copy of TabControlEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabIndexChangedImplCopyWith<_$TabIndexChangedImpl> get copyWith =>
      __$$TabIndexChangedImplCopyWithImpl<_$TabIndexChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) tabIndexChanged,
  }) {
    return tabIndexChanged(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? tabIndexChanged,
  }) {
    return tabIndexChanged?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? tabIndexChanged,
    required TResult orElse(),
  }) {
    if (tabIndexChanged != null) {
      return tabIndexChanged(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_TabIndexChanged value) tabIndexChanged,
  }) {
    return tabIndexChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_TabIndexChanged value)? tabIndexChanged,
  }) {
    return tabIndexChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_TabIndexChanged value)? tabIndexChanged,
    required TResult orElse(),
  }) {
    if (tabIndexChanged != null) {
      return tabIndexChanged(this);
    }
    return orElse();
  }
}

abstract class _TabIndexChanged implements TabControlEvent {
  const factory _TabIndexChanged({required final int index}) =
      _$TabIndexChangedImpl;

  int get index;

  /// Create a copy of TabControlEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabIndexChangedImplCopyWith<_$TabIndexChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TabControlState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get tabIndex => throw _privateConstructorUsedError;

  /// Create a copy of TabControlState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TabControlStateCopyWith<TabControlState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TabControlStateCopyWith<$Res> {
  factory $TabControlStateCopyWith(
          TabControlState value, $Res Function(TabControlState) then) =
      _$TabControlStateCopyWithImpl<$Res, TabControlState>;
  @useResult
  $Res call({RequestState state, String message, int tabIndex});
}

/// @nodoc
class _$TabControlStateCopyWithImpl<$Res, $Val extends TabControlState>
    implements $TabControlStateCopyWith<$Res> {
  _$TabControlStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TabControlState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? tabIndex = null,
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
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TabControlStateImplCopyWith<$Res>
    implements $TabControlStateCopyWith<$Res> {
  factory _$$TabControlStateImplCopyWith(_$TabControlStateImpl value,
          $Res Function(_$TabControlStateImpl) then) =
      __$$TabControlStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, int tabIndex});
}

/// @nodoc
class __$$TabControlStateImplCopyWithImpl<$Res>
    extends _$TabControlStateCopyWithImpl<$Res, _$TabControlStateImpl>
    implements _$$TabControlStateImplCopyWith<$Res> {
  __$$TabControlStateImplCopyWithImpl(
      _$TabControlStateImpl _value, $Res Function(_$TabControlStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TabControlState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? tabIndex = null,
  }) {
    return _then(_$TabControlStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      tabIndex: null == tabIndex
          ? _value.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TabControlStateImpl implements _TabControlState {
  const _$TabControlStateImpl(
      {required this.state, required this.message, required this.tabIndex});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final int tabIndex;

  @override
  String toString() {
    return 'TabControlState(state: $state, message: $message, tabIndex: $tabIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabControlStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, tabIndex);

  /// Create a copy of TabControlState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TabControlStateImplCopyWith<_$TabControlStateImpl> get copyWith =>
      __$$TabControlStateImplCopyWithImpl<_$TabControlStateImpl>(
          this, _$identity);
}

abstract class _TabControlState implements TabControlState {
  const factory _TabControlState(
      {required final RequestState state,
      required final String message,
      required final int tabIndex}) = _$TabControlStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  int get tabIndex;

  /// Create a copy of TabControlState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TabControlStateImplCopyWith<_$TabControlStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
