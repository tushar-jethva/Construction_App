import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: white,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w500, color: black),
          titleLarge: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, color: black),
          titleMedium: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w400, color: black)),
      canvasColor: black);

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: black,
      canvasColor: white,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w500, color: white),
          titleLarge: TextStyle(
              fontFamily: 'Roboto', fontWeight: FontWeight.w700, color: white),
          titleMedium: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w400,
              color: white)));
}
