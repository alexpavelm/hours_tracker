import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:hours_tracker/blocs/sign_up/sign_up_cubit.dart';
import 'package:hours_tracker/pages/sign_up/widgets/login_route_button.dart';
import 'package:hours_tracker/pages/sign_up/widgets/sign_up_button.dart';
import 'package:hours_tracker/widgets/base_input_field.dart';
import 'package:hours_tracker/widgets/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatefulWidget {
  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state.status == FormzStatus.submissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('SignUp Failure')),
            );
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1000.w,
              width: 800.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Sign up",
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
                        vSpace(20.w),
                        confirmPasswordInputField(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.w),
                    child: SignUpButton(),
                  ),
                ],
              ),
            ),
            vSpace(50.w),
            LoginRouteButton(),
          ],
        ),
      ),
    );
  }

  Widget emailInputField() {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return BaseInputField(
          onChanged: (email) =>
              context.read<SignUpCubit>().emailChanged(email),
          labelText: "Enter your email",
          errorText: state.email.invalid ? 'invalid email' : null,
          keyboardType: TextInputType.emailAddress,
        );
      },
    );
  }

  Widget passwordInputField() {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return SizedBox(
          child: BaseInputField(
            onChanged: (password) =>
                context.read<SignUpCubit>().passwordChanged(password),
            obscureText: true,
            labelText: "Enter your password",
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }

  Widget confirmPasswordInputField() {
    return BlocBuilder<SignUpCubit, SignUpState>(
      buildWhen: (previous, current) => previous.confirmedPassword != current.confirmedPassword,
      builder: (context, state) {
        return BaseInputField(
          onChanged: (password) =>
              context.read<SignUpCubit>().confirmedPasswordChanged(password),
          obscureText: true,
          labelText: "Enter your password again",
          errorText: state.confirmedPassword.invalid ? 'invalid password' : null,
        );
      },
    );
  }

}
