part of 'financialy_by_party_bloc.dart';

@freezed
class FinancialyByPartyState with _$FinancialyByPartyState {
 const factory FinancialyByPartyState(
      {required RequestState state,
      required FinancialModel financialModel}) = _FinancialyByPartyState;


  factory FinancialyByPartyState.initial() =>  FinancialyByPartyState(
        state: RequestState.empty,
        financialModel:  FinancialModel("0","0",'0','0'),
      );

}
