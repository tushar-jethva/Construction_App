part of 'financial_bloc.dart';

@freezed
class FinancialState with _$FinancialState {
  const factory FinancialState(
      {required RequestState state,
      required FinancialModel financialModel}) = _FinancialState;


  factory FinancialState.initial() =>  FinancialState(
        state: RequestState.empty,
        financialModel:  FinancialModel("0","0",'0','0'),
      );
}
