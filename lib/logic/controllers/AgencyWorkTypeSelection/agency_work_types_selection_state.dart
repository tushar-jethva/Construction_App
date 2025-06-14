// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'agency_work_types_selection_bloc.dart';

class AgencyWorkTypesSelectionState {
  List<AgencyWorkTypeSelectModel> agencyWorkTypeSelectedList;
  final bool selectAll;
  final bool isLoading;
  final int isAddedAgency;
   String message;
  AgencyWorkTypesSelectionState(
      {this.agencyWorkTypeSelectedList = const [],
      this.isLoading = true,
      this.selectAll = false,
      this.isAddedAgency = 0,
      this.message = ""});

  AgencyWorkTypesSelectionState copyWith(
      {List<AgencyWorkTypeSelectModel>? agencyWorkTypeSelectedList,
      bool? selectAll,
      bool? isLoading,
      int? isAddedAgency,
      String? message}) {
    return AgencyWorkTypesSelectionState(
        agencyWorkTypeSelectedList:
            agencyWorkTypeSelectedList ?? this.agencyWorkTypeSelectedList,
        selectAll: selectAll ?? this.selectAll,
        isLoading: isLoading ?? this.isLoading,
        isAddedAgency: isAddedAgency ?? this.isAddedAgency,
        message: message ?? this.message);
  }
}
