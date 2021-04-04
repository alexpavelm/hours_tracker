import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hours_tracker/blocs/login/login_cubit.dart';

class EmailInputField extends StatefulWidget {
  final TextEditingController controller;

  const EmailInputField({required this.controller});

  @override
  _EmailInputFieldState createState() => _EmailInputFieldState();
}

class _EmailInputFieldState extends State<EmailInputField> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextFormField(
          key: const Key('loginForm_emailInput_textField'),
          controller: widget.controller,
          keyboardType: TextInputType.emailAddress,
          onChanged: (email) => context.read<LoginCubit>().emailChanged(email),
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
            errorText: state.email.invalid ? 'invalid email' : null,
          ),
        );
      },
    );
  }
}
