import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/screens/project/building_screen.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/transaction_status_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/vertical_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProjectDetailsScreen extends StatefulWidget {
  const MyProjectDetailsScreen({super.key});

  @override
  State<MyProjectDetailsScreen> createState() => _MyProjectDetailsScreenState();
}

class _MyProjectDetailsScreenState extends State<MyProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TransactionStatusWidget(
                  upperText: "Advanced Paid",
                  belowText: "\$12000",
                  upperTextStyle: TextStyle(color: grey, fontSize: 12),
                  belowTextStyle: TextStyle(color: green, fontSize: 12),
                ),
                MyVerticalDivider(
                  height: 40.h,
                  width: 2.w,
                  color: grey,
                ),
                TransactionStatusWidget(
                  upperText: "Pending to Pay",
                  belowText: "\$12000",
                  upperTextStyle: TextStyle(color: grey, fontSize: 12),
                  belowTextStyle: TextStyle(color: red, fontSize: 12),
                ),
              ],
            ),
          ),
          bottom: TabBar(
            onTap: (index) {},
            tabs: const [
              Tab(text: 'Parties'),
              Tab(text: 'Buildings'),
              Tab(text: 'Transactions'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Paties Tab')),
            BuildingsScreen(),
            Center(child: Text('Transactions Tab')),
          ],
        ),
      ),
    );
  }
}
