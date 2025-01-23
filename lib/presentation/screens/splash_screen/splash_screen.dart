import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/authenticator_watcher/authenticator_watcher_bloc.dart';
import 'package:construction_mate/logic/controllers/network/network_bloc.dart';
import 'package:construction_mate/logic/controllers/network/network_event_bloc.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NetworkBloc>().add(NetworkObserve());

    Future.delayed(const Duration(seconds: 1), () {
      Future.microtask(
        () => context.read<AuthenticatorWatcherBloc>().add(
              const AuthenticatorWatcherEvent.authCheckRequest(),
            ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticatorWatcherBloc, AuthenticatorWatcherState>(
      listener: (context, state) {
        state.maybeMap(
          orElse: () {},
          authenticating: (_) {},
          authenticated: (_) async {
            // update fcm token
            context.replaceNamed(RoutesName.bottomBar);
          },
          isFirstTime: (_) {
            context.replaceNamed(RoutesName.ONBOARD_SCREEN_NAME);
          },
          unauthenticated: (_) {
            context.replaceNamed(RoutesName.signInScreen);
          },
        );
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Center(
                    child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage(
                    Assets.images.a4build.path,
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
