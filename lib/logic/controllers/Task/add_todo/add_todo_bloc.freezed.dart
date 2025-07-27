// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddTodoEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String name) nameChanged,
    required TResult Function(AgencyModel assignee) assigneesChanged,
    required TResult Function(String assigneeId) removeAssignee,
    required TResult Function(String taskId) createTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String name)? nameChanged,
    TResult? Function(AgencyModel assignee)? assigneesChanged,
    TResult? Function(String assigneeId)? removeAssignee,
    TResult? Function(String taskId)? createTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String name)? nameChanged,
    TResult Function(AgencyModel assignee)? assigneesChanged,
    TResult Function(String assigneeId)? removeAssignee,
    TResult Function(String taskId)? createTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_AssigneesChanged value) assigneesChanged,
    required TResult Function(_RemoveAssignee value) removeAssignee,
    required TResult Function(_CreateTodo value) createTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_AssigneesChanged value)? assigneesChanged,
    TResult? Function(_RemoveAssignee value)? removeAssignee,
    TResult? Function(_CreateTodo value)? createTodo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_AssigneesChanged value)? assigneesChanged,
    TResult Function(_RemoveAssignee value)? removeAssignee,
    TResult Function(_CreateTodo value)? createTodo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoEventCopyWith<$Res> {
  factory $AddTodoEventCopyWith(
          AddTodoEvent value, $Res Function(AddTodoEvent) then) =
      _$AddTodoEventCopyWithImpl<$Res, AddTodoEvent>;
}

/// @nodoc
class _$AddTodoEventCopyWithImpl<$Res, $Val extends AddTodoEvent>
    implements $AddTodoEventCopyWith<$Res> {
  _$AddTodoEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddTodoEvent
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
    extends _$AddTodoEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'AddTodoEvent.initialize()';
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
    required TResult Function(String name) nameChanged,
    required TResult Function(AgencyModel assignee) assigneesChanged,
    required TResult Function(String assigneeId) removeAssignee,
    required TResult Function(String taskId) createTodo,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String name)? nameChanged,
    TResult? Function(AgencyModel assignee)? assigneesChanged,
    TResult? Function(String assigneeId)? removeAssignee,
    TResult? Function(String taskId)? createTodo,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String name)? nameChanged,
    TResult Function(AgencyModel assignee)? assigneesChanged,
    TResult Function(String assigneeId)? removeAssignee,
    TResult Function(String taskId)? createTodo,
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
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_AssigneesChanged value) assigneesChanged,
    required TResult Function(_RemoveAssignee value) removeAssignee,
    required TResult Function(_CreateTodo value) createTodo,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_AssigneesChanged value)? assigneesChanged,
    TResult? Function(_RemoveAssignee value)? removeAssignee,
    TResult? Function(_CreateTodo value)? createTodo,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_AssigneesChanged value)? assigneesChanged,
    TResult Function(_RemoveAssignee value)? removeAssignee,
    TResult Function(_CreateTodo value)? createTodo,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements AddTodoEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$NameChangedImplCopyWith<$Res> {
  factory _$$NameChangedImplCopyWith(
          _$NameChangedImpl value, $Res Function(_$NameChangedImpl) then) =
      __$$NameChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$NameChangedImplCopyWithImpl<$Res>
    extends _$AddTodoEventCopyWithImpl<$Res, _$NameChangedImpl>
    implements _$$NameChangedImplCopyWith<$Res> {
  __$$NameChangedImplCopyWithImpl(
      _$NameChangedImpl _value, $Res Function(_$NameChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$NameChangedImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameChangedImpl implements _NameChanged {
  const _$NameChangedImpl({required this.name});

  @override
  final String name;

  @override
  String toString() {
    return 'AddTodoEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NameChangedImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NameChangedImplCopyWith<_$NameChangedImpl> get copyWith =>
      __$$NameChangedImplCopyWithImpl<_$NameChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String name) nameChanged,
    required TResult Function(AgencyModel assignee) assigneesChanged,
    required TResult Function(String assigneeId) removeAssignee,
    required TResult Function(String taskId) createTodo,
  }) {
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String name)? nameChanged,
    TResult? Function(AgencyModel assignee)? assigneesChanged,
    TResult? Function(String assigneeId)? removeAssignee,
    TResult? Function(String taskId)? createTodo,
  }) {
    return nameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String name)? nameChanged,
    TResult Function(AgencyModel assignee)? assigneesChanged,
    TResult Function(String assigneeId)? removeAssignee,
    TResult Function(String taskId)? createTodo,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_AssigneesChanged value) assigneesChanged,
    required TResult Function(_RemoveAssignee value) removeAssignee,
    required TResult Function(_CreateTodo value) createTodo,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_AssigneesChanged value)? assigneesChanged,
    TResult? Function(_RemoveAssignee value)? removeAssignee,
    TResult? Function(_CreateTodo value)? createTodo,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_AssigneesChanged value)? assigneesChanged,
    TResult Function(_RemoveAssignee value)? removeAssignee,
    TResult Function(_CreateTodo value)? createTodo,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements AddTodoEvent {
  const factory _NameChanged({required final String name}) = _$NameChangedImpl;

  String get name;

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NameChangedImplCopyWith<_$NameChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssigneesChangedImplCopyWith<$Res> {
  factory _$$AssigneesChangedImplCopyWith(_$AssigneesChangedImpl value,
          $Res Function(_$AssigneesChangedImpl) then) =
      __$$AssigneesChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AgencyModel assignee});
}

