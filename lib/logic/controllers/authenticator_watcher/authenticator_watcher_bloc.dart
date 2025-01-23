import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/utilities/shared_preference_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
part 'authenticator_watcher_event.dart';
part 'authenticator_watcher_state.dart';
part 'authenticator_watcher_bloc.freezed.dart';

@singleton
class AuthenticatorWatcherBloc
    extends Bloc<AuthenticatorWatcherEvent, AuthenticatorWatcherState> {
  AuthenticatorWatcherBloc()
      : super(const AuthenticatorWatcherState.initial()) {
    on<AuthenticatorWatcherEvent>((event, emit) async {
      await event.map(
        authCheckRequest: (_) async {
          emit(const AuthenticatorWatcherState.authenticating());
          final isFirstTime =
              SharedPreferenceHelper().getBool(IS_FIRST_TIME) ?? true;
          final isTokenPresent = SharedPreferenceHelper().getdata("token");

          if (isFirstTime) {
            SharedPreferenceHelper().storeBool(IS_FIRST_TIME, false);

            emit(const AuthenticatorWatcherState.isFirstTime());
          } else if (isTokenPresent == null) {
            emit(const AuthenticatorWatcherState.unauthenticated());
          } else {
            emit(const AuthenticatorWatcherState.authenticated());
          }
        },
        signOut: (_) async {
          // await _firebaseAuth.signOut();
          // GoogleSignIn().signOut();
          emit(const AuthenticatorWatcherState.unauthenticated());
          emit(const AuthenticatorWatcherState.initial());
        },
      );
    });
  }
}
