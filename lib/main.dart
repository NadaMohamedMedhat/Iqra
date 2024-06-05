import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:iqra/shared/theme_prefs.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myapp.dart';
import 'shared/provider/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemePrefs.themePrefs = await SharedPreferences.getInstance();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      saveLocale: true,
      child: ChangeNotifierProvider(
        create: (context) => ThemeProvider()..loadThemePrefs(),
        child: const MyApp(),
      ),
    ),
  );
}
