import 'package:flutter/material.dart';

import '../theme/colors_manager.dart';
import '../theme/text_styles.dart';

/// A stateless widget that represents a customizable button.
class AppButton extends StatelessWidget {
  /// The text to display on the button.
  final String? text;
  final Widget? child;

  /// The callback function to be executed when the button is pressed.
  final Function()? onPressed;

  /// The width of the button.
  final double width;

  /// The height of the button.
  final double? height;

  /// The background color of the button.
  final Color color;

  /// The border color of the button.
  final Color? borderColor;


  /// The margin around the button.
  final EdgeInsetsGeometry? margin;

  /// Whether the button is filled with color or not.
  final bool filled;
  final bool withBorder;

  /// The text style of the button text.
  final TextStyle? style;

  /// Creates an [AppButton] widget.
  ///
  /// \param text The text to display on the button.
  /// \param onPressed The callback function to be executed when the button is pressed.
  /// \param width The width of the button. Defaults to double.infinity.
  /// \param height The height of the button. Defaults to 50.
  /// \param color The background color of the button. Defaults to ColorsManager.mainColor.
  /// \param borderColor The border color of the button. Defaults to null.
  /// \param margin The margin around the button. Defaults to null.
  /// \param filled Whether the button is filled with color or not. Defaults to true.
  /// \param style The text style of the button text. Defaults to null.
  const AppButton(
      {super.key,
      this.text,
      this.onPressed,
      this.width = double.infinity,
      this.margin,
      this.borderColor,
      this.filled = true,
      this.withBorder = false,
      this.height,
      this.child,
      this.color = ColorsManager.mainColor,
      this.style})
      : assert(text != null || child != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height ?? 50,
        margin: margin,
        decoration: BoxDecoration(
            color: filled ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(22),
            border: !withBorder
                ? null
                : Border.all(
                    color: filled
                        ? Colors.transparent
                        : borderColor ?? ColorsManager.mainColor)),
        child: Center(
          child: child ??
              Text(
                text!,
                style: style ??
                    TextStyles.fontAppButton.copyWith(
                        color: filled ? Colors.white : color),
              ),
        ),
      ),
    );
  }
}
