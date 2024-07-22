import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/project_repository.dart';
import 'package:construction_mate/logic/models/project_model.dart';
import 'package:flutter/material.dart';
part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectRepository projectRepository;
  ProjectBloc(this.projectRepository) : super(ProjectInitial()) {
    on<LoadProjects>(_onLoadProjects);
    on<AddProject>(_onAddProject);
  }

  void _onLoadProjects(LoadProjects event, Emitter<ProjectState> emit) async {
    emit(ProjectInitial());
    List<ProjectModel> allProjectList = await projectRepository.allProjects();
    emit(ProjectLoadSuccess(projects: allProjectList));
  }

  void _onAddProject(AddProject event, Emitter<ProjectState> emit) async {
    try {
      emit(ProjectAddLoading());
      await projectRepository.addProject(
          projectName: event.projectName,
          address: event.projectAddress,
          description: event.projectDescription);
      emit(ProjectAddSuccess());
    } catch (e) {
      emit(ProjectAddFailure());
    }
  }
}
