
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyVerticalDivider extends StatelessWidget {
  const MyVerticalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 2.w,
      color: Colors.grey,
    );
  }
}
