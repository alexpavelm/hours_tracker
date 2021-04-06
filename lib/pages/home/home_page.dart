import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/blocs/authentication/authentication_bloc.dart';
import 'package:hours_tracker/blocs/theme/theme_cubit.dart';
import 'package:hours_tracker/resources/app_theme.dart';
import 'package:hours_tracker/widgets/logout_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
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
                        context.read<ThemeCubit>().changeTheme(AppTheme.darkMode);
                      } else {
                        context.read<ThemeCubit>().changeTheme(AppTheme.lightMode);
                      }
                    });
                  },
                ),
                LogoutButton(isLoggedIn: state.status == AuthenticationStatus.authenticated),
              ],
            ),
          ),
        );
      },
    );

  }
}
