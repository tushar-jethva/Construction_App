// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_agency_drop_downs_bloc.dart';

class AddAgencyDropDownsState {
  final String workTypeValue;
  final String nameOfAgencyValue;
  final List<WorkTypeModel> workTypes;
  final List<AgencyModel> agencies;

  AddAgencyDropDownsState({
    this.workTypeValue = '',
    this.nameOfAgencyValue = '',
    this.workTypes = const [],
    this.agencies = const [],
  });

  AddAgencyDropDownsState copyWith({
    String? workTypeValue,
    String? nameOfAgencyValue,
    List<WorkTypeModel>? workTypes,
    List<AgencyModel>? agencies,
  }) {
    return AddAgencyDropDownsState(
      workTypeValue: workTypeValue ?? this.workTypeValue,
      nameOfAgencyValue: nameOfAgencyValue ?? this.nameOfAgencyValue,
      workTypes: workTypes ?? this.workTypes,
      agencies: agencies ?? this.agencies,
    );
  }
}


class WorkTypeLoadedState extends AddAgencyDropDownsState {
  WorkTypeLoadedState({
    required List<WorkTypeModel> workTypes,
    String workTypeValue = '',
    String nameOfAgencyValue = '',
    List<AgencyModel> agencies = const [],
  }) : super(
          workTypeValue: workTypeValue,
          nameOfAgencyValue: nameOfAgencyValue,
          workTypes: workTypes,
          agencies: agencies,
        );
}

class   WorkTypeLoadingState extends AddAgencyDropDownsState {
 WorkTypeLoadingState({
    String workTypeValue = '',
    String nameOfAgencyValue = '',
    List<WorkTypeModel> workTypes = const [],
    List<AgencyModel> agencies = const [],
  }) : super(
          workTypeValue: workTypeValue,
          nameOfAgencyValue: nameOfAgencyValue,
          workTypes: workTypes,
          agencies: agencies,
        );
}

class   LoadingState extends AddAgencyDropDownsState {
 LoadingState({
    String workTypeValue = '',
    String nameOfAgencyValue = '',
    List<WorkTypeModel> workTypes = const [],
    List<AgencyModel> agencies = const [],
  }) : super(
          workTypeValue: workTypeValue,
          nameOfAgencyValue: nameOfAgencyValue,
          workTypes: workTypes,
          agencies: agencies,
        );
}

class AgencyLoadedState extends AddAgencyDropDownsState {
  AgencyLoadedState({
    required List<WorkTypeModel> workTypes,
    String workTypeValue = '',
    String nameOfAgencyValue = '',
    required List<AgencyModel> agencies,
  }) : super(
          workTypeValue: workTypeValue,
          nameOfAgencyValue: nameOfAgencyValue,
          workTypes: workTypes,
          agencies: agencies,
        );
}
