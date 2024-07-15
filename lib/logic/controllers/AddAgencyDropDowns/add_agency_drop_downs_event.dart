part of 'add_agency_drop_downs_bloc.dart';

@immutable
abstract class AddAgencyDropDownsEvent {}

class FetchWorkTypesEvent extends AddAgencyDropDownsEvent {}

class FetchAgenciesEvent extends AddAgencyDropDownsEvent {
  final String workTypeId;
  FetchAgenciesEvent({required this.workTypeId});
}

class DropdownWorkTypeChangedEvent extends AddAgencyDropDownsEvent {
  final String value;
  DropdownWorkTypeChangedEvent(this.value);
}

class DropdownNameOfAgencyChangedEvent extends AddAgencyDropDownsEvent {
  final String value;
  DropdownNameOfAgencyChangedEvent(this.value);
}
