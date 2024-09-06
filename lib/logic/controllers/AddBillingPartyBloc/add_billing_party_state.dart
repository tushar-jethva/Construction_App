// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_billing_party_bloc.dart';

class AddBillingPartyState {
  final List<ProjectModel> projects;
  final bool isLoadingProject;

  AddBillingPartyState(
      {this.projects = const [], this.isLoadingProject = false});

  AddBillingPartyState copyWith({
    List<ProjectModel>? projects,
    bool? isLoadingProject,
  }) {
    return AddBillingPartyState(
      projects: projects ?? this.projects,
      isLoadingProject: isLoadingProject ?? this.isLoadingProject,
    );
  }
}
