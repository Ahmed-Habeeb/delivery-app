import 'package:flutter/material.dart';

import 'app_context.dart';

/// A utility class that provides methods to show success and error snack bars.
class AppSnackBars {
  /// Displays a success snack bar with the given [message].
  ///
  /// The snack bar has a green background color.
  static successSnackBar(String message) {
    if(AppContext.context==null){
      return;
    }
    return ScaffoldMessenger.of(AppContext.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.green,
      ),
    );
  }

  /// Displays an error snack bar with the given [message].
  ///
  /// The snack bar has a red background color.
  static errorSnackBar(String message) {
    if(AppContext.context==null){
      return;
    }
    return ScaffoldMessenger.of(AppContext.context!).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}