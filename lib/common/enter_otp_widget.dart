import 'package:construction_mate/common/enter_otp_dialog.dart';
import 'package:construction_mate/core/constants/common_toast.dart';
import 'package:construction_mate/core/constants/constants.dart';
import 'package:construction_mate/logic/controllers/Authentication/SignUp/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EnterOptwidget extends StatelessWidget {
  const EnterOptwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.state1.isLoaded) {
          context
              .read<SignUpBloc>()
              .add(const SignUpEvent.onIsVerifiedChanged(isVerified: true));

          context.pop();

          // context.goNamed(RoutesName.signUpScreen2);
        } else if (state.state1.isError) {
          showTopSnackBar(context, "Wrong OTP!", messageType: MessageType.error);
        }
      },
      builder: (context, state) {
        return EnterOTPDialog(
          onResendTap: () {
            context
                .read<SignUpBloc>()
                .add(const SignUpEvent.checkIsEmailExist());
          },
          otpOnChanged: (value) {
            context.read<SignUpBloc>().add(SignUpEvent.otpOnChanged(value));
          },
          isLoading: state.state1.isLoading,
          theme: Theme.of(context),
          onVerifyTap: () {
            if (state.otp.isEmpty) {
              showTopSnackBar(context, "Please Enter otp!", messageType: MessageType.warning);
            } else {
              context.read<SignUpBloc>().add(const SignUpEvent.verifyOtp());
            }
          },
          enterOtpText: "Enter OTP",
          otpMessage: "A verification codes has been sent to ${state.email}",
          didNotRecieveText: "Didn’t receive the code?",
          resendText: "Resend",
          verifyButtonText: "Verify",
        );
      },
    );
  }
}
