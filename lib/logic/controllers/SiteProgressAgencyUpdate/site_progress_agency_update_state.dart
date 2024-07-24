part of 'site_progress_agency_update_bloc.dart';

class SiteProgressAgencyUpdateState {
  final List<SiteProgressAgencyUpdateModel> selectedAgencies;
  final List<SiteProgressAgencyUpdateModel> currentSelectedAgencies;

  final bool selectAll;
  final bool isLoading;

  const SiteProgressAgencyUpdateState(
      {this.selectedAgencies = const [],
      this.currentSelectedAgencies = const [],
      this.selectAll = false,
      this.isLoading = true});

  SiteProgressAgencyUpdateState copyWith({
    List<SiteProgressAgencyUpdateModel>? selectedAgencies,
    List<SiteProgressAgencyUpdateModel>? currentSelectedAgencies,
    bool? selectAll,
    bool? isLoading,
  }) {
    return SiteProgressAgencyUpdateState(
        selectedAgencies: selectedAgencies ?? this.selectedAgencies,
        currentSelectedAgencies:
            currentSelectedAgencies ?? this.currentSelectedAgencies,
        selectAll: selectAll ?? this.selectAll,
        isLoading: isLoading ?? this.isLoading);
  }
}
