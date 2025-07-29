import 'package:bloc/bloc.dart';
import 'package:construction_mate/logic/models/tasks/get_task_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'current_task_event.dart';
part 'current_task_state.dart';
part 'current_task_bloc.freezed.dart';

@singleton
class CurrentTaskBloc extends Bloc<CurrentTaskEvent, CurrentTaskState> {
  CurrentTaskBloc() : super(CurrentTaskState.initial()) {
    on<CurrentTaskEvent>((event, emit) {
      event.map(setCurrentTask: (value) {
        emit(CurrentTaskState(task: value.task));
      });
    });
  }
}
