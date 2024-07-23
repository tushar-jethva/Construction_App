part of 'site_progress_agency_update_bloc.dart';

@immutable
sealed class SiteProgressAgencyUpdateEvent {}

class FetchAlreadySelectedAgencies extends SiteProgressAgencyUpdateEvent {
  final FloorSiteModel floorSiteModel;

  FetchAlreadySelectedAgencies({required this.floorSiteModel});
}

class ToggleAgencySelection extends SiteProgressAgencyUpdateEvent {
  final int index;

  ToggleAgencySelection({required this.index});
}

class ToggleSelectAll extends SiteProgressAgencyUpdateEvent {}

class OnUpdateButtonPressed extends SiteProgressAgencyUpdateEvent{
  final List<SiteProgressAgencyUpdateModel> listOfSiteProgresssAgencyUpdate;

  OnUpdateButtonPressed({required this.listOfSiteProgresssAgencyUpdate});

}
