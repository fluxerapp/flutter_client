import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

const String kAppForegroundSessionMarkerName = 'app_foreground_session_active';

class AppForegroundSessionBootstrapResult {
  const AppForegroundSessionBootstrapResult({required this.hadForegroundCrash});

  final bool hadForegroundCrash;
}

AppForegroundSessionBootstrapResult? _bootstrapResult;
_AppForegroundSessionLifecycleObserver? _lifecycleObserver;

AppForegroundSessionBootstrapResult get cachedAppForegroundSessionBootstrap =>
    _bootstrapResult ??
    const AppForegroundSessionBootstrapResult(hadForegroundCrash: false);

Future<AppForegroundSessionBootstrapResult> bootstrapAppForegroundSession({
  Directory? directory,
}) async {
  final Directory markerDirectory =
      directory ?? await getApplicationSupportDirectory();
  final File marker = File(
    '${markerDirectory.path}/$kAppForegroundSessionMarkerName',
  );
  final AppForegroundSessionBootstrapResult result =
      AppForegroundSessionBootstrapResult(
        hadForegroundCrash: marker.existsSync(),
      );
  _bootstrapResult = result;
  final WidgetsBinding binding = WidgetsBinding.instance;
  final _AppForegroundSessionLifecycleObserver? previousObserver =
      _lifecycleObserver;
  if (previousObserver != null) {
    binding.removeObserver(previousObserver);
  }
  final _AppForegroundSessionLifecycleObserver observer =
      _AppForegroundSessionLifecycleObserver(marker);
  _lifecycleObserver = observer;
  binding.addObserver(observer);
  observer.didChangeAppLifecycleState(
    binding.lifecycleState ?? AppLifecycleState.detached,
  );
  return result;
}

class _AppForegroundSessionLifecycleObserver extends WidgetsBindingObserver {
  _AppForegroundSessionLifecycleObserver(this._marker);

  final File _marker;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _marker.createSync(recursive: true);
      return;
    }
    if (_marker.existsSync()) {
      _marker.deleteSync();
    }
  }
}
