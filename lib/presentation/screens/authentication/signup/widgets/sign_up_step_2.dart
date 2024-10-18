import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/extension/sized_box_extension.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignUp/sign_up_bloc.dart';
import 'package:construction_mate/logic/controllers/VisibillityBloc/visibility_eye_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/presentation/widgets/common/custom_button_with_widget.dart';
import 'package:construction_mate/presentation/widgets/common/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

class SignUpStep2 extends StatelessWidget {
  const SignUpStep2({super.key});

  static final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                        CustomTextFormField(
                            isValidate: true,
                            textInputType: TextInputType.text,
                            textFieldType: TextFieldType.text,
                            hintText: "Company Name",
                            maxLines: 1),
                        15.hx,
                        BlocBuilder<VisibilityEyeBloc, VisibilityEyeState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              isValidate: true,
                              textInputType: TextInputType.text,
                              textFieldType: TextFieldType.password,
                              obscureText: state.isPasswordShow,
                              hintText: "Password",
                              maxLines: 1,
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  context.read<VisibilityEyeBloc>().add(
                                      const VisibilityEyeEvent
                                          .isPasswordShowChanged());
                                },
                                child: state.isPasswordShow
                                    ? const Icon(Icons.visibility_off)
                                    : const Icon(Icons.visibility),
                              ),
                            );
                          },
                        ),
                        15.hx,
                        BlocBuilder<VisibilityEyeBloc, VisibilityEyeState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                                isValidate: true,
                                textInputType: TextInputType.text,
                                textFieldType: TextFieldType.password,
                                hintText: "Confirm Password",
                                maxLines: 1,
                                obscureText: state.isConfPasswordShow,
                                onChanged: (value) {},
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    context.read<VisibilityEyeBloc>().add(
                                        const VisibilityEyeEvent
                                            .isConfirmPasswordShowChanged());
                                  },
                                  child: state.isConfPasswordShow
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                ));
                          },
                        ),
                        25.hx,
                        BlocBuilder<SignUpBloc, SignUpState>(
                          builder: (context, state) {
                            return CustomElevatedButton(
                              isLoading: state.state2.isLoading,
                              label: "Sign Up",
                              backgroundColor: purple,
                              labelColor: white,
                              borderColor: Colors.transparent,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (state.password != state.confirmPassword) {
                                    ReusableFunctions.showSnackBar(
                                        context: context,
                                        content:
                                            "Password and confirm password must be same!");
                                  } else {
                                    context
                                        .read<SignUpBloc>()
                                        .add(const SignUpEvent.addUser());
                                  }
                                }
                              },
                            );
                          },
                        ),
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
      ),
    );
  }
}
