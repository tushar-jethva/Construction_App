part of 'site_progress_agency_update_bloc.dart';

@immutable
sealed class SiteProgressAgencyUpdateEvent {}

class FetchAlreadySelectedAgencies extends SiteProgressAgencyUpdateEvent {
  final String projectId;
  final String buildingId;
  final String floorIndex;

  FetchAlreadySelectedAgencies({required this.projectId, required this.buildingId, required this.floorIndex});
}

class ToggleAgencySelection extends SiteProgressAgencyUpdateEvent {
  final int index;

  ToggleAgencySelection({required this.index});
}

class ToggleSelectAll extends SiteProgressAgencyUpdateEvent {}

class OnUpdateButtonPressed extends SiteProgressAgencyUpdateEvent{
  final FloorSiteModel floor;
  OnUpdateButtonPressed({required this.floor});

}
