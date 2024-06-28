import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/home_screen_app_bar.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

/* Created By: Tushar Jethva
*/
class MyProjectScreen extends StatefulWidget {
  const MyProjectScreen({super.key});

  @override
  State<MyProjectScreen> createState() => _MyProjectScreenState();
}

class _MyProjectScreenState extends State<MyProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
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
              SliverToBoxAdapter(
                child: SizedBox(height: 50.h), // Spacer for bottom bar
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(left: 10.w, right: 10.w),
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCustomButton(
                    buttonName: "Payment In",
                    color: green,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.add_circle_rounded,
                        color: Colors.deepPurple,
                        size: 30,
                      )),
                  MyCustomButton(
                    buttonName: "Payment Out",
                    color: red,
                    style: const TextStyle(
                        color: white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
