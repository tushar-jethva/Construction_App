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

  static showSnackBar(
      {required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }
}
