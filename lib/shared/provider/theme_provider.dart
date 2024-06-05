import 'package:flutter/material.dart';

import '../theme_prefs.dart';

class ThemeProvider extends ChangeNotifier {
  //default theme
  ThemeMode themeMode = ThemeMode.light;

  Future<void> changeTheme(ThemeMode newThemeMode) async {
    if (themeMode == newThemeMode) return;
    themeMode = newThemeMode;
    ThemePrefs().setThemePrefs(themeMode);
    notifyListeners();
  }

  Future<void> loadThemePrefs() async {
    String? savedThemeMode = await ThemePrefs().getThemePrefs();

    savedThemeMode ??= "light";
    themeMode = (savedThemeMode == "dark") ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
