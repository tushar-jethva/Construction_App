import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomButton extends StatelessWidget {
  final String buttonName;
  final Color color;
  final TextStyle style;
  const MyCustomButton(
      {super.key,
      required this.buttonName,
      required this.color,
      required this.style});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 8.h),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(12.r)),
      child: Text(
        buttonName,
        style: style,
      ),
    );
  }
}
