part of 'date_bloc_bloc.dart';

sealed class DateBlocEvent {}

class DateChanged extends DateBlocEvent{
  final DateTime dateTime;
  DateChanged({required this.dateTime});
}

class DateInitial extends DateBlocEvent{}