/// @nodoc
class __$$AssigneesChangedImplCopyWithImpl<$Res>
    extends _$AddTodoEventCopyWithImpl<$Res, _$AssigneesChangedImpl>
    implements _$$AssigneesChangedImplCopyWith<$Res> {
  __$$AssigneesChangedImplCopyWithImpl(_$AssigneesChangedImpl _value,
      $Res Function(_$AssigneesChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignee = null,
  }) {
    return _then(_$AssigneesChangedImpl(
      assignee: null == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as AgencyModel,
    ));
  }
}

/// @nodoc

class _$AssigneesChangedImpl implements _AssigneesChanged {
  const _$AssigneesChangedImpl({required this.assignee});

  @override
  final AgencyModel assignee;

  @override
  String toString() {
    return 'AddTodoEvent.assigneesChanged(assignee: $assignee)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssigneesChangedImpl &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assignee);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssigneesChangedImplCopyWith<_$AssigneesChangedImpl> get copyWith =>
      __$$AssigneesChangedImplCopyWithImpl<_$AssigneesChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String name) nameChanged,
    required TResult Function(AgencyModel assignee) assigneesChanged,
    required TResult Function(String assigneeId) removeAssignee,
    required TResult Function(String taskId) createTodo,
  }) {
    return assigneesChanged(assignee);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String name)? nameChanged,
    TResult? Function(AgencyModel assignee)? assigneesChanged,
    TResult? Function(String assigneeId)? removeAssignee,
    TResult? Function(String taskId)? createTodo,
  }) {
    return assigneesChanged?.call(assignee);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String name)? nameChanged,
    TResult Function(AgencyModel assignee)? assigneesChanged,
    TResult Function(String assigneeId)? removeAssignee,
    TResult Function(String taskId)? createTodo,
    required TResult orElse(),
  }) {
    if (assigneesChanged != null) {
      return assigneesChanged(assignee);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_AssigneesChanged value) assigneesChanged,
    required TResult Function(_RemoveAssignee value) removeAssignee,
    required TResult Function(_CreateTodo value) createTodo,
  }) {
    return assigneesChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_AssigneesChanged value)? assigneesChanged,
    TResult? Function(_RemoveAssignee value)? removeAssignee,
    TResult? Function(_CreateTodo value)? createTodo,
  }) {
    return assigneesChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_AssigneesChanged value)? assigneesChanged,
    TResult Function(_RemoveAssignee value)? removeAssignee,
    TResult Function(_CreateTodo value)? createTodo,
    required TResult orElse(),
  }) {
    if (assigneesChanged != null) {
      return assigneesChanged(this);
    }
    return orElse();
  }
}

abstract class _AssigneesChanged implements AddTodoEvent {
  const factory _AssigneesChanged({required final AgencyModel assignee}) =
      _$AssigneesChangedImpl;

  AgencyModel get assignee;

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssigneesChangedImplCopyWith<_$AssigneesChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveAssigneeImplCopyWith<$Res> {
  factory _$$RemoveAssigneeImplCopyWith(_$RemoveAssigneeImpl value,
          $Res Function(_$RemoveAssigneeImpl) then) =
      __$$RemoveAssigneeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String assigneeId});
}

