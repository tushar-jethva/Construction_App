import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MyHomeScreenAppBar extends StatelessWidget {
  const MyHomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 35.h),
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
            onTap: () {
              ReusableFunctions.showSnackBar(
                  context: context, content: "Testing");
            },
            child: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
    );
  }
}
