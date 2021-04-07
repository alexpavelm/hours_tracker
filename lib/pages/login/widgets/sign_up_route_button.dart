import 'package:flutter/material.dart';
import 'package:hours_tracker/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpRouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.sailor(Routes.signUp),
      child: Container(
        height: 120.w,
        width: 800.w,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(25.w),
        ),
        child: Center(
          child: Text(
            "SIGN UP with email",
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
