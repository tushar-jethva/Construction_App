import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/authentication_repository.dart';
import 'package:construction_mate/logic/controllers/Authentication/forgot_password/forgot_password_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';
part 'verify_otp_bloc.freezed.dart';

@singleton
class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpBloc(this.authenticationRepository, this.forgotPasswordBloc)
      : super(VerifyOtpState.initial()) {
    on<VerifyOtpEvent>((event, emit) async {
      await event.map(started: (_Started value) {
        emit(VerifyOtpState.initial());
      }, onOtpChanged: (_OnOtpChanged value) {
        emit(state.copyWith(state: RequestState.empty, otp: value.otp));
      }, onVerifyOtp: (_OnVerifyOtp value) async {
        emit(state.copyWith(state: RequestState.loading));

        final res = await authenticationRepository.resetVerifyOtp(
            email: forgotPasswordBloc.state.email, otp: state.otp);

        res.fold((l) {
          emit(state.copyWith(state: RequestState.error, message: l.message));
        }, (r) {
          if (r) {
            emit(state.copyWith(
              state: RequestState.loaded,
            ));
          } else {
            emit(state.copyWith(state: RequestState.error));
          }
        });
      });
    });
  }

  final AuthenticationRepository authenticationRepository;
  final ForgotPasswordBloc forgotPasswordBloc;
}
