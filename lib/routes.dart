import 'package:hours_tracker/pages/home/home_page.dart';
import 'package:hours_tracker/pages/login/login_page.dart';
import 'package:hours_tracker/pages/splash/splash_page.dart';
import 'package:sailor/sailor.dart';

// ignore: avoid_classes_with_only_static_members
class Routes {
  static final sailor = Sailor(
    options: const SailorOptions(
      handleNameNotFoundUI: true,
      isLoggingEnabled: true,
      defaultTransitions: [SailorTransition.fade_in],
      defaultTransitionDuration: Duration(milliseconds: 250),
    ),
  );

  static const String home = 'home';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String splash = 'splash';

  static void createRoutes() {
    sailor.addRoute(
      SailorRoute(
        name: home,
        builder: (context, args, params) {
          return HomePage();
        },
      ),
    );

    sailor.addRoute(
      SailorRoute(
        name: splash,
        builder: (context, args, params) {
          return SplashPage();
        },
      ),
    );

    sailor.addRoute(
      SailorRoute(
        name: login,
        builder: (context, args, params) {
          return LoginPage();
        },
      ),
    );
  }
}
