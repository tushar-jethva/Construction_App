import 'package:construction_mate/common/enter_otp_widget.dart';
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

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
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
                          hintText: "Email", maxLines: 1),
                      25.hx,
                      MyCustomButtonWidget(
                          widget: Text(
                            "Next",
                            style: theme.textTheme.bodyMedium,
                          ),
                          color: purple,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const EnterOptwidget();
                              },
                              barrierColor: Colors.transparent.withOpacity(0.6),
                              barrierDismissible: false,
                            );
                          }),
                      5.hx,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Text("Already hava an account?"),
                          5.wx,
                          InkWell(
                            onTap: () {
                              context.goNamed(RoutesName.signInScreen);
                            },
                            child: const Text(
                              "Sign In",
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
