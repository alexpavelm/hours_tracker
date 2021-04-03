import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/resources/app_theme.dart';

class ThemeCubit extends Cubit<ThemeData> {

  ThemeCubit() : super(appThemeData[AppTheme.LightMode]);

  void changeTheme(AppTheme theme) => emit(appThemeData[theme]);
}