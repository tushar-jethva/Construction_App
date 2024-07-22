import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;
  const ShimmerBox({
    super.key, required this.height, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(10.r)
      ),
    );
  }
}