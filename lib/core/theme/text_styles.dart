import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';
import 'font_weight_helper.dart';


/// A class that provides predefined text styles for the application.
class TextStyles {
  static var font24Medium = GoogleFonts.inter(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.medium,
  );

  static var font12RegularGrey= GoogleFonts.inter(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.grey,
  );


  /// Returns a text style with font size 10, regular weight, and black color.

  /// Returns a text style with font size 12, regular weight, and black color.
  static TextStyle get font12RegularBlack => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
      );

  /// Returns a text style with font size 16, regular weight, and black color.
  // static TextStyle get font16RegularBlack => GoogleFonts.inter(
  //       fontSize: 16.sp,
  //       fontWeight: FontWeightHelper.regular,
  //     );


  static TextStyle get font29SemiBoldMainColor => GoogleFonts.montserrat(
        fontSize: 29.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: ColorsManager.mainColor,

      );  static TextStyle get font12MediumMainColor => GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.medium,
        color: ColorsManager.mainColor,

      );
 static TextStyle get font14RegularBlack => GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,


      ); static TextStyle get font14SemiBoldMainColor => GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.semiBold,
        color: ColorsManager.mainColor,


      );






  /// Returns a text style with font size 16, bold weight, and default color for app buttons.
  static TextStyle get fontAppButton => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
      );
}
