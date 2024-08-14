// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'floor_name_and_feet_bloc.dart';

class FloorNameAndFeetState {
  final List<Map<String, String>> listOfFloorNameAndFeetState;
  final String floors;
  final String feets;
  final bool isDonePressed;
  FloorNameAndFeetState(
      {this.listOfFloorNameAndFeetState = const [],
      this.floors = "0",
      this.feets = "0.0",
      this.isDonePressed = false});

  FloorNameAndFeetState copyWith(
      {List<Map<String, String>>? listOfFloorNameAndFeetState,
      String? floors,
      String? feets,
      bool? isDonePressed}) {
    return FloorNameAndFeetState(
        listOfFloorNameAndFeetState:
            listOfFloorNameAndFeetState ?? this.listOfFloorNameAndFeetState,
        floors: floors ?? this.floors,
        feets: feets ?? this.feets,
        isDonePressed: isDonePressed ?? this.isDonePressed);
  }
}
