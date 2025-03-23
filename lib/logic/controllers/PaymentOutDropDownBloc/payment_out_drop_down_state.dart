// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'payment_out_drop_down_bloc.dart';

class PaymentOutDropDownState {
  final String projectValue;
  final String buildingValue;
  final String agencyValue;
  final List<ProjectModel> projects;
  final List<BuildingModel> buildings;
  final List<DropDownAgencyModel> agencies;
  final PartyType partyType;
  PaymentOutDropDownState({
    this.projectValue = '',
    this.buildingValue = '',
    this.agencyValue = '',
    this.partyType = PartyType.SubContractor,
    this.projects = const [],
    this.buildings = const [],
    this.agencies = const [],
  });

  PaymentOutDropDownState copyWith({
    String? projectValue,
    String? buildingValue,
    String? agencyValue,
    PartyType? partyType,
    List<ProjectModel>? projects,
    List<BuildingModel>? buildings,
    List<DropDownAgencyModel>? agencies,
  }) {
    return PaymentOutDropDownState(
      projectValue: projectValue ?? this.projectValue,
      buildingValue: buildingValue ?? this.buildingValue,
      agencyValue: agencyValue ?? this.agencyValue,
      partyType: partyType ?? this.partyType,
      projects: projects ?? this.projects,
      buildings: buildings ?? this.buildings,
      agencies: agencies ?? this.agencies,
    );
  }
}

class ProjectsLoadingState extends PaymentOutDropDownState {
  ProjectsLoadingState(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}

class ProjectsLoadedState extends PaymentOutDropDownState {
  ProjectsLoadedState(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies});
}

class BuildingsLoadingState extends PaymentOutDropDownState {
  BuildingsLoadingState(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}

class BuildingsLoadedState extends PaymentOutDropDownState {
  BuildingsLoadedState(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}

class AgenciesLoadingState extends PaymentOutDropDownState {
  AgenciesLoadingState(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}

class AgenciesLoadedState extends PaymentOutDropDownState {
  AgenciesLoadedState(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}

class PaymentOutAddLoading extends PaymentOutDropDownState {
  PaymentOutAddLoading(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}

class PaymentOutAddSuccess extends PaymentOutDropDownState {
  PaymentOutAddSuccess(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}

class PaymentOutAddFailure extends PaymentOutDropDownState {
  PaymentOutAddFailure(
      {required super.projectValue,
      required super.buildingValue,
      required super.agencyValue,
      required super.projects,
      required super.buildings,
      required super.agencies,
      required super.partyType});
}
