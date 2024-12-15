import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/data/repository/authentication_repository.dart';
import 'package:construction_mate/utilities/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';
part 'sign_in_bloc.freezed.dart';

@singleton
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationRepository authenticationRepository;
  SignInBloc({required this.authenticationRepository})
      : super(SignInState.initial()) {
    on<SignInEvent>((event, emit) async {
      await event.map(
        emailOnChanged: (_EmailOnChanged value) {
          emit(state.copyWith(
              email: value.email,
              state: RequestState.empty,
              state1: RequestState.empty));
        },
        passwordChanged: (_PasswordOnChanged value) {
          emit(state.copyWith(
              password: value.password,
              state: RequestState.empty,
              state1: RequestState.empty));
        },
        loginUser: (_LoginUser value) async {
          emit(state.copyWith(state: RequestState.loading));
          print("--------- in bloc ${state.email} ${state.password}");

          final token = await authenticationRepository.signIn(
              email: state.email, password: state.password);
         await token.fold((l) {
            emit(state.copyWith(state: RequestState.error, message: l.message));
          }, (r) async {
            await SharedPreferenceHelper().storedata("token", r);
            emit(state.copyWith(state: RequestState.loaded));
          });
        },
        logout: (value) {
          emit(state.copyWith(
              state1: RequestState.loading, state: RequestState.empty));
          SharedPreferenceHelper().remove("token");
          debugPrint(
              "------------- shared ${SharedPreferenceHelper().getdata("token")}");
          emit(state.copyWith(
              state1: RequestState.loaded, state: RequestState.empty));
        },
      );
    });
  }
}
