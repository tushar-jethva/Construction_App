import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_agency_drop_downs_event.dart';
part 'add_agency_drop_downs_state.dart';

class AddAgencyDropDownsBloc
    extends Bloc<AddAgencyDropDownsEvent, AddAgencyDropDownsState> {
  AddAgencyDropDownsBloc() : super(AddAgencyDropDownsState()) {
    on<AddAgencyDropDownsEvent>((event, emit) {
      // TODO: implement event handler
      if (event is DropdownWorkTypeChangedEvent) {
        emit(state.copyWith(workTypeValue: event.value));
      }
      if (event is DropdownNameOfAgencyChangedEvent) {
        emit(state.copyWith(nameOfAgencyValue: event.value));
      }
    });
  }
}
