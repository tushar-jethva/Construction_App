part of 'per_building_agencies_bloc.dart';

@immutable
sealed class PerBuildingAgenciesState {}

final class PerBuildingAgenciesInitial extends PerBuildingAgenciesState {}

// ignore: must_be_immutable
final class PerBuildingAgenciesSuccess extends PerBuildingAgenciesState {
   List<PerBuildingAgencyModel> agencies;
  PerBuildingAgenciesSuccess({
    required this.agencies,
  });
}

final class PerBuildingAgenciesFailure extends PerBuildingAgenciesState {}
