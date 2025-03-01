import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_parties_event.dart';
part 'add_parties_state.dart';
part 'add_parties_bloc.freezed.dart';

@singleton
class AddPartiesBloc extends Bloc<AddPartiesEvent, AddPartiesState> {
  AddPartiesBloc() : super(AddPartiesState.initial()) {
    on<AddPartiesEvent>(
      (event, emit) async {
        await event.map(
          initialize: (_Initialize value) {
            emit(AddPartiesState.initial());
          },
          onPartyTypeChange: (_OnPartyTypeChange value) {
            emit(state.copyWith(partyType: value.partyType));
          },
        );
      },
    );
  }
}
