import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:phone_field/phone_validator.dart';

import '../helper/validation_helper.dart';
import '../theme/colors_manager.dart';
import '../theme/text_styles.dart';

/// Enum representing different types of text fields with associated validation rules.
///
/// - [email]: Validates email format
/// - [password]: Obscures text and enforces security requirements
/// - [text]: Allows alphabetical characters (including Arabic) and spaces
/// - [number]: Allows numeric input only
/// - [phone]: Validates phone numbers (digits only with length restrictions)
/// - [name]: Allows alphabetical characters with special denials for symbols/numbers
/// - [price]: Allows decimal numbers with 2 decimal places
/// - [any]: No format restrictions
enum AppTextFieldType { email, password, text, number, phone, name, price, any }

/// A highly customizable text form field widget with built-in validation and localization support.
///
/// Features include:
/// - Multiple input types with automatic validation
/// - Customizable styling and layout
/// - Internationalization support via EasyLocalization
/// - Automatic keyboard type selection
/// - Input formatting and length restrictions
/// - Password obscuring
/// - Custom validation support
class AppTextFormField extends StatelessWidget {
  /// Padding for the content inside the text field
  final EdgeInsetsGeometry? contentPadding;

  /// Border style when focused
  final InputBorder? focusedBorder;

  /// Border style when enabled
  final InputBorder? enabledBorder;

  /// Style for input text
  final TextStyle? inputTextStyle;

  /// Style for hint text
  final TextStyle? hintStyle;

  /// Localized hint text key
  final String hintText;

  /// Optional label text displayed above the field
  final String? nameText;

  /// Style for label text
  final TextStyle? nameTextStyle;

  /// Whether to obscure text (for passwords)
  final bool? isObscureText;

  /// Suffix icon widget
  final Widget? suffixIcon;

  /// Prefix icon widget
  final Widget? prefixIcon;

  /// Background color of the text field
  final Color? backgroundColor;

  /// Cursor color of the text field
  final Color? cursorColor;

  /// Text editing controller
  final TextEditingController? controller;

  /// Maximum number of lines (default: 1)
  final int? maxLines;

  /// Custom validation function (overrides default type-based validation)
  final Function(String?)? validator;

  /// Field type determining validation and formatting
  final AppTextFieldType type;

  /// Keyboard type (defaults based on field type)
  final TextInputType? keyboardType;

  /// Additional input formatters
  final List<TextInputFormatter>? inputFormatters;

  /// Callback for text changes
  final Function(String)? onChanged;

  /// Whether the field is interactive (default: true)
  final bool enabled;

  /// Country code for phone validation (currently placeholder)
  final String countryCode;

  /// Whether to autofocus on init
  final bool? autoFocus;

  /// Maximum allowed characters
  final int? maxChar;

  /// Tap callback (makes field read-only when set)
  final Function()? onTap;

  final FocusNode? focusNode;

