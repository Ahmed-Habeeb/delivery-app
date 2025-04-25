import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/features/login/ui/screen/login_screen.dart';
import 'package:delivery_app/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';

/// A class that handles the routing for the application.
class AppRouter {
  /// Generates a route based on the given [RouteSettings].
  static Route<dynamic> generateRoute(RouteSettings settings) {
    debugPrint('CurrentRoute: ${settings.name}');

    Widget getScreen(Widget mobileScreen) {
      return mobileScreen;
      // return ScreenTypeLayout.builder(
      //   mobile: (context) => mobileScreen,
      //   tablet: (context) => mobileScreen,
      //   desktop: (context) => mobileScreen,
      //   watch: (context) => NotSupportedScreen(),
      // );
    }

    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => getScreen(SplashScreen()));
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => getScreen(
            LoginScreen()// Replace with your actual login screen
          ),
        );
      // Add more routes here as needed
      default:
        return MaterialPageRoute(
          builder:
              (_) => getScreen(
                Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ),
              ),
        );
    }
  }
}
