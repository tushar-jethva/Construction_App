import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';

class TransactionStatusWidget extends StatelessWidget {
  final String upperText;
  final String belowText;
  final TextStyle belowTextStyle;
  final TextStyle upperTextStyle;
  const TransactionStatusWidget({
    super.key,
    required this.upperText,
    required this.belowText,
    required this.belowTextStyle,
    required this.upperTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: theme.scaffoldBackgroundColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.wallet_rounded,
              color: theme.canvasColor,
            ),
            5.hx,
            Text(
              upperText,
              style: upperTextStyle,
            ),
            40.hx,
            Text(
              belowText,
              style: belowTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
