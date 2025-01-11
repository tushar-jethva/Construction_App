import 'package:flutter/material.dart';

class ErrorAndNotFoundWidget extends StatelessWidget {
  final String text;
  const ErrorAndNotFoundWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child: Text(
              text,
              style: theme.textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
