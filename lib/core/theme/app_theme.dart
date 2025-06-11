import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const String font1 = 'Poppins';
  static const Color _lightTextColor = black;
  static const Color _darkTextColor = white;

  static const Color gray500 = Color.fromRGBO(157, 164, 158, 1);

  static const TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 40,
      color: _lightTextColor,
      fontWeight: FontWeight.w800,
      fontFamily: font1,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      color: _lightTextColor,
      fontWeight: FontWeight.w700,
      fontFamily: font1,
    ),
    headlineSmall: TextStyle(
      fontSize: 26,
      color: _lightTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      color: _lightTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: _lightTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: _lightTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: _lightTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
  );
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: white,
      cardColor: greyLight,
      hoverColor: highlightColor,
      primaryColor: purple,
      hintColor: white,
      textTheme: _lightTextTheme,
      indicatorColor: purple,
      canvasColor: black,
      radioTheme: RadioThemeData(fillColor: WidgetStatePropertyAll(purple)));

  static const TextTheme _darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 40,
      color: _darkTextColor,
      fontWeight: FontWeight.w800,
      fontFamily: font1,
    ),
    headlineMedium: TextStyle(
      fontSize: 32,
      color: _darkTextColor,
      fontWeight: FontWeight.w700,
      fontFamily: font1,
    ),
    headlineSmall: TextStyle(
      fontSize: 26,
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleLarge: TextStyle(
      fontSize: 18,
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      color: _darkTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      color: _darkTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelMedium: TextStyle(
      fontSize: 12,
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelSmall: TextStyle(
      fontSize: 10,
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: blackBackgroundColor,
      cardColor: darkCardColor,
      hoverColor: darkShimmerColor,
      primaryColor: purple,
      canvasColor: white,
      hintColor: darkCardColor,
      indicatorColor: purple,
      textTheme: _darkTextTheme,
      radioTheme: RadioThemeData(fillColor: WidgetStatePropertyAll(purple)));
}
