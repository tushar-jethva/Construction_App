import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'switch_event.dart';
part 'switch_state.dart';
part 'switch_bloc.freezed.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState.initial()) {
    on<SwitchEvent>((event, emit) {
      event.map(switched: (_Switched value) {
        final value = state.isSwitched;
        emit(state.copyWith(isSwitched: !value));
      });
    });
  }
}
