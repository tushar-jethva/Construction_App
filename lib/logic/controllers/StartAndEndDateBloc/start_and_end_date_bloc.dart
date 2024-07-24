import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_and_end_date_event.dart';
part 'start_and_end_date_state.dart';

class StartAndEndDateBloc
    extends Bloc<StartAndEndDateEvent, StartAndEndDateState> {
  StartAndEndDateBloc()
      : super(StartAndEndDateState(
            startDate: DateTime.now(), endDate: DateTime.now())) {
    on<DateInitial>((event, emit) {
      emit(StartAndEndDateState(
          startDate: DateTime.now(), endDate: DateTime.now()));
    });

    on<DateDetailsStartChanged>((event, emit) {
      emit(StartAndEndDateState(
          startDate: event.startDate, endDate: state.endDate));
    });

    on<DateDetailsEndChanged>((event, emit) {
      print(" enddate ${event.endDate}");
      emit(StartAndEndDateState(
          startDate: state.startDate, endDate: event.endDate));
    });
  }
}
