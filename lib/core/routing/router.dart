import 'package:delivery_app/core/di/di.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/features/home/ui/screen/home_screen.dart';
import 'package:delivery_app/features/login/ui/cubit/login_cubit.dart';
import 'package:delivery_app/features/login/ui/screen/login_screen.dart';
import 'package:delivery_app/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/ui/cubit/home_cubit.dart';

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
          builder:
              (_) => BlocProvider(
                create: (context) => getIt<AuthCubit>(),
                child: getScreen(
                  LoginScreen(), // Replace with your actual login screen
                ),
              ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create:
                    (context) =>
                        getIt<HomeCubit>()..fetchDeliveryBills(
                          dlvryNo: settings.arguments as String? ??"1010",
                          langNo: "1",
                          billSrl: "",
                          prcssdFlg: "",
                        ),
                child: getScreen(HomeScreen()),
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
