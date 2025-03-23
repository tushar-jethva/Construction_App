// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_partie_project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialPartieProjectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String materialAgency) onChangeMaterialAgency,
    required TResult Function(String projectId) fetchMatrialPartieByProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String materialAgency)? onChangeMaterialAgency,
    TResult? Function(String projectId)? fetchMatrialPartieByProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String materialAgency)? onChangeMaterialAgency,
    TResult Function(String projectId)? fetchMatrialPartieByProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnChangeMaterialAgency value)
        onChangeMaterialAgency,
    required TResult Function(_FetchMatrialPartieByProject value)
        fetchMatrialPartieByProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult? Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPartieProjectEventCopyWith<$Res> {
  factory $MaterialPartieProjectEventCopyWith(MaterialPartieProjectEvent value,
          $Res Function(MaterialPartieProjectEvent) then) =
      _$MaterialPartieProjectEventCopyWithImpl<$Res,
          MaterialPartieProjectEvent>;
}

/// @nodoc
class _$MaterialPartieProjectEventCopyWithImpl<$Res,
        $Val extends MaterialPartieProjectEvent>
    implements $MaterialPartieProjectEventCopyWith<$Res> {
  _$MaterialPartieProjectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialPartieProjectEvent
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
    extends _$MaterialPartieProjectEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialPartieProjectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'MaterialPartieProjectEvent.initialize()';
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
    required TResult Function(String materialAgency) onChangeMaterialAgency,
    required TResult Function(String projectId) fetchMatrialPartieByProject,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String materialAgency)? onChangeMaterialAgency,
    TResult? Function(String projectId)? fetchMatrialPartieByProject,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String materialAgency)? onChangeMaterialAgency,
    TResult Function(String projectId)? fetchMatrialPartieByProject,
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
    required TResult Function(_OnChangeMaterialAgency value)
        onChangeMaterialAgency,
    required TResult Function(_FetchMatrialPartieByProject value)
        fetchMatrialPartieByProject,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult? Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements MaterialPartieProjectEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$OnChangeMaterialAgencyImplCopyWith<$Res> {
  factory _$$OnChangeMaterialAgencyImplCopyWith(
          _$OnChangeMaterialAgencyImpl value,
          $Res Function(_$OnChangeMaterialAgencyImpl) then) =
      __$$OnChangeMaterialAgencyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String materialAgency});
}

/// @nodoc
class __$$OnChangeMaterialAgencyImplCopyWithImpl<$Res>
    extends _$MaterialPartieProjectEventCopyWithImpl<$Res,
        _$OnChangeMaterialAgencyImpl>
    implements _$$OnChangeMaterialAgencyImplCopyWith<$Res> {
  __$$OnChangeMaterialAgencyImplCopyWithImpl(
      _$OnChangeMaterialAgencyImpl _value,
      $Res Function(_$OnChangeMaterialAgencyImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialPartieProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialAgency = null,
  }) {
    return _then(_$OnChangeMaterialAgencyImpl(
      materialAgency: null == materialAgency
          ? _value.materialAgency
          : materialAgency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$OnChangeMaterialAgencyImpl implements _OnChangeMaterialAgency {
  const _$OnChangeMaterialAgencyImpl({required this.materialAgency});

  @override
  final String materialAgency;

  @override
  String toString() {
    return 'MaterialPartieProjectEvent.onChangeMaterialAgency(materialAgency: $materialAgency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeMaterialAgencyImpl &&
            (identical(other.materialAgency, materialAgency) ||
                other.materialAgency == materialAgency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, materialAgency);

  /// Create a copy of MaterialPartieProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeMaterialAgencyImplCopyWith<_$OnChangeMaterialAgencyImpl>
      get copyWith => __$$OnChangeMaterialAgencyImplCopyWithImpl<
          _$OnChangeMaterialAgencyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String materialAgency) onChangeMaterialAgency,
    required TResult Function(String projectId) fetchMatrialPartieByProject,
  }) {
    return onChangeMaterialAgency(materialAgency);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String materialAgency)? onChangeMaterialAgency,
    TResult? Function(String projectId)? fetchMatrialPartieByProject,
  }) {
    return onChangeMaterialAgency?.call(materialAgency);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String materialAgency)? onChangeMaterialAgency,
    TResult Function(String projectId)? fetchMatrialPartieByProject,
    required TResult orElse(),
  }) {
    if (onChangeMaterialAgency != null) {
      return onChangeMaterialAgency(materialAgency);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnChangeMaterialAgency value)
        onChangeMaterialAgency,
    required TResult Function(_FetchMatrialPartieByProject value)
        fetchMatrialPartieByProject,
  }) {
    return onChangeMaterialAgency(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult? Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
  }) {
    return onChangeMaterialAgency?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
    required TResult orElse(),
  }) {
    if (onChangeMaterialAgency != null) {
      return onChangeMaterialAgency(this);
    }
    return orElse();
  }
}

