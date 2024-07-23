// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'per_building_agencies_bloc.dart';

@immutable
sealed class PerBuildingAgenciesEvent {}

// ignore: must_be_immutable
class LoadAgencies extends PerBuildingAgenciesEvent {
  final String projectId;
  final String  buildingId;
  LoadAgencies({
   required this.projectId,
   required this.buildingId
  });

}
