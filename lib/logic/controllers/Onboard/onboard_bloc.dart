import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'onboard_event.dart';
part 'onboard_state.dart';
part 'onboard_bloc.freezed.dart';

@singleton
class OnboardBloc extends Bloc<OnboardEvent, OnboardState> {
  OnboardBloc() : super(OnboardState.initial()) {
    on<OnboardEvent>((event, emit) {
      event.map(started: (_Started value) {
        emit(OnboardState.initial());
      }, onIndexChanged: (_OnIndexChanged value) {
        emit(state.copyWith(index: value.index));
      });
    });
  }
}
