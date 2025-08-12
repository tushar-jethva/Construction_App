import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/usecases/task_usecase.dart';
import 'package:construction_mate/logic/controllers/Building-by-id/building_by_id_bloc.dart';
import 'package:construction_mate/logic/models/agency_model.dart';
import 'package:construction_mate/logic/models/tasks/create_task_model.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';
part 'add_task_bloc.freezed.dart';

@singleton
class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  AddTaskBloc(this.taskUsecase, this.buildingByIdBloc)
      : super(AddTaskState.initial()) {
    on<AddTaskEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(AddTaskState.initial());
        },
        taskNameChanged: (_TaskNameChanged value) {
          emit(state.copyWith(
            state: RequestState.empty,
            taskName: value.taskName,
          ));
        },
        durationChanged: (_DurationChanged value) {
          emit(state.copyWith(
            state: RequestState.empty,
            duration: value.duration,
          ));
        },
        progressUnitChanged: (_ProgressUnitChanged value) {
          emit(state.copyWith(
            state: RequestState.empty,
            progressUnit: value.progressUnit,
            estQuantity: value.progressUnit == "%" ? '100' : state.progressUnit,
          ));
        },
        estQuantityChanged: (_EstQuantityChanged value) {
          emit(state.copyWith(
            state: RequestState.empty,
            estQuantity: value.estQuantity,
          ));
        },
        startDateChanged: (_StartDateChanged value) {
          emit(state.copyWith(
            state: RequestState.empty,
            startDate: value.startDate,
          ));
        },
        endDateChanged: (_EndDateChanged value) {
          emit(state.copyWith(
            state: RequestState.empty,
            endDate: value.endDate,
          ));
        },
        assigneesChanged: (_AssigneesChanged value) {
          final updateAssigneeList = List<AgencyModel>.from(state.assignees);

          for (var newAssignee in value.assignees) {
            final alreadyExists = updateAssigneeList
                .any((existing) => existing.sId == newAssignee.sId);
            if (!alreadyExists) {
              updateAssigneeList.add(newAssignee);
            }
          }

          emit(state.copyWith(
            state: RequestState.empty,
            assignees: updateAssigneeList,
          ));
        },
        removeAssignee: (_RemoveAssignee value) {
          final updateAssigneeList = List<AgencyModel>.from(state.assignees);
          updateAssigneeList.removeWhere((m) => m.sId == value.assigneeId);
          emit(state.copyWith(
            state: RequestState.empty,
            assignees: updateAssigneeList,
          ));
        },
        addTask: (_AddTask value) async {
          emit(state.copyWith(state: RequestState.loading));

          CreateTaskModel task = CreateTaskModel(
            projectId: buildingByIdBloc.state.project?.sId ?? '',
            taskName: state.taskName,
            duration: state.duration,
            startDate: state.startDate.toString(),
            progressUnit: state.progressUnit,
            estQuanitity: state.estQuantity,
            assignees: state.assignees.map((e) => e.sId ?? '').toList(),
          );

          final res = await taskUsecase.addTask(task: task);

          res.fold((l) {
            emit(state.copyWith(state: RequestState.error));
          }, (r) {
            emit(state.copyWith(state: RequestState.loaded, message: r));
          });
        },
      );
    });
  }
  final TaskUsecase taskUsecase;
  final BuildingByIdBloc buildingByIdBloc;
}
