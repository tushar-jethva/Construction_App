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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          upperText,
          style: upperTextStyle,
        ),
        Text(
          belowText,
          style: belowTextStyle,
        )
      ],
    );
  }
}
