import 'package:flutter/material.dart';

class TransactionStatusWidget extends StatelessWidget {
  final String upperText;
  final String belowText;
  final Color belowTextColor;
  final Color upperTextColor;
  const TransactionStatusWidget(
      {super.key,
      required this.upperText,
      required this.belowText,
      required this.belowTextColor,
      required this.upperTextColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          upperText,
          style: TextStyle(color: upperTextColor),
        ),
        Text(
          belowText,
          style: TextStyle(color: belowTextColor),
        )
      ],
    );
  }
}
