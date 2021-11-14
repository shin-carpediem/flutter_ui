import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppTheme extends ChangeNotifier {
  AppTheme() : _isDark = false;
  bool get isDark => _isDark;
  bool _isDark;

  ThemeData buildTheme() => _isDark ? ThemeData.dark() : ThemeData.light();

  void changeMode() async {
    SharedPreferences themeMode = await SharedPreferences.getInstance();
    _isDark = (themeMode.getBool('isDark') ?? false);
    await themeMode.setBool('isDark', !_isDark);
    notifyListeners();
  }
}