abstract class _OnChangeMaterialAgency implements MaterialPartieProjectEvent {
  const factory _OnChangeMaterialAgency(
      {required final String materialAgency}) = _$OnChangeMaterialAgencyImpl;

  String get materialAgency;

  /// Create a copy of MaterialPartieProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnChangeMaterialAgencyImplCopyWith<_$OnChangeMaterialAgencyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchMatrialPartieByProjectImplCopyWith<$Res> {
  factory _$$FetchMatrialPartieByProjectImplCopyWith(
          _$FetchMatrialPartieByProjectImpl value,
          $Res Function(_$FetchMatrialPartieByProjectImpl) then) =
      __$$FetchMatrialPartieByProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId});
}

/// @nodoc
class __$$FetchMatrialPartieByProjectImplCopyWithImpl<$Res>
    extends _$MaterialPartieProjectEventCopyWithImpl<$Res,
        _$FetchMatrialPartieByProjectImpl>
    implements _$$FetchMatrialPartieByProjectImplCopyWith<$Res> {
  __$$FetchMatrialPartieByProjectImplCopyWithImpl(
      _$FetchMatrialPartieByProjectImpl _value,
      $Res Function(_$FetchMatrialPartieByProjectImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialPartieProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
  }) {
    return _then(_$FetchMatrialPartieByProjectImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchMatrialPartieByProjectImpl
    implements _FetchMatrialPartieByProject {
  const _$FetchMatrialPartieByProjectImpl({required this.projectId});

  @override
  final String projectId;

  @override
  String toString() {
    return 'MaterialPartieProjectEvent.fetchMatrialPartieByProject(projectId: $projectId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMatrialPartieByProjectImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId);

  /// Create a copy of MaterialPartieProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMatrialPartieByProjectImplCopyWith<_$FetchMatrialPartieByProjectImpl>
      get copyWith => __$$FetchMatrialPartieByProjectImplCopyWithImpl<
          _$FetchMatrialPartieByProjectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(String materialAgency) onChangeMaterialAgency,
    required TResult Function(String projectId) fetchMatrialPartieByProject,
  }) {
    return fetchMatrialPartieByProject(projectId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(String materialAgency)? onChangeMaterialAgency,
    TResult? Function(String projectId)? fetchMatrialPartieByProject,
  }) {
    return fetchMatrialPartieByProject?.call(projectId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(String materialAgency)? onChangeMaterialAgency,
    TResult Function(String projectId)? fetchMatrialPartieByProject,
    required TResult orElse(),
  }) {
    if (fetchMatrialPartieByProject != null) {
      return fetchMatrialPartieByProject(projectId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_OnChangeMaterialAgency value)
        onChangeMaterialAgency,
    required TResult Function(_FetchMatrialPartieByProject value)
        fetchMatrialPartieByProject,
  }) {
    return fetchMatrialPartieByProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult? Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
  }) {
    return fetchMatrialPartieByProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_OnChangeMaterialAgency value)? onChangeMaterialAgency,
    TResult Function(_FetchMatrialPartieByProject value)?
        fetchMatrialPartieByProject,
    required TResult orElse(),
  }) {
    if (fetchMatrialPartieByProject != null) {
      return fetchMatrialPartieByProject(this);
    }
    return orElse();
  }
}

abstract class _FetchMatrialPartieByProject
    implements MaterialPartieProjectEvent {
  const factory _FetchMatrialPartieByProject(
      {required final String projectId}) = _$FetchMatrialPartieByProjectImpl;

  String get projectId;

  /// Create a copy of MaterialPartieProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchMatrialPartieByProjectImplCopyWith<_$FetchMatrialPartieByProjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialPartieProjectState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get selectedMaterialAgency => throw _privateConstructorUsedError;
  List<ProjectPartieModel> get listOfMaterialPartie =>
      throw _privateConstructorUsedError;

  /// Create a copy of MaterialPartieProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialPartieProjectStateCopyWith<MaterialPartieProjectState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialPartieProjectStateCopyWith<$Res> {
  factory $MaterialPartieProjectStateCopyWith(MaterialPartieProjectState value,
          $Res Function(MaterialPartieProjectState) then) =
      _$MaterialPartieProjectStateCopyWithImpl<$Res,
          MaterialPartieProjectState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String selectedMaterialAgency,
      List<ProjectPartieModel> listOfMaterialPartie});
}

