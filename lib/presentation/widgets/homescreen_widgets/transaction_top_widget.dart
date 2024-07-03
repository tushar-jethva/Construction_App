import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/common/transaction_total_widget.dart';
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
      expandedHeight: 80.h,
      collapsedHeight: 80.h,
      surfaceTintColor: Colors.transparent,
      pinned: true,
      flexibleSpace: const TransactionsTotalWidget(),
    );
  }
}
