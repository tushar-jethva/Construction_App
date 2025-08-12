import 'package:construction_mate/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const String font1 = 'Poppins';
  static const Color _lightTextColor = black;
  static const Color _darkTextColor = white;

  static const Color gray500 = Color.fromRGBO(157, 164, 158, 1);

  // Refactored to be a method to avoid runtime errors with .sp
  static TextTheme _lightTextTheme() => TextTheme(
        headlineLarge: TextStyle(
          fontSize: 40.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w800,
          fontFamily: font1,
        ),
        headlineMedium: TextStyle(
          fontSize: 32.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w700,
          fontFamily: font1,
        ),
        headlineSmall: TextStyle(
          fontSize: 26.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: font1,
        ),
        titleLarge: TextStyle(
          fontSize: 18.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: font1,
        ),
        titleMedium: TextStyle(
          fontSize: 14.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w500,
          fontFamily: font1,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w500,
          fontFamily: font1,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: font1,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: font1,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          color: _lightTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: font1,
        ),
        labelLarge: TextStyle(
          fontSize: 12.sp,
          color: gray500,
          fontWeight: FontWeight.w300,
          fontFamily: font1,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          color: gray500,
          fontWeight: FontWeight.w300,
          fontFamily: font1,
        ),
        labelSmall: TextStyle(
          fontSize: 10.sp,
          color: gray500,
          fontWeight: FontWeight.w300,
          fontFamily: font1,
        ),
      );

  // Refactored to be a method to avoid runtime errors with .sp
  static TextTheme _darkTextTheme() => TextTheme(
        headlineLarge: TextStyle(
          fontSize: 40.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w800,
          fontFamily: font1,
        ),
        headlineMedium: TextStyle(
          fontSize: 32.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w700,
          fontFamily: font1,
        ),
        headlineSmall: TextStyle(
          fontSize: 26.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: font1,
        ),
        titleLarge: TextStyle(
          fontSize: 18.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w600,
          fontFamily: font1,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w500,
          fontFamily: font1,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w500,
          fontFamily: font1,
        ),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: font1,
        ),
        bodyMedium: TextStyle(
          fontSize: 14.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: font1,
        ),
        bodySmall: TextStyle(
          fontSize: 12.sp,
          color: _darkTextColor,
          fontWeight: FontWeight.w400,
          fontFamily: font1,
        ),
        labelLarge: TextStyle(
          fontSize: 14.sp,
          color: gray500,
          fontWeight: FontWeight.w300,
          fontFamily: font1,
        ),
        labelMedium: TextStyle(
          fontSize: 12.sp,
          color: gray500,
          fontWeight: FontWeight.w300,
          fontFamily: font1,
        ),
        labelSmall: TextStyle(
          fontSize: 10.sp,
          color: gray500,
          fontWeight: FontWeight.w300,
          fontFamily: font1,
        ),
      );


  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: white,
    cardColor: greyLight,
    hoverColor: highlightColor,
    primaryColor: white,
    hintColor: white,
    textTheme: _lightTextTheme(),
    indicatorColor: purple,
    canvasColor: black,
    dividerColor: white,
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(purple),
    ),
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: blackBackgroundColor,
      cardColor: darkCardColor,
      hoverColor: darkShimmerColor,
      primaryColor: black,
      canvasColor: white,
      hintColor: darkCardColor,
      indicatorColor: purple,
      textTheme: _darkTextTheme(),
      radioTheme: RadioThemeData(fillColor: WidgetStateProperty.all(purple)));

  // New Construction Theme
  static ThemeData constructionTheme = ThemeData(
    primaryColor: constructionPrimary,
    scaffoldBackgroundColor: constructionSecondary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: constructionPrimary,
      primary: constructionPrimary,
      secondary: constructionAccent,
      brightness: Brightness.dark,
    ),
    cardColor: const Color(0xFF2d2d2d),
    hintColor: Colors.grey[600],
    textTheme: _darkTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: constructionSecondary,
      elevation: 0,
      iconTheme: IconThemeData(color: constructionPrimary),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: constructionPrimary,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: constructionPrimary,
        foregroundColor: constructionSecondary,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: constructionPrimary,
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(constructionPrimary),
    ),
    indicatorColor: constructionAccent,
    canvasColor: Colors.white,
  );
}
