// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCustomTopBillWidget extends StatelessWidget {
  final String title;
  final String amount;
  const MyCustomTopBillWidget({
    Key? key,
    required this.title,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(8),
      width: ReusableFunctions.getwidth(context: context, width: 0.3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: theme.scaffoldBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            maxLines: 2,
            style: theme.textTheme.bodyMedium!
                .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
          Text(
            amount,
            style: theme.textTheme.bodyMedium!
                .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
