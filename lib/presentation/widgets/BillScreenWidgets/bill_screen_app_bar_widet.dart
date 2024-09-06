import 'package:construction_mate/presentation/widgets/BillScreenWidgets/custom_top_bill_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyBillScreenAppBarWidget extends StatefulWidget {
  const MyBillScreenAppBarWidget({super.key});

  @override
  State<MyBillScreenAppBarWidget> createState() =>
      _MyBillScreenAppBarWidgetState();
}

class _MyBillScreenAppBarWidgetState extends State<MyBillScreenAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: theme.cardColor, borderRadius: BorderRadius.circular(10.r)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyCustomTopBillWidget(
                title: "TDS",
                amount: "1111.11",
              ),
              MyCustomTopBillWidget(
                title: "Received",
                amount: "1111.11",
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyCustomTopBillWidget(
                title: "GST",
                amount: "1111.11",
              ),
              MyCustomTopBillWidget(
                title: "Receivable",
                amount: "1111.11",
              )
            ],
          )
        ],
      ),
    );
  }
}
