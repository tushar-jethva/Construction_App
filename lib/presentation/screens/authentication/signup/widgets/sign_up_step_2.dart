import 'package:construction_mate/common/enter_otp_widget.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignUp/sign_up_bloc.dart';
import 'package:construction_mate/logic/controllers/VisibillityBloc/visibility_eye_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
              60.hx,
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
                            textFieldType: TextFieldType.custom,
                            customvalidation: "Please enter company name",
                            hintText: "Company Name",
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.companyNameChanged(value));
                            },
                            maxLines: 1),
                        10.hx,
                        CustomTextFormField(
                            isValidate: true,
                            textInputType: TextInputType.emailAddress,
                            textFieldType: TextFieldType.email,
                            hintText: "Email",
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              context
                                  .read<SignUpBloc>()
                                  .add(SignUpEvent.emailOnChanged(value));
                              context.read<SignUpBloc>().add(
                                  SignUpEvent.onIsVerifiedChanged(
                                      isVerified: false));
                            },
                            maxLines: 1),
                        Align(
                          alignment: Alignment.centerRight,
                          child: BlocConsumer<SignUpBloc, SignUpState>(
                            listener: (context, state) {
                              if (state.state.isLoaded) {
                                if (state.screenState == 0) {
                                  context.pushNamed(RoutesName.signInScreen);
                                  showTopSnackBar(context,
                                      "Already have an account! Please login.",
                                      messageType: MessageType.warning);
                                } else if (state.screenState == 1) {
                                  context.read<SignUpBloc>().add(
                                      const SignUpEvent.onIsVerifiedChanged(
                                          isVerified: true));
                                } else if (state.screenState == 2) {
                                  if (!state.isDialogOpen) {
                                    context.read<SignUpBloc>().add(
                                        const SignUpEvent.isDialogOpen(
                                            isDialogOpen: true));
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const EnterOptwidget();
                                      },
                                      barrierColor:
                                          Colors.transparent.withOpacity(0.6),
                                      barrierDismissible: false,
                                    ).then((value) {
                                      context.read<SignUpBloc>().add(
                                          const SignUpEvent.isDialogOpen(
                                              isDialogOpen: false));
                                    });
                                  }
                                } else if (state.state.isError) {
                                  showTopSnackBar(
                                      context, "Something went wrong!",
                                      messageType: MessageType.error);
                                }
                              }
                            },
                            builder: (context, state) {
                              return GestureDetector(
                                onTap: () {
                                  if (state.email.isEmpty) {
                                    showTopSnackBar(
                                        context, "Please enter email!",
                                        messageType: MessageType.warning);
                                  } else if (!ReusableFunctions.isEmailValid(
                                      email: state.email)) {
                                    showTopSnackBar(
                                        context, "Please enter valid email!",
                                        messageType: MessageType.warning);
                                  } else {
                                    context.read<SignUpBloc>().add(
                                        const SignUpEvent.checkIsEmailExist());
                                  }
                                },
                                child: !state.state.isLoading
                                    ? !state.isVerified
                                        ? Text(
                                            "Verify your email",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: purple,
                                                color: purple),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SvgPicture.asset(
                                                  Assets.svg.trueIcon.path),
                                              Text(
                                                "Verified",
                                                style: TextStyle(
                                                    color: green,
                                                    decoration: TextDecoration
                                                        .underline,
                                                    decorationColor: green),
                                              )
                                            ],
                                          )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15.0),
                                            child: SpinKitThreeBounce(
                                              size: 15,
                                              color: purple,
                                            ),
                                          ),
                                        ],
                                      ),
                              );
                            },
                          ),
                        ),
                        10.hx,
                        BlocBuilder<VisibilityEyeBloc, VisibilityEyeState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              onChanged: (value) {
                                context
                                    .read<SignUpBloc>()
                                    .add(SignUpEvent.passwordChanged(value));
                              },
                              isValidate: true,
                              textInputType: TextInputType.text,
                              textFieldType: TextFieldType.password,
                              obscureText: state.isPasswordShow,
                              hintText: "Password",
                              textInputAction: TextInputAction.next,
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
                        10.hx,
                        BlocBuilder<VisibilityEyeBloc, VisibilityEyeState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                                onChanged: (value) {
                                  context.read<SignUpBloc>().add(
                                      SignUpEvent.confPasswordChanged(value));
                                },
                                isValidate: true,
                                textInputType: TextInputType.text,
                                textFieldType: TextFieldType.password,
                                hintText: "Confirm Password",
                                textInputAction: TextInputAction.next,
                                maxLines: 1,
                                obscureText: state.isConfPasswordShow,
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
                        BlocConsumer<SignUpBloc, SignUpState>(
                          listener: (context, state) {
                            if (state.state2.isLoaded) {
                              context.replace(RoutesName.bottomBar);
                            }
                          },
                          builder: (context, state) {
                            return BlocBuilder<SignUpBloc, SignUpState>(
                              builder: (context, state) {
                                return CustomElevatedButton(
                                  isLoading: state.state2.isLoading,
                                  label: "Sign Up",
                                  backgroundColor: purple,
                                  labelColor: white,
                                  borderColor: Colors.transparent,
                                  onTap: () {
                                    if (formKey.currentState!.validate() &&
                                        state.isVerified) {
                                      if (state.password !=
                                          state.confirmPassword) {
                                        showTopSnackBar(context,
                                            "Password and Confirm password must be same!",
                                            messageType: MessageType.error);
                                      } else {
                                        context
                                            .read<SignUpBloc>()
                                            .add(const SignUpEvent.addUser());
                                      }
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
                              child: Text(
                                "Sign In",
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
                  )),
              20.hx,
            ],
          ),
        ),
      ),
    );
  }
}