  /// Creates a customizable text form field with built-in validation
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.keyboardType,
    this.onChanged,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.autoFocus,
    this.prefixIcon,
    this.hintStyle,
    this.nameText,
    this.nameTextStyle,
    this.inputFormatters,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.cursorColor,
    this.controller,
    this.enabled = true,
    this.maxLines = 1,
    this.countryCode = 'SA',
    this.maxChar,
    this.onTap,
    required this.type,
    this.validator,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (nameText != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 0.w),
            child: Text(
              nameText!,
              style: nameTextStyle ?? TextStyles.font12RegularBlack,
            ),
          ),
        (type == AppTextFieldType.phone)
            ? PhoneField(
              availableCountries: ["SA", "EG"],
              // languageCode: context.locale.languageCode,
              builder:
                  (context, country, pick) => Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8.w,
                    children: [
                      Container(
                        width: 105.w,
                        height: 52.h,
                        // padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 10.h),
                        decoration: BoxDecoration(
                          color: ColorsManager.fieldColor,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Center(
                          child: InkWell(
                            onTap: pick,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10.w,
                              children: [
                                Text(
                                  country.flag,
                                  style: TextStyles.font24Medium.copyWith(
                                    fontSize: 26.sp,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Colors.grey,
                                  size: 25.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          focusNode: focusNode,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.ltr,
                          onTap: onTap,
                          readOnly: onTap != null || !enabled,
                          // controller: controller,
                          maxLines: maxLines,
                          autofocus: autoFocus ?? false,
                          keyboardType: keyboardType ?? _customKeyBoard(type),
                          inputFormatters: [
                            ..._customRegex(type, maxChar) ?? [],
                            ...inputFormatters ?? [],
                          ],
                          maxLength: country.maxLength,
                          onChanged: (value) {
                            controller?.text = "+${country.dialCode}$value";
                            onChanged?.call(value);
                          },

                          obscureText: isObscureText ?? false,
                          style:
                              inputTextStyle ?? TextStyles.font12RegularBlack,
                        ),
                      ),
                    ],
                  ),
            )
            : TextFormField(
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onTap: onTap,
          readOnly: onTap != null || !enabled,
          controller: controller,
          maxLines: maxLines,
          autofocus: autoFocus ?? false,
          keyboardType: keyboardType ?? _customKeyBoard(type),
          inputFormatters: [
            ..._customRegex(type, maxChar) ?? [],
            ...inputFormatters ?? [],
          ],
          onChanged: onChanged,
          cursorColor: cursorColor,
          textAlign: TextAlign.center, // Center the hint and input text
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            isDense: true,
            labelStyle: hintStyle ?? TextStyles.font12RegularGrey,
            contentPadding:
            contentPadding ??
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            hintStyle:
            hintStyle ??
                TextStyles.font14RegularBlack,

            hintText: hintText,
            suffixIcon: suffixIcon,
            fillColor: backgroundColor ?? ColorsManager.fieldColor,
            filled: true,
            border:
            enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(22),
                ),
          ),
          obscureText: isObscureText ?? false,
          style: inputTextStyle ?? TextStyles.font12RegularBlack,
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "Please enter ${nameText ?? hintText}";
            } else if (!ValidationHelper.validate(value.trim(), type)) {
              return "Please enter a valid ${nameText ?? hintText}";
            }
            return validator?.call(value.trim());
          },
        ),
      ],
    );
  }

  /// Returns a list of input formatters based on the text field type.
  _customRegex(AppTextFieldType type, int? max) {
    switch (type) {
      case AppTextFieldType.email:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@_.]+')),
          LengthLimitingTextInputFormatter(max ?? 250),
        ];
      case AppTextFieldType.password:
        return [LengthLimitingTextInputFormatter(max ?? 200)];
      case AppTextFieldType.text:
        return [
          // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\u0600-\u06FF ]+')),
          //deny special characters
          LengthLimitingTextInputFormatter(max ?? 1000),
        ];
      case AppTextFieldType.number:
        return [
          // FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
          LengthLimitingTextInputFormatter(max ?? 250),
        ];
      case AppTextFieldType.phone:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]+')),
          // LengthLimitingTextInputFormatter(max ?? 11),
        ];
      case AppTextFieldType.name:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\u0600-\u06FF ]+')),
          FilteringTextInputFormatter.deny(
            RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]'),
          ),
          FilteringTextInputFormatter.deny(
            RegExp(r'[!@#<>؟"؛٪:_`~;[\]\\|=+)(*&^%0-9-]'),
          ),
          FilteringTextInputFormatter.deny(RegExp(r'[٠١٢٣٤٥٦٧٨٩]')),
          LengthLimitingTextInputFormatter(max ?? 50),
        ];
      case AppTextFieldType.price:
        return [
          FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          LengthLimitingTextInputFormatter(max ?? 14),
        ];
      case AppTextFieldType.any:
        return null;
    }
  }

  /// Returns the appropriate keyboard type based on the text field type.
  _customKeyBoard(AppTextFieldType type) {
    const keyboardMapping = {
      AppTextFieldType.email: TextInputType.emailAddress,
      AppTextFieldType.password: TextInputType.visiblePassword,
      AppTextFieldType.text: TextInputType.text,
      AppTextFieldType.number: TextInputType.number,
      AppTextFieldType.phone: TextInputType.phone,
      AppTextFieldType.name: TextInputType.text,
      AppTextFieldType.price: TextInputType.number,
      AppTextFieldType.any: TextInputType.text,
    };
    return keyboardMapping[type] ?? TextInputType.text;
  }
}
