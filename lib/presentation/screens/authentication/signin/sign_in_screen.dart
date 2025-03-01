import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart';
import 'package:construction_mate/logic/controllers/VisibillityBloc/visibility_eye_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              100.hx,
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
                          textInputType: TextInputType.emailAddress,
                          textFieldType: TextFieldType.email,
                          textInputAction: TextInputAction.next,
                          hintText: "Email",
                          maxLines: 1,
                          onChanged: (value) {
                            context
                                .read<SignInBloc>()
                                .add(SignInEvent.emailOnChanged(value));
                          },
                        ),
                        BlocBuilder<VisibilityEyeBloc, VisibilityEyeState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              onChanged: (value) {
                                context
                                    .read<SignInBloc>()
                                    .add(SignInEvent.passwordChanged(value));
                              },
                              isValidate: true,
                              textInputType: TextInputType.text,
                              textFieldType: TextFieldType.password,
                              obscureText: state.isPasswordShow,
                              textInputAction: TextInputAction.done,
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
                        BlocConsumer<SignInBloc, SignInState>(
                          listener: (context, state) {
                            if (state.state.isLoaded) {
                              context.replace(RoutesName.bottomBar);
                              const TopSnackBar(message: "Login successful");
                            } else if (state.state.isError) {
                              showTopSnackBar(
                                  context, "Email or Password is wrong!",
                                  backgroundColor: red);
                            }
                          },
                          builder: (context, state) {
                            return CustomElevatedButton(
                              isLoading: state.state.isLoading,
                              label: "Sign In",
                              backgroundColor: purple,
                              labelColor: white,
                              borderColor: Colors.transparent,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context
                                      .read<SignInBloc>()
                                      .add(const SignInEvent.loginUser());
                                }
                              },
                            );
                          },
                        ),
                        5.hx,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("Don't hava an account?"),
                            5.wx,
                            InkWell(
                              onTap: () {
                                context.goNamed(RoutesName.signUpScreen2);
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: purple,
                                    decorationColor: purple),
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
      ),
    );
  }
}
