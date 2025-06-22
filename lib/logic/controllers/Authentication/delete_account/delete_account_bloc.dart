import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';
part 'delete_account_bloc.freezed.dart';

@singleton
class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  DeleteAccountBloc(this.authenticationRepository)
      : super(DeleteAccountState.initial()) {
    on<DeleteAccountEvent>((event, emit) async {
      await event.map(
        started: (value) {
          emit(DeleteAccountState.initial());
        },
        emailOnChanged: (_EmailOnChanged value) {
          emit(state.copyWith(email: value.email, state: RequestState.empty));
        },
        deleteAccount: (_DeleteAccount value) async {
          emit(state.copyWith(state: RequestState.loading));
          final response =
              await authenticationRepository.deleteAccount(email: state.email);

          response.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
                state: RequestState.loaded,
                message: "Account deleted successfully"));
          });
        },
        deleteAccountMobile: (_DeleteAccountMobile value) async {
          emit(state.copyWith(state: RequestState.loading));
          final response =
              await authenticationRepository.deleteAccountMobile();

          response.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(
                state: RequestState.loaded,
                message: "Account deleted successfully"));
          });
        },
      );
    });
  }

  final AuthenticationRepository authenticationRepository;
}
