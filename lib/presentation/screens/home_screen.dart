import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/home_screen_app_bar.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

/* Created By: Tushar Jethva
*/
class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 50.h,
          floating: true,
          surfaceTintColor: Colors.transparent,
          flexibleSpace: const MyHomeScreenAppBar(),
        ),
        SliverAppBar(
          expandedHeight: 100.h,
          collapsedHeight: 100.h,
          surfaceTintColor: Colors.transparent,
          pinned: true,
          flexibleSpace: Container(
            margin: EdgeInsets.only(
                top: 20.h, left: 10.w, right: 10.w, bottom: 10.w),
            decoration: BoxDecoration(
                color: Color.fromARGB(82, 224, 224, 224),
                borderRadius: BorderRadius.circular(15.r)),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
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
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, int index) {
              return ListTile(
                leading: Container(
                    padding: EdgeInsets.all(8),
                    width: 100,
                    child: Placeholder()),
                title: Text('Place ${index + 1}', textScaleFactor: 2),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ));
  }
}
