part of 'material_agencies_bloc.dart';

@freezed
class MaterialAgenciesState with _$MaterialAgenciesState {
  const factory MaterialAgenciesState({
    required RequestState state,
    required String message,
    required List<AgencyModel> listOfMaterialAgencies,
    required String selectedMaterialAgency,
  }) = _MaterialAgenciesState;
  factory MaterialAgenciesState.initial() => const MaterialAgenciesState(
      state: RequestState.empty, message: '', listOfMaterialAgencies: [], selectedMaterialAgency: '');
}
