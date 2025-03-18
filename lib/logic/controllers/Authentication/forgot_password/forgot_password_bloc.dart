import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/authentication_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';
part 'forgot_password_bloc.freezed.dart';

@singleton
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(this.authenticationRepository)
      : super(ForgotPasswordState.initial()) {
    on<ForgotPasswordEvent>((event, emit) async {
      await event.map(started: (_Started value) {
        emit(ForgotPasswordState.initial());
      }, onEmailChanged: (_OnEmailChanged value) {
        emit(state.copyWith(state: ForgotState.empty, email: value.email));
      }, verifyEmail: (value) async {
        emit(state.copyWith(state: ForgotState.emailVerificationLoading));

        final res = await authenticationRepository.forgotPasswordOtp(
            email: state.email);

        res.fold((l) {
          emit(state.copyWith(
              state: ForgotState.emailVerificationFailed, message: l.message));
        }, (r) {
          emit(state.copyWith(state: ForgotState.emailVerified));
        });
      }, sendForgotPasswordOtp: (_SendForgotPasswordOtp value) async {
        emit(state.copyWith(state: ForgotState.otpSending));

        final res = await authenticationRepository.forgotPasswordOtp(
            email: state.email);

        res.fold((l) {
          emit(state.copyWith(
              state: ForgotState.otpSentFailed, message: l.message));
        }, (r) {
          emit(state.copyWith(
            state: ForgotState.otpSent,
          ));
        });
      });
    });
  }

  final AuthenticationRepository authenticationRepository;
}
