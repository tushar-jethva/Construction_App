part of 'material_by_partie_bloc.dart';

@freezed
class MaterialByPartieEvent with _$MaterialByPartieEvent {
  const factory MaterialByPartieEvent.started() = _Started;

  //Get materials by partie
  const factory MaterialByPartieEvent.getMaterialByPartie(
      {required String partieId}) = _GetMaterialByPartie;
      
}