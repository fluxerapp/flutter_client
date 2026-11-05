import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/reporting_consent/app_foreground_session_watchdog.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late Directory directory;

  bool markerExists() =>
      File('${directory.path}/$kAppForegroundSessionMarkerName').existsSync();

  void changeLifecycle(AppLifecycleState state) {
    WidgetsBinding.instance.handleAppLifecycleStateChanged(state);
  }

  Future<bool> relaunchReportsCrash() async {
    final AppForegroundSessionBootstrapResult result =
        await bootstrapAppForegroundSession(directory: directory);
    return result.hadForegroundCrash;
  }

  setUp(() async {
    directory = await Directory.systemTemp.createTemp('foreground_session');
    changeLifecycle(AppLifecycleState.detached);
  });

  tearDown(() async {
    changeLifecycle(AppLifecycleState.detached);
    await directory.delete(recursive: true);
  });

  test('a kill while resumed is reported on the next launch', () async {
    expect(await relaunchReportsCrash(), isFalse);
    changeLifecycle(AppLifecycleState.resumed);

    expect(await relaunchReportsCrash(), isTrue);
  });

  test(
    'Home clears the marker inside the lifecycle callback, before iOS suspends',
    () async {
      await relaunchReportsCrash();
      changeLifecycle(AppLifecycleState.resumed);
      expect(markerExists(), isTrue);

      changeLifecycle(AppLifecycleState.inactive);
      expect(markerExists(), isFalse);
      changeLifecycle(AppLifecycleState.hidden);
      changeLifecycle(AppLifecycleState.paused);

      expect(await relaunchReportsCrash(), isFalse);
    },
  );

  test('a background launch from a push does not mark a session', () async {
    changeLifecycle(AppLifecycleState.paused);

    expect(await relaunchReportsCrash(), isFalse);
    expect(markerExists(), isFalse);
  });
}
