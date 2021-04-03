import 'package:flutter/material.dart';

enum AppTheme {
  LightMode,
  DarkMode
}

final appThemeData = {
  AppTheme.LightMode : ThemeData(
    brightness: Brightness.light,
  ),
  AppTheme.DarkMode : ThemeData(
      brightness: Brightness.dark,
  ),
};