/// @nodoc
class _$MaterialPartieProjectStateCopyWithImpl<$Res,
        $Val extends MaterialPartieProjectState>
    implements $MaterialPartieProjectStateCopyWith<$Res> {
  _$MaterialPartieProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialPartieProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? selectedMaterialAgency = null,
    Object? listOfMaterialPartie = null,
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
      selectedMaterialAgency: null == selectedMaterialAgency
          ? _value.selectedMaterialAgency
          : selectedMaterialAgency // ignore: cast_nullable_to_non_nullable
              as String,
      listOfMaterialPartie: null == listOfMaterialPartie
          ? _value.listOfMaterialPartie
          : listOfMaterialPartie // ignore: cast_nullable_to_non_nullable
              as List<ProjectPartieModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialPartieProjectStateImplCopyWith<$Res>
    implements $MaterialPartieProjectStateCopyWith<$Res> {
  factory _$$MaterialPartieProjectStateImplCopyWith(
          _$MaterialPartieProjectStateImpl value,
          $Res Function(_$MaterialPartieProjectStateImpl) then) =
      __$$MaterialPartieProjectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String selectedMaterialAgency,
      List<ProjectPartieModel> listOfMaterialPartie});
}

/// @nodoc
class __$$MaterialPartieProjectStateImplCopyWithImpl<$Res>
    extends _$MaterialPartieProjectStateCopyWithImpl<$Res,
        _$MaterialPartieProjectStateImpl>
    implements _$$MaterialPartieProjectStateImplCopyWith<$Res> {
  __$$MaterialPartieProjectStateImplCopyWithImpl(
      _$MaterialPartieProjectStateImpl _value,
      $Res Function(_$MaterialPartieProjectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialPartieProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? selectedMaterialAgency = null,
    Object? listOfMaterialPartie = null,
  }) {
    return _then(_$MaterialPartieProjectStateImpl(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      selectedMaterialAgency: null == selectedMaterialAgency
          ? _value.selectedMaterialAgency
          : selectedMaterialAgency // ignore: cast_nullable_to_non_nullable
              as String,
      listOfMaterialPartie: null == listOfMaterialPartie
          ? _value._listOfMaterialPartie
          : listOfMaterialPartie // ignore: cast_nullable_to_non_nullable
              as List<ProjectPartieModel>,
    ));
  }
}

/// @nodoc

class _$MaterialPartieProjectStateImpl implements _MaterialPartieProjectState {
  const _$MaterialPartieProjectStateImpl(
      {required this.state,
      required this.message,
      required this.selectedMaterialAgency,
      required final List<ProjectPartieModel> listOfMaterialPartie})
      : _listOfMaterialPartie = listOfMaterialPartie;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String selectedMaterialAgency;
  final List<ProjectPartieModel> _listOfMaterialPartie;
  @override
  List<ProjectPartieModel> get listOfMaterialPartie {
    if (_listOfMaterialPartie is EqualUnmodifiableListView)
      return _listOfMaterialPartie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfMaterialPartie);
  }

  @override
  String toString() {
    return 'MaterialPartieProjectState(state: $state, message: $message, selectedMaterialAgency: $selectedMaterialAgency, listOfMaterialPartie: $listOfMaterialPartie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialPartieProjectStateImpl &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.selectedMaterialAgency, selectedMaterialAgency) ||
                other.selectedMaterialAgency == selectedMaterialAgency) &&
            const DeepCollectionEquality()
                .equals(other._listOfMaterialPartie, _listOfMaterialPartie));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      state,
      message,
      selectedMaterialAgency,
      const DeepCollectionEquality().hash(_listOfMaterialPartie));

  /// Create a copy of MaterialPartieProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialPartieProjectStateImplCopyWith<_$MaterialPartieProjectStateImpl>
      get copyWith => __$$MaterialPartieProjectStateImplCopyWithImpl<
          _$MaterialPartieProjectStateImpl>(this, _$identity);
}

abstract class _MaterialPartieProjectState
    implements MaterialPartieProjectState {
  const factory _MaterialPartieProjectState(
          {required final RequestState state,
          required final String message,
          required final String selectedMaterialAgency,
          required final List<ProjectPartieModel> listOfMaterialPartie}) =
      _$MaterialPartieProjectStateImpl;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get selectedMaterialAgency;
  @override
  List<ProjectPartieModel> get listOfMaterialPartie;

  /// Create a copy of MaterialPartieProjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialPartieProjectStateImplCopyWith<_$MaterialPartieProjectStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
