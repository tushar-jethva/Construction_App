part of 'building_by_id_bloc.dart';

@freezed
class BuildingByIdState with _$BuildingByIdState {
  const factory BuildingByIdState({
    required RequestState state,
    required String message,
    required ProjectModel? project,
  }) = _BuildingByIdState;
  factory BuildingByIdState.initial() => const BuildingByIdState(
      state: RequestState.empty, message: '', project: null);
}
