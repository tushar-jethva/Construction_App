import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/gen/assets.gen.dart';
import 'package:construction_mate/logic/controllers/Authentication/reset_password/reset_password_bloc.dart';
import 'package:construction_mate/logic/controllers/VisibillityBloc/visibility_eye_bloc.dart';
import 'package:construction_mate/presentation/widgets/common/common_button.dart';
import 'package:construction_mate/presentation/widgets/common/common_text_form_field.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class NewPasswordScreen extends StatelessWidget {
  NewPasswordScreen({super.key});
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
                    BlocBuilder<VisibilityEyeBloc, VisibilityEyeState>(
                      builder: (context, state) {
                        return CustomTextFormField(
                          onChanged: (value) {
                            context.read<ResetPasswordBloc>().add(
                                ResetPasswordEvent.onPasswordChanged(
                                    password: value));
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
                              context.read<ResetPasswordBloc>().add(
                                  ResetPasswordEvent.onConfPasswordChanged(
                                      confPassword: value));
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
                    BlocConsumer<ResetPasswordBloc, ResetPasswordState>(
                      listener: (context, state) {
                        if (state.state.isLoaded) {
                          // print("================ reset password ===========");
                          showTopSnackBar(
                              context, "Successfully password changed",
                              messageType: MessageType.done);
                          context.goNamed(RoutesName.signInScreen);
                        }
                      },
                      builder: (context, state) {
                        return BlocBuilder<ResetPasswordBloc,
                            ResetPasswordState>(
                          builder: (context, state) {
                            return CustomElevatedButton(
                              isLoading: state.state.isLoading,
                              label: "Reset Password",
                              backgroundColor: purple,
                              labelColor: white,
                              borderColor: Colors.transparent,
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (state.passoword != state.confPassword) {
                                    showTopSnackBar(context,
                                        "Password and Confirm password must be same!",
                                        messageType: MessageType.error);
                                  } else {
                                    context.read<ResetPasswordBloc>().add(
                                        const ResetPasswordEvent
                                            .resetPasswordTap());
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ]))),
    );
  }
}
