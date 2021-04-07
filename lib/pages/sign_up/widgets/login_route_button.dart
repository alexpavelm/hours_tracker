import 'package:flutter/material.dart';
import 'package:hours_tracker/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginRouteButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Routes.sailor(Routes.login),
      child: Container(
        height: 120.w,
        width: 800.w,
        decoration: BoxDecoration(
          color: Theme.of(context).buttonColor,
          borderRadius: BorderRadius.circular(25.w),
        ),
        child: Center(
          child: Text(
            "LOGIN",
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
