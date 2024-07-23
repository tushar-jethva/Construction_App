part of 'site_progress_floors_bloc.dart';

@immutable
sealed class SiteProgressFloorsState {}

final class SiteProgressFloorsInitial extends SiteProgressFloorsState {}

final class SiteProgressFloorsSuccess extends SiteProgressFloorsState {
  final List<FloorSiteModel> listOfFloorsSite;

  SiteProgressFloorsSuccess({required this.listOfFloorsSite});
}


final class SiteProgressFloorsFailure extends SiteProgressFloorsState {}

