import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iqra/config/theme/app_theme.dart';
import 'package:iqra/presentation/home/tabs/ahadeth/hadeth_details_screen.dart';

import 'core/utils/routes.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/home/tabs/quran/sura_details_screen.dart';
import 'presentation/splash/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 870),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.home,
        theme:AppTheme.lightTheme,
        routes: {
          Routes.splash: (context) => const SplashScreen(),
          Routes.home: (context) => const HomeScreen(),
          Routes.suraDetailsScreen: (context) =>  SuraDetailsScreen(),
          Routes.hadethDetailsScreen: (context) =>  HadethDetailsScreen(),
        },
      ),
    );
  }
}
