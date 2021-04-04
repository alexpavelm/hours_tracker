import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hours_tracker/blocs/login/login_cubit.dart';

class PasswordInputField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordInputField({required this.controller});

  @override
  _PasswordInputFieldState createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_passwordInput_textField'),
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          onChanged: (password) => context.read<LoginCubit>().passwordChanged(password),
          obscureText: true,
          decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(vertical: 30.w, horizontal: 30.w),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            fillColor: Colors.blue.shade100,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.w),
                borderSide:
                const BorderSide(width: 0, color: Colors.transparent)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.w),
                borderSide:
                const BorderSide(width: 0, color: Colors.transparent)),
            labelText: "Enter your email",
            errorText: state.password.invalid ? 'invalid password' : null,
          ),
        );
      },
    );
  }
}
