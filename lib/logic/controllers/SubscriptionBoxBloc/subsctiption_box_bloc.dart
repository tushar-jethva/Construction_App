import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'subsctiption_box_event.dart';
part 'subsctiption_box_state.dart';
part 'subsctiption_box_bloc.freezed.dart';

@singleton
class SubsctiptionBoxBloc
    extends Bloc<SubsctiptionBoxEvent, SubsctiptionBoxState> {
  SubsctiptionBoxBloc() : super(SubsctiptionBoxState.initial()) {
    on<SubsctiptionBoxEvent>((event, emit) {
      event.map(
          initialize: (_Initialize value) {},
          onSelectionChanged: (_OnSelectionChanged value) {
            emit(state.copyWith(index: value.index));
          });
    });
  }
}
