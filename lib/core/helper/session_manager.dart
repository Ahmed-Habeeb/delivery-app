import 'dart:async';
import 'package:delivery_app/core/helper/extensions.dart';
import 'package:delivery_app/core/routing/routes.dart';
import 'package:flutter/material.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();

  Timer? _sessionTimer;
  final int sessionTimeoutSeconds = 120; // 2 minutes
  VoidCallback? onSessionExpired;

  void startSessionTimer(BuildContext context) {
    resetSessionTimer(context);
  }

  void resetSessionTimer(BuildContext context) {
    debugPrint('Session timer reset');
    _sessionTimer?.cancel();
    _sessionTimer = Timer(Duration(seconds: sessionTimeoutSeconds), () {
      _handleSessionExpiry(context);
    });
  }

  void _handleSessionExpiry(BuildContext context) {
    // Navigate to login screen
    context.offAllNamed(Routes.login);
    onSessionExpired?.call();
  }

  void cancelSessionTimer() {
    _sessionTimer?.cancel();
  }

  void onAppResumed(BuildContext context) {
    resetSessionTimer(context);
  }

  void onAppPaused(BuildContext context) {
    resetSessionTimer(context); // Restart timer when app goes to background
  }
}
