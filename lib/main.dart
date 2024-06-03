import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'myapp.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      child: const MyApp(),
    ),
  );
}
