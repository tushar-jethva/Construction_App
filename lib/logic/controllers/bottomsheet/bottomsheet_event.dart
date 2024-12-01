part of 'bottomsheet_bloc.dart';

@freezed
class BottomsheetEvent with _$BottomsheetEvent {
  const factory BottomsheetEvent.openBottomSheet(bool isSheetOpen) =
      _OpenBottomSheet;
}
