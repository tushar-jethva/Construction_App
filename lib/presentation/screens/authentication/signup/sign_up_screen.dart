import 'package:construction_mate/common/enter_otp_widget.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/logic/controllers/VisibillityBloc/visibility_eye_bloc.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignUp/sign_up_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(MediaQuery.of(context).size.height * 0.2),
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
                          onChanged: (value) {
                            context
                                .read<SignUpBloc>()
                                .add(SignUpEvent.emailOnChanged(value));
                          },
                          hintText: "Email",
                          maxLines: 1),
                      10.hx,
                      BlocConsumer<SignUpBloc, SignUpState>(
                        listener: (context, state) {
                          if (state.state.isLoaded) {
                            if (state.screenState == 0) {
                              context.pushNamed(RoutesName.signInScreen);
                              const TopSnackBar(
                                  message:
                                      "Already have an account! Please login.");
                            } else if (state.screenState == 1) {
                              context.goNamed(RoutesName.signUpScreen2);
                            } else if (state.screenState == 2) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return const EnterOptwidget();
                                },
                                barrierColor:
                                    Colors.transparent.withOpacity(0.6),
                                barrierDismissible: false,
                              );
                            }
                          } else if (state.state.isError) {
                            ReusableFunctions.showSnackBar(
                                context: context,
                                content: "Something went wrong!");
                          }
                        },
                        builder: (context, state) {
                          return BlocBuilder<SignUpBloc, SignUpState>(
                            builder: (context, state) {
                              return CustomElevatedButton(
                                isLoading: state.state.isLoading,
                                label: "Next",
                                backgroundColor: purple,
                                labelColor: white,
                                borderColor: Colors.transparent,
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    context.read<SignUpBloc>().add(
                                        const SignUpEvent.checkIsEmailExist());
                                  }
                                },
                              );
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
                          InkWell(
                            onTap: () {
                              context.goNamed(RoutesName.signInScreen);
                              context
                                  .read<VisibilityEyeBloc>()
                                  .add(const VisibilityEyeEvent.initialize());
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
