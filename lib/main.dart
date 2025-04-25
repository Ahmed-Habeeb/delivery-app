import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/di/di.dart';
import 'core/helper/app_context.dart';
import 'core/helper/cache_helper.dart';
import 'core/routing/router.dart';
import 'core/routing/routes.dart';
import 'core/theme/colors_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  // status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  CacheHelper.init();
  setupGetIt();


  runApp(const MyApp());
}


/// A stateless widget that represents the root of the application.
class MyApp extends StatefulWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    // Register this class as a lifecycle observer
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // Remove the observer when the widget is disposed
    WidgetsBinding.instance.removeObserver(this);
    // Note: dispose might not always be called when app is terminated
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.detached) {


    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      /// Sets the design size for screen util.
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        /// Sets the navigator key for the application.
        navigatorKey: AppContext.navigatorKey,

        /// Sets the title of the application.
        title: 'Mashrouk Rider',
        builder: (context, child) {
          return MediaQuery.withClampedTextScaling(
            minScaleFactor: 1.0,
            maxScaleFactor: 1.0,
            child: child!,
          );
        },

        /// Sets the theme of the application.
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            // backgroundColor: Colors.white,
            // foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            color: Colors.white,

            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          dialogTheme: DialogTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            elevation: 0,
          ),
          primaryColor: Colors.white,
          canvasColor: ColorsManager.mainColor,
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: ColorsManager.mainColor,
          ),
        ),

        /// Hides the debug banner.
        debugShowCheckedModeBanner: false,

        /// Sets the localization delegates.
        // localizationsDelegates: context.localizationDelegates,

        /// Sets the supported locales.
        // supportedLocales: context.supportedLocales,

        /// Sets the current locale.
        // locale: context.locale,

        /// Sets the route generator for the application.
        onGenerateRoute: AppRouter.generateRoute,

        /// Sets the initial route of the application.
        initialRoute: (!kDebugMode) ? Routes.splash : Routes.home,
      ),
    );
  }
}
