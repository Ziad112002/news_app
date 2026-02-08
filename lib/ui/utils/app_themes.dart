import 'package:flutter/material.dart';
import 'package:news/ui/utils/app_colors.dart';

abstract final class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.white,
      iconTheme: IconThemeData(color: AppColors.black),

      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: TextStyle(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      dividerColor: Colors.transparent,
      overlayColor: WidgetStatePropertyAll(AppColors.black.withAlpha(50)),
      indicatorColor: AppColors.black,
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.white,
      secondary: AppColors.black,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 24,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarThemeData(
      iconTheme: IconThemeData(color: AppColors.white),
      backgroundColor: AppColors.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      overlayColor: WidgetStatePropertyAll(AppColors.white.withAlpha(50)),
      dividerColor: Colors.transparent,
      indicatorColor: AppColors.white,
      labelStyle: TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 14,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
      secondary: AppColors.white,
    ),
    textTheme: TextTheme(
      displayMedium: TextStyle(
        fontSize: 24,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 12,
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
