import 'package:flutter/material.dart';

class AppTheme extends ChangeNotifier {
  AppTheme() {
    _isDark = false;
  }
  bool get isDark => _isDark;
  bool _isDark = false;
  ThemeData buildTheme() {
    if (isDark) {
      return ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.dark,
      );
    } else {
      return ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        brightness: Brightness.light,
      );
    }
  }

  void setMode(isDark) {
    _isDark = isDark;
    notifyListeners();
  }

  void changeMode() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