/// @nodoc
class __$$RemoveAssigneeImplCopyWithImpl<$Res>
    extends _$AddTodoEventCopyWithImpl<$Res, _$RemoveAssigneeImpl>
    implements _$$RemoveAssigneeImplCopyWith<$Res> {
  __$$RemoveAssigneeImplCopyWithImpl(
      _$RemoveAssigneeImpl _value, $Res Function(_$RemoveAssigneeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assigneeId = null,
  }) {
    return _then(_$RemoveAssigneeImpl(
      assigneeId: null == assigneeId
          ? _value.assigneeId
          : assigneeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveAssigneeImpl implements _RemoveAssignee {
  const _$RemoveAssigneeImpl({required this.assigneeId});

  @override
  final String assigneeId;

  @override
  String toString() {
    return 'AddTodoEvent.removeAssignee(assigneeId: $assigneeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveAssigneeImpl &&
            (identical(other.assigneeId, assigneeId) ||
                other.assigneeId == assigneeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assigneeId);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveAssigneeImplCopyWith<_$RemoveAssigneeImpl> get copyWith =>
      __$$RemoveAssigneeImplCopyWithImpl<_$RemoveAssigneeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String name) nameChanged,
    required TResult Function(AgencyModel assignee) assigneesChanged,
    required TResult Function(String assigneeId) removeAssignee,
    required TResult Function(String taskId) createTodo,
  }) {
    return removeAssignee(assigneeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String name)? nameChanged,
    TResult? Function(AgencyModel assignee)? assigneesChanged,
    TResult? Function(String assigneeId)? removeAssignee,
    TResult? Function(String taskId)? createTodo,
  }) {
    return removeAssignee?.call(assigneeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String name)? nameChanged,
    TResult Function(AgencyModel assignee)? assigneesChanged,
    TResult Function(String assigneeId)? removeAssignee,
    TResult Function(String taskId)? createTodo,
    required TResult orElse(),
  }) {
    if (removeAssignee != null) {
      return removeAssignee(assigneeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_AssigneesChanged value) assigneesChanged,
    required TResult Function(_RemoveAssignee value) removeAssignee,
    required TResult Function(_CreateTodo value) createTodo,
  }) {
    return removeAssignee(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_AssigneesChanged value)? assigneesChanged,
    TResult? Function(_RemoveAssignee value)? removeAssignee,
    TResult? Function(_CreateTodo value)? createTodo,
  }) {
    return removeAssignee?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_AssigneesChanged value)? assigneesChanged,
    TResult Function(_RemoveAssignee value)? removeAssignee,
    TResult Function(_CreateTodo value)? createTodo,
    required TResult orElse(),
  }) {
    if (removeAssignee != null) {
      return removeAssignee(this);
    }
    return orElse();
  }
}

abstract class _RemoveAssignee implements AddTodoEvent {
  const factory _RemoveAssignee({required final String assigneeId}) =
      _$RemoveAssigneeImpl;

  String get assigneeId;

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveAssigneeImplCopyWith<_$RemoveAssigneeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateTodoImplCopyWith<$Res> {
  factory _$$CreateTodoImplCopyWith(
          _$CreateTodoImpl value, $Res Function(_$CreateTodoImpl) then) =
      __$$CreateTodoImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class __$$CreateTodoImplCopyWithImpl<$Res>
    extends _$AddTodoEventCopyWithImpl<$Res, _$CreateTodoImpl>
    implements _$$CreateTodoImplCopyWith<$Res> {
  __$$CreateTodoImplCopyWithImpl(
      _$CreateTodoImpl _value, $Res Function(_$CreateTodoImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taskId = null,
  }) {
    return _then(_$CreateTodoImpl(
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateTodoImpl implements _CreateTodo {
  const _$CreateTodoImpl({required this.taskId});

  @override
  final String taskId;

  @override
  String toString() {
    return 'AddTodoEvent.createTodo(taskId: $taskId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateTodoImpl &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateTodoImplCopyWith<_$CreateTodoImpl> get copyWith =>
      __$$CreateTodoImplCopyWithImpl<_$CreateTodoImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String name) nameChanged,
    required TResult Function(AgencyModel assignee) assigneesChanged,
    required TResult Function(String assigneeId) removeAssignee,
    required TResult Function(String taskId) createTodo,
  }) {
    return createTodo(taskId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String name)? nameChanged,
    TResult? Function(AgencyModel assignee)? assigneesChanged,
    TResult? Function(String assigneeId)? removeAssignee,
    TResult? Function(String taskId)? createTodo,
  }) {
    return createTodo?.call(taskId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String name)? nameChanged,
    TResult Function(AgencyModel assignee)? assigneesChanged,
    TResult Function(String assigneeId)? removeAssignee,
    TResult Function(String taskId)? createTodo,
    required TResult orElse(),
  }) {
    if (createTodo != null) {
      return createTodo(taskId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_AssigneesChanged value) assigneesChanged,
    required TResult Function(_RemoveAssignee value) removeAssignee,
    required TResult Function(_CreateTodo value) createTodo,
  }) {
    return createTodo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_AssigneesChanged value)? assigneesChanged,
    TResult? Function(_RemoveAssignee value)? removeAssignee,
    TResult? Function(_CreateTodo value)? createTodo,
  }) {
    return createTodo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_AssigneesChanged value)? assigneesChanged,
    TResult Function(_RemoveAssignee value)? removeAssignee,
    TResult Function(_CreateTodo value)? createTodo,
    required TResult orElse(),
  }) {
    if (createTodo != null) {
      return createTodo(this);
    }
    return orElse();
  }
}

