import 'package:flutter/material.dart';

enum AppTheme {
  LightMode,
  DarkMode
}

final appThemeData = {
  AppTheme.LightMode : ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green),
  AppTheme.DarkMode : ThemeData(
      brightness: Brightness.dark,
  ),
};