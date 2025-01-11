import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'start_and_end_date_event.dart';
part 'start_and_end_date_state.dart';
part 'start_and_end_date_bloc.freezed.dart';

class StartAndEndDateBloc
    extends Bloc<StartAndEndDateEvent, StartAndEndDateState> {
  StartAndEndDateBloc() : super(StartAndEndDateState.initial()) {
    on<StartAndEndDateEvent>((event, emit) {
      event.map(initalize: (_Initialize value) {
        emit(StartAndEndDateState.initial());
      }, onStartDateChanged: (_OnStartDateChanged value) {
        emit(state.copyWith(startDate: value.startDate));
      }, onEndDateChanged: (_OnEndDateChanged value) {
        emit(state.copyWith(endDate: value.endDate));
      });
    });
  }
}
