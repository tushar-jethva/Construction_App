part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

class ProjectLoadSuccess extends ProjectState {
  final List<ProjectModel> projects;

  ProjectLoadSuccess({required this.projects});
}

class ProjectAddLoading extends ProjectState {}

class ProjectAddSuccess extends ProjectState {}

class ProjectAddFailure extends ProjectState {}
