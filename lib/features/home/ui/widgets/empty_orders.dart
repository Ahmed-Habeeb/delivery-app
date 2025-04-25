import 'package:delivery_app/core/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/assets.dart';

class EmptyOrders extends StatelessWidget {
  const EmptyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 40.h),
      child: Column(
        children: [
          Image.asset(Assets.imagesEmptyOrder, width: 225.w, height: 185.h),
          SizedBox(height: 20.h),
          Text("No Orders Yet", style: TextStyles.font24Medium),
          SizedBox(height: 10.h),
          Text(
            "You don't have any orders in your history.",
            textAlign: TextAlign.center,
            style: TextStyles.font16Regular,
          ),
        ],
      ),
    );
  }
}
