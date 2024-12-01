import 'package:construction_mate/utilities/extension/sized_box_extension.dart';
import 'package:flutter/material.dart';

class ErrorHandlingDialog extends StatelessWidget {
  const ErrorHandlingDialog({
    Key? key,
    required this.errorTitle,
    required this.responseCode,
    required this.responseMessage,
  }) : super(key: key);

  final String errorTitle;
  final int responseCode;
  final String responseMessage;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            16.hx,
            Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 9),
              child: Text(responseCode == 200 ? 'Awesome' : errorTitle,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: responseCode == 200
                          ? Theme.of(context).textTheme.headlineMedium!.color
                          : Theme.of(context).colorScheme.error)),
            ),
            Text(responseMessage,
                softWrap: true,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: responseCode == 200
                        ? Theme.of(context).textTheme.headlineMedium!.color
                        : Theme.of(context).colorScheme.error)),
            8.hx,
          ],
        ),
      ),
    );
  }
}
