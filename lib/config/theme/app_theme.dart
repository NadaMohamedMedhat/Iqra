import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iqra/core/utils/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryLightColor,
      primary: AppColors.primaryLightColor,
      secondary: AppColors.secondaryLightColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryLightColor,
      selectedIconTheme: const IconThemeData(
        color: Colors.black,
        size: 32,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.white,
        size: 28,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
    ),
    textTheme: TextTheme(
      //use for name of app in splash screen
      labelSmall: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      //quran tab row
      titleMedium: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        color: Colors.black,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: GoogleFonts.cairo().fontFamily,
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDarkColor,
      primary: AppColors.primaryDarkColor,
      secondary: AppColors.secondaryDarkColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkColor,
      selectedIconTheme: IconThemeData(
        color:AppColors.secondaryDarkColor,
        size: 32,
      ),
      unselectedIconTheme: const IconThemeData(
        color: Colors.white,
        size: 28,
      ),
      selectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      unselectedItemColor: Colors.white,
      selectedItemColor: AppColors.secondaryDarkColor,
      showUnselectedLabels: true,
    ),
    textTheme: TextTheme(
      //use for name of app in splash screen
      labelSmall: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      //quran tab row
      titleMedium: TextStyle(
        fontFamily: GoogleFonts.elMessiri().fontFamily,
        color: Colors.white,
        fontSize: 25,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
