import 'package:flutter/services.dart';

class ExpiryDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), ''); // Remove non-numeric characters

    if (text.isEmpty) return newValue;

    String formattedText = '';

    if (text.length == 1) {
      if (int.parse(text) > 1) {
        // If first digit is greater than 1, prepend "0"
        formattedText = '0$text/';
      } else {
        formattedText = text;
      }
    } else if (text.length == 2) {
      int month = int.parse(text);
      if (month > 12) {
        // Prevent invalid months (13-99)
        return oldValue;
      }
      formattedText = '$text/';
    } else if (text.length > 2) {
      formattedText =
      '${text.substring(0, 2)}/${text.substring(2, text.length.clamp(2, 4))}';
    }

    // Handle backspace (removing "/")
    if (oldValue.text.endsWith('/') &&
        newValue.text.length < oldValue.text.length) {
      formattedText = formattedText.substring(0, formattedText.length - 1);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}