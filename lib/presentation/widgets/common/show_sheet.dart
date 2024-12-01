
import 'package:construction_mate/logic/controllers/bottomsheet/bottomsheet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

ShowSheet(BuildContext context, Widget content,
    {Color? bgcolor,
    bool isDismissible = true,
    bool isScrollControlled = true}) {
  context.read<BottomsheetBloc>().add(const BottomsheetEvent.openBottomSheet(true));
  return showModalBottomSheet(
      context: context,
      builder: (context) => content,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: bgcolor ?? Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ))).whenComplete(() {
    // Trigger the close bottom sheet event
    context
        .read<BottomsheetBloc>()
        .add(const BottomsheetEvent.openBottomSheet(false));
  });
}