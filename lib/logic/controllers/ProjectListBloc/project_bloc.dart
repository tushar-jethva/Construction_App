import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:flutter/material.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(ProjectInitial()) {
    on<LoadProjects>(_onLoadProjects);
  }

  void _onLoadProjects(LoadProjects event, Emitter<ProjectState> emit) {
    emit(ProjectLoadSuccess(projects: projects));
  }
}
