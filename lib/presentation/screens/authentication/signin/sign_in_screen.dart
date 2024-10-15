import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/extension/sized_box_extension.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height:
                  ReusableFunctions.getHeight(context: context, height: 0.3),
              child: Lottie.asset(
                Assets.json.constructionAnim,
                fit: BoxFit.cover,
                repeat: true,
              ),
            ),
            const Gap(30),
            Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const MyCustomTextFormField(
                        hintText: "Email",
                        maxLines: 1,
                      ),
                      15.hx,
                      const MyCustomTextFormField(
                        hintText: "Password",
                        maxLines: 1,
                      ),
                      25.hx,
                      MyCustomButtonWidget(
                          widget: const Text(
                            "SignIn",
                            style: TextStyle(color: black),
                          ),
                          color: purple,
                          onPressed: () {}),
                      5.hx,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Don't hava an account?"),
                          5.wx,
                          InkWell(
                            onTap: () {
                              context.goNamed(RoutesName.signUpScreen);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationColor: white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
