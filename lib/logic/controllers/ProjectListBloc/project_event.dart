part of 'project_bloc.dart';

@immutable
sealed class ProjectEvent {}

class LoadProjects extends ProjectEvent {}

class AddProject extends ProjectEvent{
  final String projectName;
  final String projectAddress;
  final String projectDescription;

  AddProject({required this.projectName, required this.projectAddress, required this.projectDescription});

}
