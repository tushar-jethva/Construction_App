import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'select_floors_event.dart';
part 'select_floors_state.dart';

class SelectFloorsBloc extends Bloc<SelectFloorsEvent, SelectFloorsState> {
  SelectFloorsBloc() : super(SelectFloorsState(floorList: [])) {
    on<AddFloorEvent>((event, emit) {
      final updatedList = List<int>.from(state.floorList)..add(event.floor);
      emit(SelectFloorsState(floorList: updatedList));
    });

    on<RemoveFloorEvent>((event, emit) {
      final updatedList = List<int>.from(state.floorList)..remove(event.floor);
      emit(SelectFloorsState(floorList: updatedList));
    });
  }
}