abstract class _CreateTodo implements AddTodoEvent {
  const factory _CreateTodo({required final String taskId}) = _$CreateTodoImpl;

  String get taskId;

  /// Create a copy of AddTodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateTodoImplCopyWith<_$CreateTodoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddTodoState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<AgencyModel> get assignees => throw _privateConstructorUsedError;

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddTodoStateCopyWith<AddTodoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddTodoStateCopyWith<$Res> {
  factory $AddTodoStateCopyWith(
          AddTodoState value, $Res Function(AddTodoState) then) =
      _$AddTodoStateCopyWithImpl<$Res, AddTodoState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String name,
      List<AgencyModel> assignees});
}

/// @nodoc
class _$AddTodoStateCopyWithImpl<$Res, $Val extends AddTodoState>
    implements $AddTodoStateCopyWith<$Res> {
  _$AddTodoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? name = null,
    Object? assignees = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assignees: null == assignees
          ? _value.assignees
          : assignees // ignore: cast_nullable_to_non_nullable
              as List<AgencyModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddTodoStateImplCopyWith<$Res>
    implements $AddTodoStateCopyWith<$Res> {
  factory _$$AddTodoStateImplCopyWith(
          _$AddTodoStateImpl value, $Res Function(_$AddTodoStateImpl) then) =
      __$$AddTodoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String name,
      List<AgencyModel> assignees});
}

/// @nodoc
class __$$AddTodoStateImplCopyWithImpl<$Res>
    extends _$AddTodoStateCopyWithImpl<$Res, _$AddTodoStateImpl>
    implements _$$AddTodoStateImplCopyWith<$Res> {
  __$$AddTodoStateImplCopyWithImpl(
      _$AddTodoStateImpl _value, $Res Function(_$AddTodoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? name = null,
    Object? assignees = null,
  }) {
    return _then(_$AddTodoStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      assignees: null == assignees
          ? _value._assignees
          : assignees // ignore: cast_nullable_to_non_nullable
              as List<AgencyModel>,
    ));
  }
}

/// @nodoc

class _$AddTodoStateImpl implements _AddTodoState {
  const _$AddTodoStateImpl(
      {required this.state,
      required this.message,
      required this.name,
      required final List<AgencyModel> assignees})
      : _assignees = assignees;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String name;
  final List<AgencyModel> _assignees;
  @override
  List<AgencyModel> get assignees {
    if (_assignees is EqualUnmodifiableListView) return _assignees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignees);
  }

  @override
  String toString() {
    return 'AddTodoState(state: $state, message: $message, name: $name, assignees: $assignees)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddTodoStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._assignees, _assignees));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, name,
      const DeepCollectionEquality().hash(_assignees));

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddTodoStateImplCopyWith<_$AddTodoStateImpl> get copyWith =>
      __$$AddTodoStateImplCopyWithImpl<_$AddTodoStateImpl>(this, _$identity);
}

abstract class _AddTodoState implements AddTodoState {
  const factory _AddTodoState(
      {required final RequestState state,
      required final String message,
      required final String name,
      required final List<AgencyModel> assignees}) = _$AddTodoStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get name;
  @override
  List<AgencyModel> get assignees;

  /// Create a copy of AddTodoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddTodoStateImplCopyWith<_$AddTodoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
