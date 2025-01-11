part of 'start_and_end_date_bloc.dart';

@freezed
class StartAndEndDateState with _$StartAndEndDateState {
  const factory StartAndEndDateState({
    required DateTime startDate,
    required DateTime endDate,
  }) = _StartAndEndDateState;

  factory StartAndEndDateState.initial() =>
      StartAndEndDateState(startDate: DateTime.now(), endDate: DateTime.now());
}
