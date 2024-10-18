// ignore_for_file: constant_identifier_names

import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/presentation/widgets/common/debouncer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

enum TextFieldType {
  alphabet,
  email,
  text,
  password,
  phoneNumber,
  number,
  custom
}

class CustomTextFormField extends StatelessWidget {
  final _debouncer = Debouncer(milliseconds: 500);
  CustomTextFormField(
      {super.key,
      this.controller,
      this.textFieldType = TextFieldType.text,
      this.hintText,
      this.helperText,
      this.onChanged,
      this.maxLength,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.maxLines = 1,
      this.helperMaxLines,
      this.textAlign = TextAlign.left,
      this.inputFormatters,
      this.enabled = true,
      this.isReadOnly = false,
      this.textInputAction,
      this.textInputType,
      this.minLength = 1,
      this.minline = 1,
      this.onTap,
      this.alignLableWithHint = false,
      this.isValidate = true,
      this.customvalidation,
      this.initialValue,
      this.obscureText = false,
      this.textFieldStyle,
      this.enableBorder,
      this.focusedBorder,
      this.focusNode,
      this.themedata,
      this.backgroundColor,
      this.onTapOutside});

  final TextEditingController? controller;
  final TextFieldType textFieldType;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;
  final int? helperMaxLines;
  final int? maxLength;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final int minLength;
  final int minline;
  final Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool isReadOnly;
  final bool alignLableWithHint;
  final bool isValidate;
  final String? customvalidation;
  final String? initialValue;
  final bool obscureText;
  final TextStyle? textFieldStyle;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final FocusNode? focusNode;
  final ThemeData? themedata;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final customValidator = MultiValidator([
      RequiredValidator(
        errorText: customvalidation ?? "",
      ),
    ]);

    final alphabetValidator = MultiValidator([
      RequiredValidator(
        errorText: "Please enter a value",
      ),
      PatternValidator(
        r'^[A-Za-z_ .,]+$',
        errorText: "Invalid data format",
      ),
    ]);

    final emailValidator = MultiValidator([
      RequiredValidator(
        errorText: "Please enter your email address",
      ),
      EmailValidator(
        errorText: "Invalid email address format",
      )
    ]);

    final passwordValidator = MultiValidator([
      RequiredValidator(
        errorText: "Please enter your password",
      ),
      MinLengthValidator(
        6,
        errorText: "Password must be more than 6 characters",
      )
    ]);

    final phoneNumberValidator = MultiValidator([
      RequiredValidator(
        errorText: "Please enter your phone number",
      ),
      MinLengthValidator(
        7,
        errorText: "Invalid phone number format",
      ),
      PatternValidator(
        r'^[0-9]+$',
        errorText: "Invalid phone number format",
      ),
    ]);

    final textValidator = MultiValidator([
      RequiredValidator(
        errorText: "Please enter a value",
      ),
      MinLengthValidator(
        minLength,
        errorText: "Data is too short",
      ),
    ]);

    final numberValidator = MultiValidator([
      RequiredValidator(
        errorText: "Please enter a value",
      ),
      MinLengthValidator(
        1,
        errorText: "Data is too short",
      ),
      PatternValidator(
        r'^[0-9]+$',
        errorText: "Invalid number format",
      ),
    ]);

    TextInputType keyboardType(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.custom:
          return TextInputType.text;
        case TextFieldType.alphabet:
          return TextInputType.text;
        case TextFieldType.email:
          return TextInputType.emailAddress;
        case TextFieldType.number:
          return TextInputType.number;
        case TextFieldType.password:
          return TextInputType.text;
        case TextFieldType.phoneNumber:
          return TextInputType.phone;
        case TextFieldType.text:
          return TextInputType.text;
      }
    }

    MultiValidator validator(TextFieldType textFieldType) {
      switch (textFieldType) {
        case TextFieldType.custom:
          return customValidator;
        case TextFieldType.alphabet:
          return alphabetValidator;
        case TextFieldType.email:
          return emailValidator;
        case TextFieldType.number:
          return numberValidator;
        case TextFieldType.password:
          return passwordValidator;
        case TextFieldType.phoneNumber:
          return phoneNumberValidator;
        case TextFieldType.text:
          return textValidator;
      }
    }

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    const double SPACE12 = 12;
    const double RADIUS = 8;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: TextFormField(
        initialValue: initialValue,
        readOnly: isReadOnly,
        controller: controller,
        onTapOutside: onTapOutside,
        focusNode: focusNode,
        cursorColor: purple,
        onTap: onTap,
        maxLines: maxLines,
        maxLength: maxLength,
        enabled: enabled,
        textAlign: textAlign ?? TextAlign.left,
        obscureText: obscureText,
        style: textFieldStyle ??
            theme?.textTheme.titleMedium
                ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        inputFormatters: inputFormatters ?? [],
        keyboardType: textInputType ?? keyboardType(textFieldType),
        validator: isValidate ? validator(textFieldType).call : null,
        textInputAction: textInputAction,
        minLines: minline,
        onChanged: (text) => _debouncer.run(() {
          onChanged!(text);
        }),
        decoration: InputDecoration(
          fillColor: backgroundColor ?? Colors.transparent,
          alignLabelWithHint: alignLableWithHint,
          label: Text(
            hintText.toString(),
            style: theme.textTheme.titleMedium!.copyWith(color: grey),
          ),
          hintText: hintText,
          hintStyle: theme.textTheme.titleMedium!.copyWith(color: grey),
          labelText: alignLableWithHint ? labelText : null,
          labelStyle: theme?.textTheme.titleMedium?.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: isDarkMode ? Colors.white54 : Colors.black54),
          floatingLabelStyle: theme?.textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: isDarkMode ? Colors.white54 : Colors.black54),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          helperMaxLines: helperMaxLines,
          helperText: helperText,
          helperStyle: theme?.textTheme.titleSmall
              ?.copyWith(fontSize: 10, fontWeight: FontWeight.w400),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: SPACE12, vertical: 16),
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
      ),
    );
  }
}
