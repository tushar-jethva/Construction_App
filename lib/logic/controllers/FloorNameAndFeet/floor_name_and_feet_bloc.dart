import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'floor_name_and_feet_event.dart';
part 'floor_name_and_feet_state.dart';

class FloorNameAndFeetBloc
    extends Bloc<FloorNameAndFeetEvent, FloorNameAndFeetState> {
  FloorNameAndFeetBloc() : super(FloorNameAndFeetState()) {
    on<FloorNameAndFeetChanged>((event, emit) {
      emit(state.copyWith(
          listOfFloorNameAndFeetState: event.listOfFloorNameAndFeetState,
          isDonePressed: true));
    });
    on<FloorChanged>((event, emit) {
      emit(state.copyWith(floors: event.floors));
      final floorArray = List.generate(
          int.parse(state.floors),
          (index) => {
                'floorName': 'Floor No. ${index + 1}',
                'squreFeet': state.feets
              });
      emit(state.copyWith(listOfFloorNameAndFeetState: floorArray));
    });
    on<FootsChagned>((event, emit) {
      emit(state.copyWith(feets: event.foots));
      final floorArray = List.generate(
          int.parse(state.floors),
          (index) => {
                'floorName': 'Floor No. ${index + 1}',
                'squreFeet': state.feets
              });
      emit(state.copyWith(listOfFloorNameAndFeetState: floorArray));
    });
  }
}
