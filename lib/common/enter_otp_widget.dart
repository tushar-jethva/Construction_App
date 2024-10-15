import 'package:construction_mate/common/enter_otp_dialog.dart';
import 'package:construction_mate/core/constants/routes_names.dart';
import 'package:construction_mate/presentation/router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class EnterOptwidget extends StatelessWidget {
  const EnterOptwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EnterOTPDialog(
      onResendTap: () {
        // context
        //     .read<AuthWithNumberBloc>()
        //     .add(AuthWithNumberEvent.resendOtp());
      },
      otpOnChanged: (value) {
        // context
        //     .read<AuthWithNumberBloc>()
        //     .add(AuthWithNumberEvent.otpChange(value));
      },
      theme: Theme.of(context),
      // isLoading: state.state == RequestState.loading,
      onVerifyTap: () {
        context.goNamed(RoutesName.signUpScreen2);
      },
      enterOtpText: "Enter OTP",
      otpMessage:
          "A verification codes has been sent to jethvatushar87@gmail.com",
      didNotRecieveText: "Didn’t receive the code?",
      resendText: "Resend",
      verifyButtonText: "Verify",
    );
  }
}
