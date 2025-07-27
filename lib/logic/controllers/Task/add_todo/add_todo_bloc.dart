import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/tasks/create_to_do_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_todo_event.dart';
part 'add_todo_state.dart';
part 'add_todo_bloc.freezed.dart';

@singleton
class AddTodoBloc extends Bloc<AddTodoEvent, AddTodoState> {
  AddTodoBloc(this.taskUsecase) : super(AddTodoState.initial()) {
    on<AddTodoEvent>((event, emit) async {
      await event.map(initialize: (_Initialize value) {
        emit(AddTodoState.initial());
      }, nameChanged: (_NameChanged value) {
        emit(state.copyWith(state: RequestState.empty, name: value.name));
      }, assigneesChanged: (_AssigneesChanged value) {
        final updateAssigneeList = List<AgencyModel>.from(state.assignees);

        final alreadyExists = updateAssigneeList
            .any((existing) => existing.sId == value.assignee.sId);
        if (!alreadyExists) {
          updateAssigneeList.add(value.assignee);
        }

        emit(state.copyWith(
          state: RequestState.empty,
          assignees: updateAssigneeList,
        ));
      }, removeAssignee: (_RemoveAssignee value) {
        final updateAssigneeList = List<AgencyModel>.from(state.assignees);
        updateAssigneeList.removeWhere((m) => m.sId == value.assigneeId);
        emit(state.copyWith(
          state: RequestState.empty,
          assignees: updateAssigneeList,
        ));
      }, createTodo: (_CreateTodo value) async {
        emit(state.copyWith(state: RequestState.loading));

        final CreateToDoModel todo = CreateToDoModel(
            assignees: state.assignees.map((a) => a.sId ?? '').toList(),
            name: state.name);
        final res = await taskUsecase.addTodo(todo: todo, taskId: value.taskId);
        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          emit(state.copyWith(state: RequestState.loaded, message: r));
        });
      });
    });
  }

  final TaskUsecase taskUsecase;
}
