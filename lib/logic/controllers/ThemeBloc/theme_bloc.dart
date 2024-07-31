import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/constants/colors.dart';
import 'package:construction_mate/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppTheme.lightTheme)) {
    on<OnThemeChangeEvent>((event, emit) {
      state.themeData.scaffoldBackgroundColor == black
          ? emit(ThemeState(themeData: AppTheme.lightTheme))
          : emit(ThemeState(themeData: AppTheme.darkTheme));
    });
  }
}
