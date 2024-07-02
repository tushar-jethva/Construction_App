part of 'date_bloc_bloc.dart';

sealed class DateBlocEvent {}

class DateChanged extends DateBlocEvent{
  final DateTime dateTime;
  DateChanged({required this.dateTime});
}

class DateDetailsStartChanged extends DateBlocEvent{
  final DateTime startDate;

  DateDetailsStartChanged({required this.startDate});
}

class DateDetailsEndChanged extends DateBlocEvent{
  final DateTime endDate;

  DateDetailsEndChanged({required this.endDate});
}
