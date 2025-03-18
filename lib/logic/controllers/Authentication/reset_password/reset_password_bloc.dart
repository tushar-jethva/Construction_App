import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/authentication_repository.dart';
import 'package:construction_mate/logic/controllers/Authentication/forgot_password/forgot_password_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';
part 'reset_password_bloc.freezed.dart';

@singleton
class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc(this.authenticationRepository, this.forgotPasswordBloc)
      : super(ResetPasswordState.initial()) {
    on<ResetPasswordEvent>((event, emit) async {
      await event.map(
        initialize: (_Initialize value) {
          emit(ResetPasswordState.initial());
        },
        onPasswordChanged: (_OnPasswordChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, passoword: value.password));
        },
        onConfPasswordChanged: (_OnConfPasswordChanged value) {
          emit(state.copyWith(
              state: RequestState.empty, confPassword: value.confPassword));
        },
        resetPasswordTap: (value) async {
          emit(state.copyWith(state: RequestState.loading));

          final res = await authenticationRepository.forgotPassword(
              email: forgotPasswordBloc.state.email, password: state.passoword);

          res.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) {
            emit(state.copyWith(state: RequestState.loaded));
          });
        },
      );
    });
  }

  final AuthenticationRepository authenticationRepository;
  final ForgotPasswordBloc forgotPasswordBloc;
}
