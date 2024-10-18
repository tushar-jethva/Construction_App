import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'visibility_eye_event.dart';
part 'visibility_eye_state.dart';
part 'visibility_eye_bloc.freezed.dart';

class VisibilityEyeBloc extends Bloc<VisibilityEyeEvent, VisibilityEyeState> {
  VisibilityEyeBloc() : super(VisibilityEyeState.initial()) {
    on<VisibilityEyeEvent>((event, emit) {
      event.map(isPasswordShowChanged: (value) {
        emit(state.copyWith(isPasswordShow: !state.isPasswordShow));
      }, isConfirmPasswordShowChanged: (value) {
        emit(state.copyWith(isConfPasswordShow: !state.isConfPasswordShow));
      });
    });
  }
}
