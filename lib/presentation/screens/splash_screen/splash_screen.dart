import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/screens/authentication/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.goNamed(RoutesName.signUpScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
