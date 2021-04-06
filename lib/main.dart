// @dart=2.9
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hours_tracker/app_bloc_observer.dart';
import 'package:hours_tracker/blocs/authentication/authentication_bloc.dart';
import 'package:hours_tracker/blocs/theme/theme_cubit.dart';
import 'package:hours_tracker/injection.dart';
import 'package:hours_tracker/pages/home/home_page.dart';
import 'package:hours_tracker/pages/login/login_page.dart';
import 'package:hours_tracker/pages/splash/splash_page.dart';
import 'package:hours_tracker/routes.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Routes.createRoutes();
  configureInjection(Environment.prod);
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = AppBlocObserver();
  runApp(InitLayer());
}

class InitLayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080, 1920),
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider(
            create: (_) => getIt<AuthenticationBloc>(),
          ),
        ],
        child: MyApp(),
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, themeData) => MaterialApp(
        navigatorKey: Routes.sailor.navigatorKey,
        title: 'Hours Tracker App',
        theme: themeData,
        initialRoute: Routes.home,
        onGenerateRoute: Routes.sailor.generator(),
      ),
    );
  }
}
