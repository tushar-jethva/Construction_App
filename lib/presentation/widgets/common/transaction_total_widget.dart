import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsTotalWidget extends StatelessWidget {
  const TransactionsTotalWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h, left: 10.w, right: 10.w, bottom: 10.w),
      decoration: BoxDecoration(
          color: greyLight, borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransactionStatusWidget(
                  upperText: "Total +ve",
                  belowText: "12000",
                  upperTextStyle: TextStyle(color: grey),
                  belowTextStyle: TextStyle(color: green),
                ),
                MyVerticalDivider(
                  height: 70.h,
                  width: 2.w,
                  color: grey,
                ),
                TransactionStatusWidget(
                  upperText: "Total -ve",
                  belowText: "12000",
                  upperTextStyle: TextStyle(color: grey),
                  belowTextStyle: TextStyle(color: red),
                ),
                MyVerticalDivider(
                  height: 70.h,
                  width: 2.w,
                  color: grey,
                ),
                const TransactionStatusWidget(
                  upperText: "Total",
                  belowText: "0",
                  upperTextStyle: TextStyle(color: grey),
                  belowTextStyle: TextStyle(color: black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
