import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/blocs/authentication/authentication_bloc.dart';
import 'package:hours_tracker/blocs/theme/theme_cubit.dart';
import 'package:hours_tracker/resources/app_theme.dart';
import 'package:hours_tracker/routes.dart';
import 'package:hours_tracker/widgets/logout_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                GestureDetector(
                  onTap: () =>
                      state.status == AuthenticationStatus.authenticated
                          ? Routes.sailor(Routes.firebase)
                          : Routes.sailor(Routes.login),
                  child: Container(
                    height: 120.w,
                    width: 800.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(25.w),
                    ),
                    child: Center(
                      child: Text(
                        state.status == AuthenticationStatus.authenticated ? "See data" : "Login to see data",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                ),
                LogoutButton(
                    isLoggedIn:
                        state.status == AuthenticationStatus.authenticated),
              ],
            ),
          ),
        );
      },
    );
  }
}
