import 'package:delivery_app/core/helper/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

_navigateToNextScreen(BuildContext context) {
  // Navigate to the next screen after a delay
  Future.delayed(const Duration(seconds: 2), () {
   context.toNamed(Routes.login);
  });
}







class _SplashScreenState extends State<SplashScreen> {

   @override
  void initState() {
     super.initState();
     // Start the navigation to the next screen
     _navigateToNextScreen(context);
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.splashColor, // light blue background
      body: SizedBox(
        width: MediaQuery
            .sizeOf(context)
            .width,
        height: MediaQuery
            .sizeOf(context)
            .height,

        child: Stack(
          children: [
            Positioned(
              bottom: 45,
              child: SvgPicture.asset(Assets.svgsBuildingsBackground
                , width: MediaQuery
                    .sizeOf(context)
                    .width,

              ),
            ),
            SizedBox(
              width: MediaQuery
                  .sizeOf(context)
                  .width,
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox.shrink(),
                    SvgPicture.asset(Assets.svgsLogo, width: 220),
                    SvgPicture.asset(
                      Assets.svgsDeliveryMan,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
