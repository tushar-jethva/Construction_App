part of 'site_progress_agency_update_bloc.dart';

class SiteProgressAgencyUpdateState {
  final List<SiteProgressAgencyUpdateModel> selectedAgencies;
  final bool selectAll;
  final bool isLoading;

  const SiteProgressAgencyUpdateState({
    this.selectedAgencies = const [],
    this.selectAll = false,
    this.isLoading = true
  });

  SiteProgressAgencyUpdateState copyWith({
    List<SiteProgressAgencyUpdateModel>? selectedAgencies,
    bool? selectAll,
    bool? isLoading,
  }) {
    return SiteProgressAgencyUpdateState(
      selectedAgencies: selectedAgencies ?? this.selectedAgencies,
      selectAll: selectAll ?? this.selectAll,
      isLoading: isLoading ?? this.isLoading
    );
  }
}
