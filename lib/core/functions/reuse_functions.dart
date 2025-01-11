import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

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

  static Widget loader({Color? color}) {
    return CircularProgressIndicator(
      color: color ?? purple,
    );
  }

  static void httpErrorHandled(
      {required http.Response res,
      required BuildContext context,
      required VoidCallback onSuccess}) {
    switch (res.statusCode) {
      case 200:
        onSuccess();
        break;

      case 400:
        showSnackBar(context: context, content: jsonDecode(res.body)['msg']);
        break;

      case 500:
        showSnackBar(context: context, content: jsonDecode(res.body)['msg']);

        break;

      default:
        showSnackBar(context: context, content: jsonDecode(res.body)['msg']);

        break;
    }
  }

  static String getFormattedDate(String date) {
    return DateFormat.yMMMd().format(DateTime.parse(date));
  }

  static Future<String> uploadToCloudinary(XFile image) async {
    final cloudinary = CloudinaryPublic("diarrqynw", "tgqozbcc");

    CloudinaryResponse res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path, folder: "User Profile"));

    debugPrint('----------- ${res.secureUrl} ------------');

    return res.secureUrl;
  }

  //Show date picker
  static Future<void> showDatePicker(
      {required BuildContext context,
      required void Function(dynamic event) onDateSelected,
      DateTime? firstDate,
      DateTime? lastDate,
      DateTime? currentDate}) async {
    final List<DateTime?>? selectedDates = await showCalendarDatePicker2Dialog(
      context: context,
      dialogBackgroundColor: white,
      config: CalendarDatePicker2WithActionButtonsConfig(
          calendarType: CalendarDatePicker2Type.single,
          lastDate: lastDate ?? DateTime.now(),
          firstDate: firstDate ?? DateTime(1900),
          currentDate: currentDate ?? DateTime.now(),
          cancelButtonTextStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: 14, color: purple),
          okButtonTextStyle: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontSize: 14, color: purple),
          selectedDayHighlightColor: purple),
      dialogSize: const Size(325, 400),
    );

    if (selectedDates != null && selectedDates.first != null) {
      onDateSelected(selectedDates.first);
    }
  }
}
