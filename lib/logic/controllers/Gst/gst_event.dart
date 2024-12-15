part of 'gst_bloc.dart';

@freezed
class GstEvent with _$GstEvent {
//initialize
  const factory GstEvent.initialize() = _Initialize;

  //Year
  const factory GstEvent.onFilterYearChanged({String? year}) =
      _OnFilterYearChanged;

  //Get tds
  const factory GstEvent.fetchGst() = _fetchGst;
}