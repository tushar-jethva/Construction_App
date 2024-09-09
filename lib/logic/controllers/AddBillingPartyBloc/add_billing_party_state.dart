// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_billing_party_bloc.dart';

class AddBillingPartyState {
  final List<ProjectModel> projects;
  final bool isLoadingProject;
  final String projectValue;
  final int isAdded;
  AddBillingPartyState(
      {this.projects = const [],
      this.isLoadingProject = false,
      this.projectValue = "",
      this.isAdded = 0});

  AddBillingPartyState copyWith(
      {List<ProjectModel>? projects,
      bool? isLoadingProject,
      String? projectValue,
      int? isAdded}) {
    return AddBillingPartyState(
        projects: projects ?? this.projects,
        isLoadingProject: isLoadingProject ?? this.isLoadingProject,
        projectValue: projectValue ?? this.projectValue,
        isAdded: isAdded ?? this.isAdded);
  }
}
