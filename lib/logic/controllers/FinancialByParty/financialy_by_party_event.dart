part of 'financialy_by_party_bloc.dart';

@freezed
sealed class FinancialyByPartyEvent with _$FinancialyByPartyEvent {
  const factory FinancialyByPartyEvent.fetchFinancialsByParty({required String partyId}) =
      _FetchFinancialByParty;
}
