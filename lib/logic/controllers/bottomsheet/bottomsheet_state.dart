part of 'bottomsheet_bloc.dart';

@freezed
class BottomsheetState with _$BottomsheetState {
  const factory BottomsheetState({
    required RequestState state,
    required String message,
    required bool isSheetOpen,
  }) = _BottomsheetState;

  factory BottomsheetState.initial() => const BottomsheetState(
        state: RequestState.empty,
        message: '',
        isSheetOpen: false,
      );
}
