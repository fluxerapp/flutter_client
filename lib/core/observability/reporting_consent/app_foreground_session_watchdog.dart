import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String kAppForegroundSessionActiveKey = 'app_foreground_session_active';

class AppForegroundSessionBootstrapResult {
  const AppForegroundSessionBootstrapResult({required this.hadForegroundCrash});

  final bool hadForegroundCrash;
}

AppForegroundSessionBootstrapResult? _bootstrapResult;
_AppForegroundSessionLifecycleObserver? _lifecycleObserver;

AppForegroundSessionBootstrapResult get cachedAppForegroundSessionBootstrap =>
    _bootstrapResult ??
    const AppForegroundSessionBootstrapResult(hadForegroundCrash: false);

Future<AppForegroundSessionBootstrapResult>
bootstrapAppForegroundSession() async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final AppForegroundSessionBootstrapResult result =
      AppForegroundSessionBootstrapResult(
        hadForegroundCrash:
            preferences.getBool(kAppForegroundSessionActiveKey) ?? false,
      );
  _bootstrapResult = result;
  final WidgetsBinding binding = WidgetsBinding.instance;
  final _AppForegroundSessionLifecycleObserver? previousObserver =
      _lifecycleObserver;
  if (previousObserver != null) {
    binding.removeObserver(previousObserver);
  }
  final _AppForegroundSessionLifecycleObserver observer =
      _AppForegroundSessionLifecycleObserver(preferences);
  _lifecycleObserver = observer;
  binding.addObserver(observer);
  await observer.record(binding.lifecycleState);
  return result;
}

class _AppForegroundSessionLifecycleObserver extends WidgetsBindingObserver {
  _AppForegroundSessionLifecycleObserver(this._preferences);

  final SharedPreferences _preferences;

  Future<void> record(AppLifecycleState? state) async {
    final bool active = state == AppLifecycleState.resumed;
    if (_preferences.getBool(kAppForegroundSessionActiveKey) == active) {
      return;
    }
    await _preferences.setBool(kAppForegroundSessionActiveKey, active);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    unawaited(record(state));
  }
}
