import 'package:construction_mate/common/enter_forgot_otp_widget.dart';
import 'package:construction_mate/common/enter_otp_widget.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/enum.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignIn/sign_in_bloc.dart';
import 'package:construction_mate/logic/controllers/Authentication/forgot_password/forgot_password_bloc.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class ForgotEmailScreen extends StatelessWidget {
  ForgotEmailScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: GestureDetector(
            onTap: () {
              context.pop();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
      ),
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
              30.hx,
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
                          context.read<ForgotPasswordBloc>().add(
                              ForgotPasswordEvent.onEmailChanged(email: value));
                        },
                      ),
                      20.hx,
                      BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state.state == ForgotState.otpSent) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const EnterForgotOtpWidget();
                              },
                              barrierColor: Colors.transparent.withOpacity(0.6),
                              barrierDismissible: false,
                            ).then((value) {
                              
                              // context.read<SignUpBloc>().add(
                              //     const SignUpEvent.isDialogOpen(
                              //         isDialogOpen: false));
                            });
                          } else if (state.state == ForgotState.otpSentFailed) {
                            showTopSnackBar(context,
                                "Email verification failed or User not exist!",
                                messageType: MessageType.error);
                          }
                        },
                        builder: (context, state) {
                          return CustomElevatedButton(
                            isLoading: state.state == ForgotState.otpSending,
                            label: "Verify Email",
                            backgroundColor: purple,
                            labelColor: white,
                            borderColor: Colors.transparent,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                context.read<ForgotPasswordBloc>().add(
                                    const ForgotPasswordEvent
                                        .sendForgotPasswordOtp());
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              30.hx,
            ],
          ),
        ),
      ),
    );
  }
}
