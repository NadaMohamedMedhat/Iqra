import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefs {
  static late SharedPreferences themePrefs;

  Future<void> setThemePrefs(ThemeMode newTheme) async {
    await themePrefs.setString("theme", newTheme.name);
  }

  Future<String?> getThemePrefs() async {
    final String? appTheme = themePrefs.getString("theme");
    return appTheme;
  }
}



