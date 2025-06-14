part of 'select_floors_bloc.dart';

@immutable
class SelectFloorsState {
  final List<String> floorList;
  final List<FloorModel> selectedFloorList;
  final bool isLoading;
  final String? error;
  final String message;

  SelectFloorsState({
    required this.floorList,
    required this.selectedFloorList,
    this.isLoading = true,
    this.error,
    this.message = ""
  });

  SelectFloorsState copyWith({
    List<String>? floorList,
    List<FloorModel>? selectedFloorList,
    bool? isLoading,
    String? error,
    String? message
  }) {
    return SelectFloorsState(
      floorList: floorList ?? this.floorList,
      selectedFloorList: selectedFloorList ?? this.selectedFloorList,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      message: message ?? this.message
    );
  }
}
