part of 'site_progress_agency_update_bloc.dart';

class SiteProgressAgencyUpdateState {
  final List<SiteProgressAgencyUpdateModel> selectedAgencies;
  final List<SiteProgressAgencyUpdateModel> currentSelectedAgencies;
  final int totalAgencies;

  final bool selectAll;
  final bool isLoading;

  const SiteProgressAgencyUpdateState(
      {this.selectedAgencies = const [],
      this.currentSelectedAgencies = const [],
      this.totalAgencies = 0,
      this.selectAll = false,
      this.isLoading = true});

  SiteProgressAgencyUpdateState copyWith({
    List<SiteProgressAgencyUpdateModel>? selectedAgencies,
    List<SiteProgressAgencyUpdateModel>? currentSelectedAgencies,
    bool? selectAll,
    bool? isLoading,
    int? totalAgencies,
  }) {
    return SiteProgressAgencyUpdateState(
        selectedAgencies: selectedAgencies ?? this.selectedAgencies,
        currentSelectedAgencies:
            currentSelectedAgencies ?? this.currentSelectedAgencies,
        selectAll: selectAll ?? this.selectAll,
        isLoading: isLoading ?? this.isLoading,
        totalAgencies: totalAgencies ?? this.totalAgencies);
  }
}

class SiteProgressAgencyUpdateLoadingState
    extends SiteProgressAgencyUpdateState {
  final List<SiteProgressAgencyUpdateModel> selectedAgencies;
  final List<SiteProgressAgencyUpdateModel> currentSelectedAgencies;
  final bool selectAll;
  final bool isLoading;
   final int totalAgencies;


  SiteProgressAgencyUpdateLoadingState(
      {required this.selectedAgencies,
      required this.currentSelectedAgencies,
      required this.selectAll,
      required this.isLoading, 
      required this.totalAgencies});
}

class SiteProgressAgencyUpdateSuccessState
    extends SiteProgressAgencyUpdateState {
  final List<SiteProgressAgencyUpdateModel> selectedAgencies;
  final List<SiteProgressAgencyUpdateModel> currentSelectedAgencies;
  final bool selectAll;
  final bool isLoading;
  final int totalAgencies;


  SiteProgressAgencyUpdateSuccessState(
      {required this.selectedAgencies,
      required this.currentSelectedAgencies,
      required this.selectAll,
      required this.isLoading, required this.totalAgencies
      });
}

class SiteProgressAgencyUpdateFailureState
    extends SiteProgressAgencyUpdateState {
  final List<SiteProgressAgencyUpdateModel> selectedAgencies;
  final List<SiteProgressAgencyUpdateModel> currentSelectedAgencies;
  final bool selectAll;
  final bool isLoading;
  final int totalAgencies;


  SiteProgressAgencyUpdateFailureState(
      {required this.selectedAgencies,
      required this.currentSelectedAgencies,
      required this.selectAll,
      required this.isLoading, 
      required this.totalAgencies});
}
