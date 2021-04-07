import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum AppTheme { lightMode, darkMode }

Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.lightMode: ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.green.shade200,
    primaryColor: Colors.green,
    buttonColor: Colors.green,
    textTheme: TextTheme(
        button: TextStyle(
          color: Colors.white,
          fontSize: 40.w,
        ),
        headline1: TextStyle(
          color: Colors.green,
          fontSize: 80.w,
        )),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 30.w, horizontal: 30.w),
      fillColor: Colors.blue.shade100,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.w),
          borderSide: const BorderSide(width: 0, color: Colors.transparent)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.w),
          borderSide: const BorderSide(width: 0, color: Colors.transparent)),
    ),
  ),
  AppTheme.darkMode: ThemeData(
    brightness: Brightness.dark,
  ),
};
