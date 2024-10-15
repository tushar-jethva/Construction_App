import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/extension/sized_box_extension.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SignUpStep2 extends StatelessWidget {
  const SignUpStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const MyCustomTextFormField(
                      hintText: "Company Name", maxLines: 1),
                  15.hx,
                  MyCustomTextFormField(
                    hintText: "Password",
                    maxLines: 1,
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.visibility),
                    ),
                  ),
                  15.hx,
                  MyCustomTextFormField(
                      hintText: "Confirm Password",
                      maxLines: 1,
                      suffixIcon: GestureDetector(
                        onTap: () {},
                        child: const Icon(Icons.visibility),
                      )),
                  25.hx,
                  MyCustomButtonWidget(
                      widget: const Text(
                        "SignUp",
                        style: TextStyle(color: black),
                      ),
                      color: Colors.white,
                      onPressed: () {}),
                  5.hx,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Already hava an account?"),
                      5.wx,
                      const Text(
                        "Sign In",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: white),
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
