import 'package:flutter/material.dart';
import '../helper/session_manager.dart';

class SessionWrapper extends StatefulWidget {
  final Widget child;

  const SessionWrapper({super.key, required this.child});

  @override
  State<SessionWrapper> createState() => _SessionWrapperState();
}

class _SessionWrapperState extends State<SessionWrapper>
    with WidgetsBindingObserver {
  final SessionManager _sessionManager = SessionManager();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _sessionManager.startSessionTimer(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _sessionManager.cancelSessionTimer();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _sessionManager.onAppResumed(context);
    } else if (state == AppLifecycleState.paused) {
      _sessionManager.onAppPaused(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _sessionManager.resetSessionTimer(context);
      },
      onPanUpdate: (details) {
        _sessionManager.resetSessionTimer(context);
      },
      onDoubleTap: () {
        _sessionManager.resetSessionTimer(context);
      },
      child: widget.child,
    );
  }
}