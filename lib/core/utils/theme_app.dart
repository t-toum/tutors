import 'package:flutter/material.dart';
import 'package:tutors/core/constants/app_colors.dart';

ThemeData buildTheme() {
  final baseTheme = ThemeData(fontFamily: "NotoSansLao");
  return baseTheme.copyWith(
    primaryColor: AppColors.primaryColor,
    appBarTheme: const AppBarTheme(
      color: AppColors.primaryColor,
      titleTextStyle: TextStyle(fontSize: 20),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
    ),
    radioTheme: const RadioThemeData().copyWith(
      fillColor: MaterialStateProperty.all(AppColors.primaryColor),
      overlayColor: MaterialStateProperty.all(AppColors.primaryColor),
    ),
    listTileTheme: const ListTileThemeData().copyWith(
      textColor: Colors.black,
    ),
    buttonTheme: const ButtonThemeData().copyWith(buttonColor: Colors.red),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size.fromHeight(50),
        foregroundColor: Colors.white,
        textStyle: const TextStyle().copyWith(
          fontFamily: "NotoSansLao",
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    textTheme: const TextTheme().copyWith(
      displayLarge: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontFamily: 'NotoSansLao',
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontFamily: 'NotoSansLao',
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontFamily: 'NotoSansLao',
        fontWeight: FontWeight.bold,
      ),
      titleLarge: const TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontFamily: 'NotoSansLao',
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        color: Colors.black,
        fontFamily: 'NotoSansLao',
        fontSize: 14,
      ),
      bodyMedium: const TextStyle(
        color: Colors.black,
        fontFamily: 'NotoSansLao',
        fontSize: 12,
      ),
      bodySmall: const TextStyle(
        color: Colors.black,
        fontFamily: 'NotoSansLao',
        fontSize: 10,
      ),
      titleMedium: const TextStyle(
        color: Colors.black,
        fontFamily: 'NotoSansLao',
        fontSize: 14,
        fontWeight: FontWeight.bold
      ),
      titleSmall: const TextStyle(color: Colors.black),
    ),
  );
}
