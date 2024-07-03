import 'package:bloc/bloc.dart';
part 'date_bloc_event.dart';
part 'date_bloc_state.dart';

class DateBlocBloc extends Bloc<DateBlocEvent, DateBlocState> {
  DateBlocBloc() : super(DateBlocState(selectedDate: DateTime.now())) {
    on<DateChanged>((event, emit) {   
      emit(DateBlocState(selectedDate: event.dateTime));
    });

  }
}
