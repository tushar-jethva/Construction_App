import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';

class TransactionStatusWidget extends StatelessWidget {
  final String upperText;
  final String belowText;
  final TextStyle belowTextStyle;
  final TextStyle upperTextStyle;
  final MainAxisSize? mainAxisSize;
  const TransactionStatusWidget(
      {super.key,
      required this.upperText,
      required this.belowText,
      required this.belowTextStyle,
      required this.upperTextStyle,
      this.mainAxisSize = MainAxisSize.min});

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
          mainAxisSize: mainAxisSize ?? MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
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
              ],
            ),
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
