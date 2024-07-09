import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class MyCustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  final TextInputType textInputType;
  const MyCustomTextFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.maxLines,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
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
      validator: (value) {
        
        if (value == null || value.isEmpty) {
          return "Please fill the $hintText";
        }
      },
    );
  }
}
