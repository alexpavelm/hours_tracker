import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hours_tracker/blocs/login/login_cubit.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<LoginCubit>().logInWithGoogle(),
      child: Container(
        height: 120.w,
        width: 800.w,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(25.w),
        ),
        child: Center(
          child: Text(
            "SIGN IN WITH GOOGLE",
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
