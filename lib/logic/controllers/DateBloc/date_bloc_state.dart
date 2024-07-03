part of 'date_bloc_bloc.dart';

sealed class DateBlocState {}

final class DateBlocInitial extends DateBlocState {}

class DateBlocChangedDateState extends DateBlocState {
  final DateTime selectedDate;

  DateBlocChangedDateState({required this.selectedDate});
}

