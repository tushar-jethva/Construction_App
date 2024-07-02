import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionTopWidget extends StatelessWidget {
  const TransactionTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 130.h,
      collapsedHeight: 130.h,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      flexibleSpace: Container(
        margin: EdgeInsets.only(
            top: 15.h, left: 10.w, right: 10.w, bottom: 10.w),
        decoration: BoxDecoration(
            color: greyLight,
            borderRadius: BorderRadius.circular(15.r)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TransactionStatusWidget(
                    upperText: "Total +ve",
                    belowText: "12000",
                    upperTextColor: black,
                    belowTextColor: green,
                  ),
                  const MyVerticalDivider(),
                  TransactionStatusWidget(
                    upperText: "Total -ve",
                    belowText: "12000",
                    upperTextColor: black,
                    belowTextColor: red,
                  ),
                  const MyVerticalDivider(),
                  const TransactionStatusWidget(
                    upperText: "Total",
                    belowText: "0",
                    upperTextColor: black,
                    belowTextColor: black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}