import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomButtonWidget extends StatelessWidget {
  final Widget widget;
  final Color color;
  final Function() onPressed;
  const MyCustomButtonWidget(
      {super.key,
      required this.widget,
      required this.color,
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
          child: widget),
    );
  }
}
