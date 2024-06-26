import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyHomeScreenAppBar extends StatelessWidget {
  const MyHomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, top: 30.w, right: 10.w, bottom: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/assets.png'),
              ),
              Gap(10.h),
              const Text("Tushar Jethva")
            ],
          ),
          InkWell(
            onTap: () {},
            child: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
    );
  }
}
