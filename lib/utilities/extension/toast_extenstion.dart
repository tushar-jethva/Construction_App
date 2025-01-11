import 'package:flutter/material.dart';

extension ToastExtension on String {
  void showToast(
      {ShortToastType typeOfToast = ShortToastType.error,
      TextStyle? style,
      IconData? icon,
      required BuildContext context}) {
    final theme =
        ThemeData.light(); // Replace with your default or global theme

    showShortToast(
      message: this, // The string itself will be the message
      theme: theme,
      typeOfToast: typeOfToast,
      style: style,
      icon: icon, context: context,
    );
  }
}

enum ShortToastType { success, warning, info, error }

void showShortToast({
  required BuildContext context,
  required String message,
  ShortToastType typeOfToast = ShortToastType.error,
  required ThemeData theme,
  TextStyle? style,
  IconData? icon,
}) {
  Color backgroundColor;
  Color iconBackgroundColor;
  IconData iconI;

  // Customize based on snackbar type
  switch (typeOfToast) {
    case ShortToastType.success:
      backgroundColor = const Color.fromARGB(189, 76, 175, 79);
      iconBackgroundColor = Colors.green;
      iconI = icon ?? Icons.check_circle;
      break;

    case ShortToastType.error:
      backgroundColor = const Color.fromARGB(187, 217, 43, 43);
      iconBackgroundColor = Colors.red;
      iconI = icon ?? Icons.close;
      break;
    case ShortToastType.warning:
      backgroundColor = const Color.fromARGB(176, 255, 153, 0);
      iconBackgroundColor = Colors.orange;
      iconI = icon ?? Icons.warning;
      break;
    case ShortToastType.info:
      backgroundColor = const Color.fromARGB(156, 33, 149, 243);
      iconBackgroundColor = Colors.blue;
      iconI = icon ?? Icons.info;
      break;
  }

  final overlay = Overlay.of(context);
  late OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: MyToastWidget(
        backgroundColor: backgroundColor,
        message: message,
        iconBackgroundColor: iconBackgroundColor,
        icon: iconI,
        theme: theme,
        style: style,
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Remove the snackbar after a delay
  // Future.delayed(const Duration(seconds: 3), () {
  //   overlayEntry.remove();
  // });
  // ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(
  //     content: Align(
  //       alignment: Alignment.center, // Center the SnackBar content
  //       child: ConstrainedBox(
  //         constraints: BoxConstraints(
  //           maxWidth:
  //               MediaQuery.of(context).size.width * 0.8, // Max width constraint
  //         ),
  //         child: MyToastWidget(
  //           backgroundColor: backgroundColor,
  //           message: message,
  //           iconBackgroundColor: iconBackgroundColor,
  //           icon: iconI,
  //           theme: theme,
  //           style: style,
  //         ),
  //       ),
  //     ),
  //     behavior: SnackBarBehavior.floating,
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //   ),
  // );
}

class MyToastWidget extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color iconBackgroundColor;
  final IconData icon;
  final TextStyle? style;
  final ThemeData theme;

  const MyToastWidget({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.iconBackgroundColor,
    required this.icon,
    required this.theme,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Makes the row compact
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: iconBackgroundColor,
            ),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              message,
              overflow: TextOverflow.clip, // Handle long text
              style: style ??
                  theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
