part of 'rental_by_partie_id_bloc.dart';

@freezed
class RentalByPartieIdEvent with _$RentalByPartieIdEvent {
  const factory RentalByPartieIdEvent.started() = _Started;

  //get rental by partie id
  const factory RentalByPartieIdEvent.getRentalByPartie(
      {required String partieId}) = _GetRentalByPartie;
}
