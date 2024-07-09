part of 'add_agency_drop_downs_bloc.dart';

@immutable
sealed class AddAgencyDropDownsEvent {}

class DropdownWorkTypeChangedEvent extends AddAgencyDropDownsEvent {
  final String value;
  DropdownWorkTypeChangedEvent(this.value);
}

class DropdownNameOfAgencyChangedEvent extends AddAgencyDropDownsEvent {
  final String value;
  DropdownNameOfAgencyChangedEvent(this.value);
}
