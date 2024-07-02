
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyVerticalDivider extends StatelessWidget {
  final double height;
  final Color color;
  final double width;
  const MyVerticalDivider({
    super.key, required this.height, required this.color, required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: color,
    );
  }
}
