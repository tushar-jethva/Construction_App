part of 'select_floors_bloc.dart';

@immutable
class SelectFloorsState {
  final List<int> floorList;
  final List<FloorModel> selectedFloorList;
  final bool isLoading;
  final String? error;

  SelectFloorsState({
    required this.floorList,
    required this.selectedFloorList,
    this.isLoading = false,
    this.error,
  });

  SelectFloorsState copyWith({
    List<int>? floorList,
    List<FloorModel>? selectedFloorList,
    bool? isLoading,
    String? error,
  }) {
    return SelectFloorsState(
      floorList: floorList ?? this.floorList,
      selectedFloorList: selectedFloorList ?? this.selectedFloorList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
