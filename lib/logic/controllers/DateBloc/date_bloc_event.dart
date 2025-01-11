part of 'date_bloc_bloc.dart';

@freezed
class DateBlocEvent with _$DateBlocEvent {
  //Initial
  const factory DateBlocEvent.initalize() = _Initalize;

  //On date changend
  const factory DateBlocEvent.onDateChanged({required DateTime dateTime}) =
      _OnDateChanged;
}


