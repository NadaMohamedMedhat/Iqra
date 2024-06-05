import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  //default theme
  ThemeMode themeMode = ThemeMode.light;

  void changeTheme(ThemeMode newThemeMode) {
    if (themeMode == newThemeMode) return;
    themeMode = newThemeMode;
    notifyListeners();
  }
}
