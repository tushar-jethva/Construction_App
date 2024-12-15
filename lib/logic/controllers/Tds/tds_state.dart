part of 'tds_bloc.dart';

@freezed
class TdsState with _$TdsState {
  factory TdsState({
    required RequestState state,
    required String message,
    required num total,
    required int startYear,
    required int endYear,
    required String? year,
    required TdsModel? response,
    required List<OthersTransactionDataModel> listOfTds,
  }) = _TdsState;

  factory TdsState.initial() => TdsState(
      state: RequestState.empty,
      message: '',
      response: null,
      year: null,
      listOfTds: [],
      startYear: DateTime.now().year,
      endYear: DateTime.now().year,
      total: 0);
}
