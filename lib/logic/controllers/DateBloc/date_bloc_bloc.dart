
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'date_bloc_event.dart';
part 'date_bloc_state.dart';
part 'date_bloc_bloc.freezed.dart';

class DateBlocBloc extends Bloc<DateBlocEvent, DateBlocState> {
  DateBlocBloc() : super(DateBlocState.initial()) {
    on<DateBlocEvent>((event, emit) {
      event.map(initalize: (_Initalize value) {
        emit(DateBlocState.initial());
      }, onDateChanged: (_OnDateChanged value) {
        emit(state.copyWith(selectedDate: value.dateTime));
      });
    });
  }
}
