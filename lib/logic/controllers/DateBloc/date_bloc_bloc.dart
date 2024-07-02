import 'package:bloc/bloc.dart';
part 'date_bloc_event.dart';
part 'date_bloc_state.dart';

class DateBlocBloc extends Bloc<DateBlocEvent, DateBlocState> {
  DateBlocBloc() : super(DateBlocInitial()) {
    on<DateChanged>((event, emit) {
      emit(DateBlocChangedDateState(selectedDate: event.dateTime));
    });
  }
}
