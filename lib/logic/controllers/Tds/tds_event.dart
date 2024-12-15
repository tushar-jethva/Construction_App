part of 'tds_bloc.dart';

@freezed
class TdsEvent with _$TdsEvent {
  //initialize
  const factory TdsEvent.initialize() = _Initialize;

  //Year
  const factory TdsEvent.onFilterYearChanged({String? year}) =
      _OnFilterYearChanged;

  //Get tds
  const factory TdsEvent.fetchTds() = _fetchTds;
}
