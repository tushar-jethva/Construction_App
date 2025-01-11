part of 'start_and_end_date_bloc.dart';

@freezed
class StartAndEndDateEvent with _$StartAndEndDateEvent {
  //Initial
  const factory StartAndEndDateEvent.initalize() = _Initialize;

  //On start changed
  const factory StartAndEndDateEvent.onStartDateChanged(
      {required DateTime startDate}) = _OnStartDateChanged;

  //On end changed
  const factory StartAndEndDateEvent.onEndDateChanged(
      {required DateTime endDate}) = _OnEndDateChanged;
}


