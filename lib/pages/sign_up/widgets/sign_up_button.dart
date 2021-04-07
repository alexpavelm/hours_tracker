import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:hours_tracker/blocs/login/login_cubit.dart';
import 'package:hours_tracker/blocs/sign_up/sign_up_cubit.dart';

class SignUpButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status == FormzStatus.submissionInProgress
              ? const CircularProgressIndicator()
              : GestureDetector(
                  onTap: state.status.isValidated
                      ? () => context.read<SignUpCubit>().signUpFormSubmitted()
                      : null,
                  child: Container(
                    height: 120.w,
                    width: 400.w,
                    decoration: BoxDecoration(
                      color: state.status.isValidated ? Theme.of(context).buttonColor : Theme.of(context).disabledColor,
                      borderRadius: BorderRadius.circular(25.w),
                    ),
                    child: Center(
                      child: Text(
                        "SIGN UP",
                        style: Theme.of(context).textTheme.button,
                      ),
                    ),
                  ),
                );
        });
  }
}
