import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: white,
      cardColor: greyLight,
      hoverColor: highlightColor,
      textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500,
              color: textColor),
          titleLarge: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
              color: textColor),
          titleMedium: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              color: textColor)),
      canvasColor: black);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: blackBackgroundColor,
      cardColor: darkCardColor,
      hoverColor: darkShimmerColor,
      canvasColor: white,
      textTheme:  TextTheme(
          bodyMedium: TextStyle(
              fontFamily: 'Montserrat', fontWeight: FontWeight.w500, color: darkTextColor),
          titleLarge: TextStyle(
              fontFamily: 'Montserrat', fontWeight: FontWeight.w700, color: darkTextColor),
          titleMedium: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w400,
              color: darkTextColor)));
}
