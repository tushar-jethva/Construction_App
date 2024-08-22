import 'package:construction_mate/core/functions/reuse_functions.dart';
import 'package:construction_mate/presentation/widgets/common/transaction_total_widget.dart';
import 'package:flutter/material.dart';

class TransactionTopWidget extends StatelessWidget {
  const TransactionTopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    // Define a minimum and maximum height for the SliverAppBar
    final double minHeight = screenHeight * 0.07; // 7% of screen height
    final double maxHeight = screenHeight * 0.09; // 9% of screen height

    // Ensure the heights are suitable for all screens
    final double appBarHeight = screenHeight < 600 ? minHeight : maxHeight;

    return SliverAppBar(
      expandedHeight: appBarHeight,
      collapsedHeight: appBarHeight,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      pinned: true,
      flexibleSpace: const TransactionsTotalWidget(),
    );
  }
}
