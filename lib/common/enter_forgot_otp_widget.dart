import 'package:construction_mate/common/enter_otp_dialog.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignUp/sign_up_bloc.dart';
import 'package:construction_mate/logic/controllers/Authentication/forgot_password/forgot_password_bloc.dart';
import 'package:construction_mate/logic/controllers/Authentication/verify_otp/verify_otp_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnterForgotOtpWidget extends StatelessWidget {
  const EnterForgotOtpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<VerifyOtpBloc, VerifyOtpState>(
      listener: (context, state) {
        if (state.state.isLoaded) {
          // showTopSnackBar(context, "Password reset successfully",
          //     messageType: MessageType.done);
          context.pushNamed(RoutesName.NEW_PASSWORD_SCREEN_NAME);
          // context
          //     .read<VerifyOtpBloc>()
          //     .add(const Ver.onIsVerifiedChanged(isVerified: true));

          // context.pop();

          // context.goNamed(RoutesName.signUpScreen2);
        } else if (state.state.isError) {
          showTopSnackBar(context, "Wrong OTP!",
              messageType: MessageType.error);
        }
      },
      builder: (context, state) {
        return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
          builder: (context, fstate) {
            return EnterOTPDialog(
              onResendTap: () {
                context
                    .read<ForgotPasswordBloc>()
                    .add(const ForgotPasswordEvent.sendForgotPasswordOtp());
              },
              otpOnChanged: (value) {
                context
                    .read<VerifyOtpBloc>()
                    .add(VerifyOtpEvent.onOtpChanged(otp: value));
              },
              isLoading: state.state.isLoading,
              theme: Theme.of(context),
              onVerifyTap: () {
                if (state.otp.isEmpty) {
                  showTopSnackBar(context, "Please Enter otp!",
                      messageType: MessageType.warning);
                } else {
                  context
                      .read<VerifyOtpBloc>()
                      .add(const VerifyOtpEvent.onVerifyOtp());
                }
              },
              enterOtpText: "Enter OTP",
              otpMessage:
                  "A verification codes has been sent to ${fstate.email}",
              didNotRecieveText: "Didn’t receive the code?",
              resendText: "Resend",
              verifyButtonText: "Verify",
            );
          },
        );
      },
    );
  }
}
