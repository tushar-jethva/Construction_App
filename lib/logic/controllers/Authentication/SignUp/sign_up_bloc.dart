import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/authentication_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';
part 'sign_up_bloc.freezed.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthenticationRepository repository;
  SignUpBloc({required this.repository}) : super(SignUpState.initial()) {
    on<SignUpEvent>((event, emit) async {
      await event.map(
        initial: (value) {
          emit(SignUpState.initial());
        },
        emailOnChanged: (_EmailOnChanged value) {
          emit(state.copyWith(email: value.email, state: RequestState.empty));
        },
        companyNameChanged: (_CompanyNameChanged value) {
          emit(state.copyWith(
              companyName: value.companyName, state: RequestState.empty));
        },
        passwordChanged: (_PasswordOnChanged value) {
          emit(state.copyWith(
              password: value.password, state: RequestState.empty));
        },
        confPasswordChanged: (_ConfirmPasswordOnChanged value) {
          emit(state.copyWith(
              confirmPassword: value.confPassword, state: RequestState.empty));
        },
        otpOnChanged: (_OtpOnChanged value) {
          emit(state.copyWith(
            otp: value.otp,
            state: RequestState.empty,
          ));
        },
        verifyOtp: (value) async {
          emit(state.copyWith(state1: RequestState.loading));
          final response =
              await repository.verifyOtp(email: state.email, otp: state.otp);
          if (response) {
            emit(state.copyWith(state1: RequestState.loaded));
          } else {
            emit(state.copyWith(state1: RequestState.error));
          }
        },
        checkIsEmailExist: (_CheckIsEmailExist value) async {
          emit(state.copyWith(state: RequestState.loading));
          final userExist = await repository.isUserExist(email: state.email);
          if (userExist) {
            emit(state.copyWith(state: RequestState.error));
          } else {
            emit(state.copyWith(state: RequestState.loaded));
          }
        },
        addUser: (_AddUser value) async {
          emit(state.copyWith(state2: RequestState.loading));
          final userExist = await repository.signUp(
              email: state.email,
              password: state.password,
              companyName: state.companyName);
          emit(state.copyWith(state2: RequestState.error));
        },
      );
    });
  }
}
