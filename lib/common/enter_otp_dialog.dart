import 'dart:async';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class EnterOTPDialog extends StatefulWidget {
  final String enterOtpText;
  final String otpMessage;
  final String verifyButtonText;
  final String didNotRecieveText;
  final String resendText;
  final void Function() onVerifyTap;
  final void Function() onResendTap;
  final Function(String)? otpOnChanged;
  final ThemeData theme;
  final bool isLoading;

  const EnterOTPDialog({
    super.key,
    required this.enterOtpText,
    required this.otpMessage,
    required this.verifyButtonText,
    required this.didNotRecieveText,
    required this.resendText,
    required this.onVerifyTap,
    required this.theme,
    required this.onResendTap,
    this.otpOnChanged,
    this.isLoading = false,
  });

  @override
  _EnterOTPDialogState createState() => _EnterOTPDialogState();
}

class _EnterOTPDialogState extends State<EnterOTPDialog> {
  bool isResendClickable = true;
  int countdown = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    isResendClickable = false;
    countdown = 30;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        setState(() {
          isResendClickable = true;
        });
        _timer?.cancel();
      } else {
        setState(() {
          countdown--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = widget.theme.textTheme;
    final theme = Theme.of(context);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 50,
      textStyle: theme.textTheme.bodyMedium,
      decoration: BoxDecoration(
        color: otpbackColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );

    // Define the theme when the pin is focused
    final focusedPinTheme = defaultPinTheme.copyWith(
      height: 54,
      decoration: BoxDecoration(
        color: otpbackColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
    );

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(24),
      elevation: 0,
      backgroundColor: theme.scaffoldBackgroundColor,
      
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.enterOtpText,
            style: textTheme.titleLarge?.copyWith(fontSize: 24),
          ),
          const SizedBox(height: 10),
          Text(
            widget.otpMessage,
            textAlign: TextAlign.center,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 20),
          Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            onChanged: widget.otpOnChanged,
          ),
          const SizedBox(height: 30),
          MyCustomButton(
            color: purple,
            buttonName: widget.verifyButtonText,
            onPressed: widget.onVerifyTap,
            isLoading: widget.isLoading,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.didNotRecieveText} ",
                style: textTheme.titleMedium?.copyWith(fontSize: 14),
              ),
              isResendClickable
                  ? InkWell(
                      onTap: () {
                        startTimer();
                        widget.onResendTap();
                      },
                      child: Text(
                        widget.resendText,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  : Text(
                      "${widget.resendText} ($countdown s)",
                      style: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    )
            ],
          )
        ],
      ),
    );
  }
}
