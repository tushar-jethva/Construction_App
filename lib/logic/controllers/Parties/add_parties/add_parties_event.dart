part of 'add_parties_bloc.dart';

@freezed
class AddPartiesEvent with _$AddPartiesEvent {
  //Initialize
  const factory AddPartiesEvent.initialize() = _Initialize;

  //party type
  const factory AddPartiesEvent.onPartyTypeChange(
      {required PartyType partyType}) = _OnPartyTypeChange;
}
