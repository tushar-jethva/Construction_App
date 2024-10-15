import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyCustomButton extends StatelessWidget {
  final String buttonName;
  final Color? color;
  final Color? borderColor;
  final TextStyle? style;
  final Function() onPressed;
  final bool isLoading;
  const MyCustomButton(
      {super.key,
      required this.buttonName,
      this.color,
      this.style,
      required this.onPressed,
      this.borderColor,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: isLoading
          ? const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpinKitThreeBounce(
                  size: 15,
                  color: Colors.white,
                ),
              ],
            )
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 8.h),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: borderColor ?? Colors.transparent),
                  color: color,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Text(
                buttonName,
                style: style,
              ),
            ),
    );
  }
}
