import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomButton extends StatelessWidget {
  final String buttonName;
  final Color color;
  final TextStyle style;
  final Function() onPressed;
  const MyCustomButton(
      {super.key,
      required this.buttonName,
      required this.color,
      required this.style,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 8.h),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12.r)),
        child: Text(
          buttonName,
          style: style,
        ),
      ),
    );
  }
}
