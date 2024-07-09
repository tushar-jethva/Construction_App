import 'package:bloc/bloc.dart';
import 'package:construction_mate/logic/models/per_building_agency_model.dart';
import 'package:meta/meta.dart';

part 'per_building_agencies_event.dart';
part 'per_building_agencies_state.dart';

class PerBuildingAgenciesBloc
    extends Bloc<PerBuildingAgenciesEvent, PerBuildingAgenciesState> {
  PerBuildingAgenciesBloc() : super(PerBuildingAgenciesInitial()) {
    on<LoadAgencies>(_onLoadAgencies);
  }

  void _onLoadAgencies(
      LoadAgencies event, Emitter<PerBuildingAgenciesState> state) {
    emit(PerBuildingAgenciesSuccess(agencies: event.agencies));
  }
}
