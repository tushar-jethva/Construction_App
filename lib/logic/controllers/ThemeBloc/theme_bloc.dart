import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  static const String _themeKey = 'theme_key';

  ThemeBloc() : super(ThemeState(themeData: AppTheme.lightTheme)) {
    on<OnThemeChangeEvent>(_onThemeChanged);

    _loadTheme();
  }

  Future<void> _onThemeChanged(OnThemeChangeEvent event, Emitter<ThemeState> emit) async {
    final isDarkTheme = state.themeData == AppTheme.darkTheme;
    final newThemeData = isDarkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;

    emit(ThemeState(themeData: newThemeData));

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, newThemeData == AppTheme.darkTheme);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkTheme = prefs.getBool(_themeKey) ?? false;
    final themeData = isDarkTheme ? AppTheme.darkTheme : AppTheme.lightTheme;

    // ignore: invalid_use_of_visible_for_testing_member
    emit(ThemeState(themeData: themeData));
  }
}
