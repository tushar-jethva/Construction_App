import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/lists.dart';
import 'package:construction_mate/data/datasource/project_data_source.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:flutter/material.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectRepository projectRepository;
  ProjectBloc(this.projectRepository) : super(ProjectInitial()) {
    on<LoadProjects>(_onLoadProjects);
  }

  void _onLoadProjects(LoadProjects event, Emitter<ProjectState> emit) async {
    emit(ProjectInitial());
    List<ProjectModel> allProjectList = await projectRepository.allProjects();
    emit(ProjectLoadSuccess(projects: allProjectList));
  }
}
