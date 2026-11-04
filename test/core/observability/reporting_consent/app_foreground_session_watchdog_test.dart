import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/observability/reporting_consent/app_foreground_session_watchdog.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  Future<bool?> storedFlag() async {
    await pumpEventQueue();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getBool(kAppForegroundSessionActiveKey);
  }

  void changeLifecycle(AppLifecycleState state) {
    WidgetsBinding.instance.handleAppLifecycleStateChanged(state);
  }

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test('a launch after a foreground crash reports it', () async {
    SharedPreferences.setMockInitialValues(<String, Object>{
      kAppForegroundSessionActiveKey: true,
    });

    final AppForegroundSessionBootstrapResult result =
        await bootstrapAppForegroundSession();

    expect(result.hadForegroundCrash, isTrue);
  });

  test(
    'a launch in the background does not mark a foreground session',
    () async {
      changeLifecycle(AppLifecycleState.hidden);
      changeLifecycle(AppLifecycleState.paused);

      final AppForegroundSessionBootstrapResult result =
          await bootstrapAppForegroundSession();

      expect(result.hadForegroundCrash, isFalse);
      expect(await storedFlag(), isNot(isTrue));
    },
  );

  test(
    'opening the app switcher clears the flag before a swipe-away',
    () async {
      await bootstrapAppForegroundSession();
      changeLifecycle(AppLifecycleState.resumed);
      expect(await storedFlag(), isTrue);

      changeLifecycle(AppLifecycleState.inactive);

      expect(await storedFlag(), isFalse);
      final AppForegroundSessionBootstrapResult relaunch =
          await bootstrapAppForegroundSession();
      expect(relaunch.hadForegroundCrash, isFalse);
    },
  );
}
