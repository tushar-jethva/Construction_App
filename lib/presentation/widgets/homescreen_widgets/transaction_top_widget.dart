import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/presentation/widgets/common/transaction_total_widget.dart';
import 'package:flutter/material.dart';

class TransactionTopWidget extends StatelessWidget {
  const TransactionTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      collapsedHeight:
          ReusableFunctions.getHeight(context: context, height: 0.1),
      expandedHeight:
          ReusableFunctions.getHeight(context: context, height: 0.1),
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pinned: true,
      flexibleSpace: const TransactionsTotalWidget(),
    );
  }
}
