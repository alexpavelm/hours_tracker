import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/blocs/theme/theme_cubit.dart';
import 'package:hours_tracker/resources/app_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: isDarkMode,
              onChanged: (value) {
                isDarkMode = value;
                setState(() {
                  if (isDarkMode) {
                    context.read<ThemeCubit>().changeTheme(AppTheme.DarkMode);
                  } else {
                    context.read<ThemeCubit>().changeTheme(AppTheme.LightMode);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
