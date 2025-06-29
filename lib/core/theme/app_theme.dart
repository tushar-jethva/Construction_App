import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import flutter_screenutil

class AppTheme {
  static const String font1 = 'Poppins';
  static const Color _lightTextColor = black;
  static const Color _darkTextColor = white;

  static const Color gray500 = Color.fromRGBO(157, 164, 158, 1);

  // THIS WILL LIKELY CAUSE ERRORS OR INCORRECT SCALING AT RUNTIME
  // because .sp requires a BuildContext, which is not available for a static const
  static final TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 40.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w800,
      fontFamily: font1,
    ),
    headlineMedium: TextStyle(
      fontSize: 32.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w700,
      fontFamily: font1,
    ),
    headlineSmall: TextStyle(
      fontSize: 26.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleLarge: TextStyle(
      fontSize: 18.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleMedium: TextStyle(
      fontSize: 14.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp, // .sp added
      color: _lightTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    labelLarge: TextStyle(
      fontSize: 12.sp, // .sp added
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp, // .sp added
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp, // .sp added
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
  );

  // THIS WILL ALSO LIKELY CAUSE ISSUES because _lightTextTheme will fail
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: white,
      cardColor: greyLight,
      hoverColor: highlightColor,
      primaryColor: white,
      hintColor: white,
      textTheme: _lightTextTheme, // Using the static const TextTheme
      indicatorColor: purple,
      canvasColor: black,
      dividerColor: white,
      radioTheme: RadioThemeData(fillColor: WidgetStatePropertyAll(purple)));

  // THIS WILL LIKELY CAUSE ERRORS OR INCORRECT SCALING AT RUNTIME
  // because .sp requires a BuildContext, which is not available for a static const
  static final TextTheme _darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 40.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w800,
      fontFamily: font1,
    ),
    headlineMedium: TextStyle(
      fontSize: 32.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w700,
      fontFamily: font1,
    ),
    headlineSmall: TextStyle(
      fontSize: 26.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleLarge: TextStyle(
      fontSize: 18.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w600,
      fontFamily: font1,
    ),
    titleMedium: TextStyle(
      fontSize: 16.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    titleSmall: TextStyle(
      fontSize: 14.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w500,
      fontFamily: font1,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp, // .sp added
      color: _darkTextColor,
      fontWeight: FontWeight.w400,
      fontFamily: font1,
    ),
    labelLarge: TextStyle(
      fontSize: 14.sp, // .sp added
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelMedium: TextStyle(
      fontSize: 12.sp, // .sp added
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
    labelSmall: TextStyle(
      fontSize: 10.sp, // .sp added
      color: gray500,
      fontWeight: FontWeight.w300,
      fontFamily: font1,
    ),
  );

  // THIS WILL ALSO LIKELY CAUSE ISSUES because _darkTextTheme will fail
  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: blackBackgroundColor,
      cardColor: darkCardColor,
      hoverColor: darkShimmerColor,
      primaryColor: black,
      canvasColor: white,
      hintColor: darkCardColor,
      indicatorColor: purple,
      textTheme: _darkTextTheme, // Using the static const TextTheme
      radioTheme: RadioThemeData(fillColor: WidgetStatePropertyAll(purple)));
}
