import 'package:bloc/bloc.dart';
import 'package:construction_mate/data/repository/agency_repository.dart';
import 'package:construction_mate/logic/models/floor_model.dart';
import 'package:meta/meta.dart';

part 'select_floors_event.dart';
part 'select_floors_state.dart';

class SelectFloorsBloc extends Bloc<SelectFloorsEvent, SelectFloorsState> {
  final AgencyRepository agencyRepository; // Add your repository

  SelectFloorsBloc(this.agencyRepository)
      : super(SelectFloorsState(floorList: [], selectedFloorList: [])) {
    on<AddFloorEvent>((event, emit) {
      final updatedList = List<int>.from(state.floorList)..add(event.floor);
      emit(state.copyWith(floorList: updatedList));
    });

    on<RemoveFloorEvent>((event, emit) {
      final updatedList = List<int>.from(state.floorList)..remove(event.floor);
      emit(state.copyWith(floorList: updatedList));
    });

    on<FetchSelectedFloorsEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final floors = await agencyRepository.getSelectedFloors(
            buildingId: event.buildingId,
            projectId: event.projectId,
            workTypeId: event.workTypeId);
        emit(state.copyWith(selectedFloorList: floors, isLoading: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
      }
    });
  }
}
