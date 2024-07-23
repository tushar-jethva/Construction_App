part of 'site_progress_floors_bloc.dart';

@immutable
sealed class SiteProgressFloorsEvent {}

class LoadFloorsSite extends SiteProgressFloorsEvent{
  final String projectId;
  final String buildingId;

  LoadFloorsSite({required this.projectId, required this.buildingId});
   
}
