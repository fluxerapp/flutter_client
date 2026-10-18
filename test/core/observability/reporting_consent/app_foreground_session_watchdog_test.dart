import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/reporting_consent/app_foreground_session_watchdog.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test('bootstrap reports no crash when session flag was cleared', () async {
    final AppForegroundSessionBootstrapResult result =
        await bootstrapAppForegroundSession();

    expect(result.hadForegroundCrash, isFalse);
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(preferences.getBool(kAppForegroundSessionActiveKey), isTrue);
  });

  test(
    'bootstrap reports foreground crash when session flag was set',
    () async {
      SharedPreferences.setMockInitialValues(<String, Object>{
        kAppForegroundSessionActiveKey: true,
      });

      final AppForegroundSessionBootstrapResult result =
          await bootstrapAppForegroundSession();

      expect(result.hadForegroundCrash, isTrue);
    },
  );

  test('paused lifecycle clears the session flag', () async {
    await bootstrapAppForegroundSession();
    installAppForegroundSessionLifecycleBinding();

    WidgetsBinding.instance.handleAppLifecycleStateChanged(
      AppLifecycleState.paused,
    );
    await pumpEventQueue();

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(preferences.getBool(kAppForegroundSessionActiveKey), isFalse);
  });

  test('resumed lifecycle sets the session flag', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      kAppForegroundSessionActiveKey: false,
    });
    installAppForegroundSessionLifecycleBinding();

    WidgetsBinding.instance.handleAppLifecycleStateChanged(
      AppLifecycleState.resumed,
    );
    await pumpEventQueue();

    final SharedPreferences preferences = await SharedPreferences.getInstance();
    expect(preferences.getBool(kAppForegroundSessionActiveKey), isTrue);
  });
}
