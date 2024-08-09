import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/presentation/widgets/common/transaction_total_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionTopWidget extends StatelessWidget {
  const TransactionTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight:
          ReusableFunctions.getHeight(context: context, height: 0.12),
      collapsedHeight:
          ReusableFunctions.getHeight(context: context, height: 0.12),
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pinned: true,
      flexibleSpace: const TransactionsTotalWidget(),
    );
  }
}
