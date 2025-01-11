part of 'date_bloc_bloc.dart';

@freezed
class DateBlocState with _$DateBlocState {
  const factory DateBlocState({required DateTime selectedDate}) =
      _DateBlocState;

  factory DateBlocState.initial() =>
      DateBlocState(selectedDate: DateTime.now());
}
