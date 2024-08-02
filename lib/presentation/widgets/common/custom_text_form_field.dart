import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MyCustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType textInputType;
  final String? Function(String? value) validator;
  const MyCustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.maxLines,
      required this.textInputType,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
        onTapOutside: (val) {
          FocusScope.of(context).unfocus();
        },
        controller: controller,
        maxLines: maxLines,
        keyboardType: textInputType,
        style: theme.textTheme.titleMedium,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.titleMedium!.copyWith(color: grey),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: grey, width: 1)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: red, width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: grey, width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: grey, width: 1)),
        ),
        validator: validator);
  }
}
