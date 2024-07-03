import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/custom_button_widget.dart';
import 'package:construction_mate/presentation/widgets/homescreen_widgets/project_add_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionBottomWidget extends StatefulWidget {
  const TransactionBottomWidget({
    super.key,
  });

  @override
  State<TransactionBottomWidget> createState() =>
      _TransactionBottomWidgetState();
}

class _TransactionBottomWidgetState extends State<TransactionBottomWidget> {
  openBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return const MyProjectAddBottomSheet();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.only(left: 10.w, right: 10.w),
        height: 50.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCustomButton(
              buttonName: "Payment In",
              color: green,
              style: const TextStyle(
                  color: white, fontWeight: FontWeight.w500, fontSize: 15),
              onPressed: () {},
            ),
            InkWell(
                onTap: () {
                  openBottomSheet(context: context);
                },
                child: const Icon(
                  Icons.add_circle_rounded,
                  color: Colors.deepPurple,
                  size: 30,
                )),
            MyCustomButton(
              buttonName: "Payment Out",
              color: red,
              style: const TextStyle(
                  color: white, fontWeight: FontWeight.w500, fontSize: 15),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
