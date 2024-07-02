part of 'date_bloc_bloc.dart';

sealed class DateBlocState {}

final class DateBlocInitial extends DateBlocState {}

class DateBlocChangedDateState extends DateBlocState {
  final DateTime selectedDate;

  DateBlocChangedDateState({required this.selectedDate});
}

class DateBlocDetailsStartState extends DateBlocState {
  final DateTime startDate;

  DateBlocDetailsStartState(this.startDate);
}

class DateBlocDetailsEndState extends DateBlocState {
  final DateTime endDate;

  DateBlocDetailsEndState(this.endDate);
}
