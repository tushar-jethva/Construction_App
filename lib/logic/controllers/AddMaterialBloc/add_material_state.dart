// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_material_bloc.dart';

class AddMaterialState {
  final List<ProjectModel> projects;
  final String projectValue;
  final bool isLoading;

  AddMaterialState(
      {this.projects = const [],
      this.projectValue = "",
      this.isLoading = false});

  AddMaterialState copyWith({
    List<ProjectModel>? projects,
    String? projectValue,
    bool? isLoading,
  }) {
    return AddMaterialState(
      projects: projects ?? this.projects,
      projectValue: projectValue ?? this.projectValue,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
