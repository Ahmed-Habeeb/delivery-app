import 'package:delivery_app/core/helper/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:delivery_app/core/theme/text_styles.dart';
import 'package:delivery_app/features/login/ui/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../generated/assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          LoginHeader(),
          Spacer(),
          Text("Welcome Back!", style: TextStyles.font29SemiBoldMainColor),
          Text(
            "Log back into your account",
            style: TextStyles.font12MediumMainColor,
          ),
          SizedBox(height: 44.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: Column(
              spacing: 8.h,
              children: [
                AppTextFormField(
                  hintText: "User ID",
                  type: AppTextFieldType.number,
                ),
                AppTextFormField(
                  hintText: "Password",
                  type: AppTextFieldType.number,
                ),
                SizedBox.shrink(),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Show More",
                    style: TextStyles.font14SemiBoldMainColor,
                  ),
                ),
                SizedBox(height: 16.h),
                AppButton(
                  text: "Log in",
                  onPressed: () {
                    context.offAllNamed(Routes.home);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 37.h),
          SvgPicture.asset(Assets.svgsCar),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }
}
