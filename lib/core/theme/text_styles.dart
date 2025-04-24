import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_manager.dart';
import 'font_weight_helper.dart';


/// A class that provides predefined text styles for the application.
class TextStyles {

  /// Returns a text style with font size 10, regular weight, and black color.
  static TextStyle get font10RegularBlack => GoogleFonts.inter(
    fontSize: 10.sp,
    fontWeight: FontWeightHelper.regular,
  );

  /// Returns a text style with font size 12, regular weight, and black color.
  static TextStyle get font12RegularBlack => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
      );

  /// Returns a text style with font size 16, regular weight, and black color.
  static TextStyle get font16RegularBlack => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.regular,
      );

  /// Returns a text style with font size 16, medium weight, and black color.
  static TextStyle get font16MediumBlack => GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.medium,
  );

  /// Returns a text style with font size 18, medium weight, and black color.
  static TextStyle get font18MediumBlack => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get font18Bold => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.bold,
      );

  /// Returns a text style with font size 18, medium weight, and grey color.
  static TextStyle get font18MediumGrey => GoogleFonts.inter(
        fontSize: 18.sp,
        fontWeight: FontWeightHelper.medium,
        color: Colors.grey,
      );

  /// Returns a text style with font size 12, regular weight, and grey color.
  static TextStyle get font12RegularGrey => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.regular,
        color: Colors.grey,
      );

  /// Returns a text style with font size 16, bold weight, and black color.
  static TextStyle get font16BoldBlack => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
      );

  /// Returns a text style with font size 12, bold weight, and black color.
  static TextStyle get font12BoldBlack => GoogleFonts.inter(
        fontSize: 12.sp,
        fontWeight: FontWeightHelper.bold,
      );

  /// Returns a text style with font size 14, regular weight, and white color.
  static TextStyle get font14RegularWhite => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
        color: Colors.white,
      );

  /// Returns a text style with font size 14, regular weight, and default color.
  static TextStyle get font14Regular => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle get font14Medium => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get font14Bold => GoogleFonts.inter(
        fontSize: 14.sp,
        fontWeight: FontWeightHelper.bold,
      );

  /// Returns a text style with font size 14, regular weight, and grey color.
  static TextStyle get font14RegularGrey => GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeightHelper.regular,
      color: ColorsManager.greyColor);

  /// Returns a text style with font size 20, bold weight, and white color.
  static TextStyle get font20WhiteBold => GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.bold,
        color: Colors.white,
      );

  /// Returns a text style with font size 20, regular weight, and default color.
  static TextStyle get font20Regular => GoogleFonts.inter(
        fontSize: 20.sp,
        fontWeight: FontWeightHelper.regular,
      );

  static TextStyle get font24Bold => GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get font24Medium => GoogleFonts.inter(
        fontSize: 24.sp,
        fontWeight: FontWeightHelper.medium,
      );

  static TextStyle get font16Bold => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
      );

  static TextStyle get font16MediumGray => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.medium,
        color: ColorsManager.grey,
      );

  /// Returns a text style with font size 32, bold weight, and grey color.
  static TextStyle get font32Bold => GoogleFonts.inter(
      fontSize: 32.sp,
      fontWeight: FontWeightHelper.bold,
      color: ColorsManager.greyColor);

  /// Returns a text style with font size 20, bold weight, and white color using the Poppins font.
  static TextStyle get font20PoppinsWhiteBold => GoogleFonts.poppins(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  /// Returns a text style with font size 6, bold weight, and white color using the Almarai font.
  static TextStyle get font6AlmaraiRegularWhite => GoogleFonts.almarai(
        fontSize: 6.sp,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      );

  /// Returns a text style with font size 16, bold weight, and default color for app buttons.
  static TextStyle get fontAppButton => GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeightHelper.bold,
      );
}
