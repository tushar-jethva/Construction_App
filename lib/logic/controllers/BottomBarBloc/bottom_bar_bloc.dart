import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_bar_event.dart';
part 'bottom_bar_state.dart';

class BottomBarBloc extends Bloc<BottomBarEvent, BottomBarState> {
  BottomBarBloc() : super(const LandingPageInitial(tabIndex: 1)) {
    on<BottomBarEvent>((event, emit) {
      if (event is TabChangeEvent) {
        emit(LandingPageInitial(tabIndex: event.tabIndex));
      }
    });
  }
}
