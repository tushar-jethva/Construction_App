import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const MyCustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.maxLines});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: theme.textTheme.titleMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.titleMedium!.copyWith(color: grey),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: grey, width: 1)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: grey, width: 1)),
      ),
    );
  }
}
