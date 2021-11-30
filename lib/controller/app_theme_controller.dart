import 'package:flutter/material.dart';
import 'package:flutter_ui/models/app_theme_model/app_theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_notifier/state_notifier.dart';

class AppTheme extends StateNotifier<AppThemeState> {
  AppTheme() : super(const AppThemeState());

  ThemeData buildTheme(isDark) => isDark ? ThemeData.dark() : ThemeData.light();

  void changeMode() async {
    SharedPreferences themeMode = await SharedPreferences.getInstance();
    bool isDark = (themeMode.getBool('isDark') ?? false);
    await themeMode.setBool('isDark', !isDark);
    state = state.copyWith(isDark: !isDark);
  }
}
