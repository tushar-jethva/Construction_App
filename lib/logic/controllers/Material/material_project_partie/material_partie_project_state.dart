part of 'material_partie_project_bloc.dart';

@freezed
class MaterialPartieProjectState with _$MaterialPartieProjectState {
  const factory MaterialPartieProjectState(
      {required RequestState state,
      required String message,
      required String selectedMaterialAgency,
      required int partieIndex,
      required int productIndex,
      required AllMaterialModel? materialData,
      required List<Data> listOfMaterialParty,
      required List<Rentals> listOfMaterialPartySearched,
      required String searchQuery}) = _MaterialPartieProjectState;
  factory MaterialPartieProjectState.initial() =>
      const MaterialPartieProjectState(
          state: RequestState.empty,
          message: '',
          materialData: null,
          selectedMaterialAgency: '',
          listOfMaterialParty: [],
          listOfMaterialPartySearched: [],
          partieIndex: 0,
          productIndex: 0,
          searchQuery: '');
}
