part of 'gst_bloc.dart';

@freezed
class GstState with _$GstState {
  factory GstState({
    required RequestState state,
    required String message,
    required num total,
    required int startYear,
    required int endYear,
    required String? year,
    required GstModel? response,
    required List<OthersTransactionDataModel> listOfGst,
  }) = _GstState;

  factory GstState.initial() => GstState(
      state: RequestState.empty,
      message: '',
      response: null,
      year: null,
      listOfGst: [],
      startYear: DateTime.now().year,
      endYear: DateTime.now().year,
      total: 0);
}
