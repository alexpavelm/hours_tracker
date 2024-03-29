import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hours_tracker/blocs/login/login_cubit.dart';
import 'package:hours_tracker/pages/login/widgets/google_login_button.dart';
import 'package:hours_tracker/pages/login/widgets/login_button.dart';
import 'package:hours_tracker/pages/login/widgets/sign_up_route_button.dart';
import 'package:hours_tracker/widgets/base_input_field.dart';
import 'package:hours_tracker/widgets/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 800.w,
              width: 800.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        emailInputField(),
                        vSpace(20.w),
                        passwordInputField(),
                        // GoogleLoginButton(),
                        // SignUpButton(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.w),
                    child: LoginButton(),
                  ),
                ],
              ),
            ),
            vSpace(50.w),
            GoogleLoginButton(),
            vSpace(50.w),
            SignUpRouteButton(),
          ],
        ),
      ),
    );
  }

  Widget emailInputField() {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return BaseInputField(
          onChanged: (email) =>
              context.read<LoginCubit>().emailChanged(email),
          labelText: "Enter your email",
          errorText: state.email.invalid ? 'invalid email' : null,
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }

  Widget passwordInputField() {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return BaseInputField(
          onChanged: (password) =>
              context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          labelText: "Enter your password",
          errorText: state.password.invalid ? 'invalid password' : null,
        );
      },
    );
  }

}
