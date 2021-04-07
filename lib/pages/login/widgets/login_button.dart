import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hours_tracker/blocs/login/login_cubit.dart';

class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status == FormzStatus.submissionInProgress
              ? const CircularProgressIndicator()
              : GestureDetector(
                  onTap: state.status.isValidated
                      ? () => context.read<LoginCubit>().logInWithCredentials()
                      : null,
                  child: Container(
                    height: 120.w,
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).buttonColor,
                      borderRadius: BorderRadius.circular(25.w),
                    ),
                    child: Center(
                      child: Text(
                        "SIGN IN",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                );
        });
  }
}
