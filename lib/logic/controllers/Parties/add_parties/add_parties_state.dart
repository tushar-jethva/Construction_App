part of 'add_parties_bloc.dart';

@freezed
class AddPartiesState with _$AddPartiesState {
  const factory AddPartiesState(
      {required RequestState state,
      required String message,
      required PartyType partyType}) = _AddPartiesState;
  factory AddPartiesState.initial() => const AddPartiesState(
      state: RequestState.empty, message: '', partyType: PartyType.none);
}
