import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(width: 26.w),
            SvgPicture.asset(Assets.svgsLogo, width: 170.w),
          ],
        ),
        Stack(
          children: [
            SvgPicture.asset(
              Assets.svgsCircle,
              width: 120.w,
              height: 127.h,
            ),
            Positioned(
              top: 50.h,
              right: 27.w,
              child: Icon(Icons.language, color: Colors.white, size: 30),
            ),
          ],
        ),
      ],
    );
  }
}
