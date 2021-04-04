import 'package:flutter/material.dart';

enum AppTheme { lightMode, darkMode }

final appThemeData = {
  AppTheme.lightMode: ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.green.shade200,
    primaryColor: Colors.green,
    buttonColor: Colors.green,
    textTheme: const TextTheme(
      button: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      headline1: TextStyle(
        color: Colors.green,
        fontSize: 35,
      )
    )
  ),
  AppTheme.darkMode: ThemeData(
    brightness: Brightness.dark,
  ),
};
