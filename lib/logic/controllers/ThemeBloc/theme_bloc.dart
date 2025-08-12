import 'package:bloc/bloc.dart';
import 'package:construction_mate/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppTheme.constructionTheme)) {
    on<OnThemeChangeEvent>((event, emit) {
      // Theme changing is disabled. We always use the construction theme.
    });
  }
}
