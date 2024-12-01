// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'agency_work_types_selection_bloc.dart';

@immutable
sealed class AgencyWorkTypesSelectionEvent {}

class FetchWorkTypePartiesEvent extends AgencyWorkTypesSelectionEvent {}

class OnMessageChanged extends AgencyWorkTypesSelectionEvent {
  final String message;
  OnMessageChanged({required this.message});
}

class ToggleWorkTypeSelection extends AgencyWorkTypesSelectionEvent {
  final int index;

  ToggleWorkTypeSelection({required this.index});
}

// class ToggleWorkTypeSelectAll extends AgencyWorkTypesSelectionEvent {}

class OnAddWorkTypeButtonPressed extends AgencyWorkTypesSelectionEvent {
  final String name;
  OnAddWorkTypeButtonPressed({
    required this.name,
  });
}

class OnAddAgencyPartiesButtonPressed extends AgencyWorkTypesSelectionEvent {
  final String name;
  final String description;
  OnAddAgencyPartiesButtonPressed({
    required this.name,
    required this.description,
  });
}
