import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/blocs/theme/theme_cubit.dart';
import 'package:hours_tracker/resources/app_theme.dart';
import 'package:hours_tracker/widgets/logout_button.dart';

class HomePage extends StatefulWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => HomePage());
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: Scaffold(
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
                      context.read<ThemeCubit>().changeTheme(AppTheme.darkMode);
                    } else {
                      context.read<ThemeCubit>().changeTheme(AppTheme.lightMode);
                    }
                  });
                },
              ),
              LogoutButton(),
            ],
          ),
        ),
      ),
    );
  }
}
