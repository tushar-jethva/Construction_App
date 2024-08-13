part of 'floor_name_and_feet_bloc.dart';

@immutable
sealed class FloorNameAndFeetEvent {}

class FloorNameAndFeetChanged extends FloorNameAndFeetEvent {
  final List<Map<String, String>> listOfFloorNameAndFeetState;
  FloorNameAndFeetChanged({required this.listOfFloorNameAndFeetState});
}

class FloorChanged extends FloorNameAndFeetEvent {
  final String floors;
  FloorChanged({required this.floors});
}

class FootsChagned extends FloorNameAndFeetEvent {
  final String foots;
  FootsChagned({required this.foots});
}
