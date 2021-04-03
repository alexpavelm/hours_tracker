import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hours_tracker/app_bloc_observer.dart';
import 'package:hours_tracker/blocs/theme/theme_cubit.dart';
import 'package:hours_tracker/pages/home/home_page.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(InitLayer());
}

class InitLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) => ScreenUtilInit(
        designSize: Size(1080, 1920),
        allowFontScaling: false,
        builder: () => MaterialApp(
          title: 'Hours Tracker App',
          theme: state,
          home: HomePage(),
        ),
      ),
    );
  }
}
