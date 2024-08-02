// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_in_drop_down_bloc.dart';

class PaymentInDropDownState {
  final String projectDropDownValue;
  final String agencyDropDownValue;
  final List<ProjectModel> projects;
  final List<DropDownAgencyModel> agencies;

  PaymentInDropDownState({
    this.projectDropDownValue = '',
    this.agencyDropDownValue = '',
    this.projects = const [],
    this.agencies = const [],
  });

  PaymentInDropDownState copyWith({
    String? projectDropDownValue,
    String? agencyDropDownValue,
    List<ProjectModel>? projects,
    List<DropDownAgencyModel>? agencies,
  }) {
    return PaymentInDropDownState(
      projectDropDownValue: projectDropDownValue ?? this.projectDropDownValue,
      agencyDropDownValue: agencyDropDownValue ?? this.agencyDropDownValue,
      projects: projects ?? this.projects,
      agencies: agencies ?? this.agencies,
    );
  }
}

class ProjectsLoadingInState extends PaymentInDropDownState {
  ProjectsLoadingInState(
      {required super.projectDropDownValue,
      required super.agencyDropDownValue,
      required super.projects,
      required super.agencies});
}

class ProjectsLoadedInState extends PaymentInDropDownState {
  ProjectsLoadedInState(
      {required super.projectDropDownValue,
      required super.agencyDropDownValue,
      required super.projects,
      required super.agencies});
}

class AgenciesLoadingInState extends PaymentInDropDownState {
  AgenciesLoadingInState(
      {required super.projectDropDownValue,
      required super.agencyDropDownValue,
      required super.projects,
      required super.agencies});
}

class AgenciesLoadedInState extends PaymentInDropDownState {
  AgenciesLoadedInState(
      {required super.projectDropDownValue,
      required super.agencyDropDownValue,
      required super.projects,
      required super.agencies});
}


class PaymentInAddLoading extends PaymentInDropDownState{}
class PaymentInAddSuccess extends PaymentInDropDownState{}
class PaymentInAddFailure extends PaymentInDropDownState{}
