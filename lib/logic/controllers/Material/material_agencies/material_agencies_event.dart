part of 'material_agencies_bloc.dart';

@freezed
class MaterialAgenciesEvent with _$MaterialAgenciesEvent {
  //Initialize
  const factory MaterialAgenciesEvent.initialize() = _Initialize;

  //Selected agenc
  const factory MaterialAgenciesEvent.onChangeMaterialAgency(
      {required String materialAgency}) = _OnChangeMaterialAgency;

  //fetch all material agencies
  const factory MaterialAgenciesEvent.fetchMaterialAgencies() =
      _FetchMaterialAgencies;


}
