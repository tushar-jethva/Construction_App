import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tab_control_event.dart';
part 'tab_control_state.dart';
part 'tab_control_bloc.freezed.dart';

@singleton
class TabControlBloc extends Bloc<TabControlEvent, TabControlState> {
  TabControlBloc() : super(TabControlState.initial()) {
    on<TabControlEvent>((event, emit) {
      event.map(started: (_Started value) {
        emit(TabControlState.initial());
      }, tabIndexChanged: (_TabIndexChanged value) {
        emit(state.copyWith(tabIndex: value.index));
      });
    });
  }
}
