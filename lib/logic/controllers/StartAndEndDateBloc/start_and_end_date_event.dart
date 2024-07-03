part of 'start_and_end_date_bloc.dart';

@immutable
sealed class StartAndEndDateEvent {}

class DateInitial extends StartAndEndDateEvent{}

class DateDetailsStartChanged extends StartAndEndDateEvent{
  final DateTime startDate;
  DateDetailsStartChanged({required this.startDate});
}

class DateDetailsEndChanged extends StartAndEndDateEvent{
  final DateTime endDate;

  DateDetailsEndChanged({required this.endDate});
}
