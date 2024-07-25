import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ReusableFunctions {
  static double getHeight(
      {required BuildContext context, required double height}) {
    return MediaQuery.of(context).size.height * height;
  }

  static double getwidth(
      {required BuildContext context, required double width}) {
    return MediaQuery.of(context).size.width * width;
  }

  static showSnackBar({
    required BuildContext context,
    required String content,
    Color? backgroundColor,
    Duration? duration,
  }) {
    var snack = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      duration: duration ??
          const Duration(
              milliseconds: 4000), // Default duration if not provided
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: backgroundColor ?? green,
      content: Text(content),
    );

    // Hide any currently displayed SnackBar
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show the created SnackBar
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

  static Widget loader() {
    return const CircularProgressIndicator(
      color: white,
    );
  }
}
