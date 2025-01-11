// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'date_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DateBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initalize,
    required TResult Function(DateTime dateTime) onDateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initalize,
    TResult? Function(DateTime dateTime)? onDateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initalize,
    TResult Function(DateTime dateTime)? onDateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initalize value) initalize,
    required TResult Function(_OnDateChanged value) onDateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initalize value)? initalize,
    TResult? Function(_OnDateChanged value)? onDateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initalize value)? initalize,
    TResult Function(_OnDateChanged value)? onDateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateBlocEventCopyWith<$Res> {
  factory $DateBlocEventCopyWith(
          DateBlocEvent value, $Res Function(DateBlocEvent) then) =
      _$DateBlocEventCopyWithImpl<$Res, DateBlocEvent>;
}

/// @nodoc
class _$DateBlocEventCopyWithImpl<$Res, $Val extends DateBlocEvent>
    implements $DateBlocEventCopyWith<$Res> {
  _$DateBlocEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitalizeImplCopyWith<$Res> {
  factory _$$InitalizeImplCopyWith(
          _$InitalizeImpl value, $Res Function(_$InitalizeImpl) then) =
      __$$InitalizeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitalizeImplCopyWithImpl<$Res>
    extends _$DateBlocEventCopyWithImpl<$Res, _$InitalizeImpl>
    implements _$$InitalizeImplCopyWith<$Res> {
  __$$InitalizeImplCopyWithImpl(
      _$InitalizeImpl _value, $Res Function(_$InitalizeImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateBlocEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitalizeImpl implements _Initalize {
  const _$InitalizeImpl();

  @override
  String toString() {
    return 'DateBlocEvent.initalize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitalizeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initalize,
    required TResult Function(DateTime dateTime) onDateChanged,
  }) {
    return initalize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initalize,
    TResult? Function(DateTime dateTime)? onDateChanged,
  }) {
    return initalize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initalize,
    TResult Function(DateTime dateTime)? onDateChanged,
    required TResult orElse(),
  }) {
    if (initalize != null) {
      return initalize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initalize value) initalize,
    required TResult Function(_OnDateChanged value) onDateChanged,
  }) {
    return initalize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initalize value)? initalize,
    TResult? Function(_OnDateChanged value)? onDateChanged,
  }) {
    return initalize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initalize value)? initalize,
    TResult Function(_OnDateChanged value)? onDateChanged,
    required TResult orElse(),
  }) {
    if (initalize != null) {
      return initalize(this);
    }
    return orElse();
  }
}

abstract class _Initalize implements DateBlocEvent {
  const factory _Initalize() = _$InitalizeImpl;
}

/// @nodoc
abstract class _$$OnDateChangedImplCopyWith<$Res> {
  factory _$$OnDateChangedImplCopyWith(
          _$OnDateChangedImpl value, $Res Function(_$OnDateChangedImpl) then) =
      __$$OnDateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime dateTime});
}

/// @nodoc
class __$$OnDateChangedImplCopyWithImpl<$Res>
    extends _$DateBlocEventCopyWithImpl<$Res, _$OnDateChangedImpl>
    implements _$$OnDateChangedImplCopyWith<$Res> {
  __$$OnDateChangedImplCopyWithImpl(
      _$OnDateChangedImpl _value, $Res Function(_$OnDateChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
  }) {
    return _then(_$OnDateChangedImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$OnDateChangedImpl implements _OnDateChanged {
  const _$OnDateChangedImpl({required this.dateTime});

  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'DateBlocEvent.onDateChanged(dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDateChangedImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  /// Create a copy of DateBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDateChangedImplCopyWith<_$OnDateChangedImpl> get copyWith =>
      __$$OnDateChangedImplCopyWithImpl<_$OnDateChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initalize,
    required TResult Function(DateTime dateTime) onDateChanged,
  }) {
    return onDateChanged(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initalize,
    TResult? Function(DateTime dateTime)? onDateChanged,
  }) {
    return onDateChanged?.call(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initalize,
    TResult Function(DateTime dateTime)? onDateChanged,
    required TResult orElse(),
  }) {
    if (onDateChanged != null) {
      return onDateChanged(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initalize value) initalize,
    required TResult Function(_OnDateChanged value) onDateChanged,
  }) {
    return onDateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initalize value)? initalize,
    TResult? Function(_OnDateChanged value)? onDateChanged,
  }) {
    return onDateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initalize value)? initalize,
    TResult Function(_OnDateChanged value)? onDateChanged,
    required TResult orElse(),
  }) {
    if (onDateChanged != null) {
      return onDateChanged(this);
    }
    return orElse();
  }
}

abstract class _OnDateChanged implements DateBlocEvent {
  const factory _OnDateChanged({required final DateTime dateTime}) =
      _$OnDateChangedImpl;

  DateTime get dateTime;

  /// Create a copy of DateBlocEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnDateChangedImplCopyWith<_$OnDateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DateBlocState {
  DateTime get selectedDate => throw _privateConstructorUsedError;

  /// Create a copy of DateBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DateBlocStateCopyWith<DateBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateBlocStateCopyWith<$Res> {
  factory $DateBlocStateCopyWith(
          DateBlocState value, $Res Function(DateBlocState) then) =
      _$DateBlocStateCopyWithImpl<$Res, DateBlocState>;
  @useResult
  $Res call({DateTime selectedDate});
}

/// @nodoc
class _$DateBlocStateCopyWithImpl<$Res, $Val extends DateBlocState>
    implements $DateBlocStateCopyWith<$Res> {
  _$DateBlocStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DateBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
  }) {
    return _then(_value.copyWith(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DateBlocStateImplCopyWith<$Res>
    implements $DateBlocStateCopyWith<$Res> {
  factory _$$DateBlocStateImplCopyWith(
          _$DateBlocStateImpl value, $Res Function(_$DateBlocStateImpl) then) =
      __$$DateBlocStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime selectedDate});
}

/// @nodoc
class __$$DateBlocStateImplCopyWithImpl<$Res>
    extends _$DateBlocStateCopyWithImpl<$Res, _$DateBlocStateImpl>
    implements _$$DateBlocStateImplCopyWith<$Res> {
  __$$DateBlocStateImplCopyWithImpl(
      _$DateBlocStateImpl _value, $Res Function(_$DateBlocStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DateBlocState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = null,
  }) {
    return _then(_$DateBlocStateImpl(
      selectedDate: null == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DateBlocStateImpl implements _DateBlocState {
  const _$DateBlocStateImpl({required this.selectedDate});

  @override
  final DateTime selectedDate;

  @override
  String toString() {
    return 'DateBlocState(selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DateBlocStateImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate);

  /// Create a copy of DateBlocState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DateBlocStateImplCopyWith<_$DateBlocStateImpl> get copyWith =>
      __$$DateBlocStateImplCopyWithImpl<_$DateBlocStateImpl>(this, _$identity);
}

abstract class _DateBlocState implements DateBlocState {
  const factory _DateBlocState({required final DateTime selectedDate}) =
      _$DateBlocStateImpl;

  @override
  DateTime get selectedDate;

  /// Create a copy of DateBlocState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DateBlocStateImplCopyWith<_$DateBlocStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
