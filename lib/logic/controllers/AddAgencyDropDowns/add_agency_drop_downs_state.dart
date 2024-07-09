part of 'add_agency_drop_downs_bloc.dart';

class AddAgencyDropDownsState {
  final String workTypeValue;
  final String nameOfAgencyValue;

  AddAgencyDropDownsState(
      {this.workTypeValue = '', this.nameOfAgencyValue = ''});

  AddAgencyDropDownsState copyWith({
    final String? workTypeValue,
    final String? nameOfAgencyValue,
  }) {
    return AddAgencyDropDownsState(
      workTypeValue: workTypeValue ?? this.workTypeValue,
      nameOfAgencyValue: nameOfAgencyValue ?? this.nameOfAgencyValue,
    );
  }
}
