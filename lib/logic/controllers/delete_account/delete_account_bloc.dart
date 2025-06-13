import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';
part 'delete_account_bloc.freezed.dart';

@singleton
class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc() : super(DeleteAccountState.initial()) {
    on<DeleteAccountEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(DeleteAccountState.initial());
        },
        emailChanged: (_EmailChanged value) {
          emit(state.copyWith(state: RequestState.empty, email: value.email));
        },
        deleteAccount: (_DeleteAccount value) async {},
      );
    });
  }
}
