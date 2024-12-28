import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'menu_event.dart';
part 'menu_state.dart';
part 'menu_bloc.freezed.dart';

@singleton
class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuState.initial()) {
    on<MenuEvent>((event, emit) {
      event.map(started: (_Started value) {
        emit(MenuState.initial());
      }, onIndexChanged: (_OnIndexChanged value) {
        emit(state.copyWith(index: value.index));
      });
    });
  }
}
