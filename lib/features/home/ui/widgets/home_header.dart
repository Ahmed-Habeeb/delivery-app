import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/colors_manager.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../../generated/assets.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return           Container(
      height: 127.h,
      width: MediaQuery.sizeOf(context).width,
      color: ColorsManager.secondColor,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,

            child: SvgPicture.asset(
              Assets.svgsCircle,
              width: 120.w,
              height: 130.h,
              colorFilter: ColorFilter.mode(
                ColorsManager.mainColor,
                BlendMode.srcATop,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,


            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 150.w),
                  margin:  EdgeInsets.only(top: 25.h),
                  child: Text(
                    "Ahmed Othman",
                    style: TextStyles.font24Bold,
                  ),
                ),
                Image.asset(Assets.imagesDeliveryMan,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(5.r),
                      color: Colors.white
                  ),
                  margin:  EdgeInsets.only(top: 35.h),
                  padding: EdgeInsets.all(4.r),
                  child: Icon(
                    Icons.language,
                    color: ColorsManager.mainColor,
                    // size: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
