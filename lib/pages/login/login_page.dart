import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hours_tracker/blocs/login/login_cubit.dart';
import 'package:hours_tracker/injection.dart';
import 'package:hours_tracker/pages/login/login_view.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocProvider(
              create: (_) => getIt<LoginCubit>(),
              child: LoginView(),
            ),
          ),
        ),
      ),
    );
  }
}