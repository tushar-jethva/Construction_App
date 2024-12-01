import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'bottomsheet_event.dart';
part 'bottomsheet_state.dart';
part 'bottomsheet_bloc.freezed.dart';

@singleton

class BottomsheetBloc extends Bloc<BottomsheetEvent, BottomsheetState> {
  BottomsheetBloc()
      : super(
          BottomsheetState.initial(),
        ) {
    on<BottomsheetEvent>((event, emit) async {
      event.map(
        openBottomSheet: (e) {
          emit(
            state.copyWith(
              isSheetOpen: e.isSheetOpen,
            ),
          );
        },
      );
    });
  }
}
