import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/connection/media_teardown.dart';

void main() {
  testWidgets('does not wait for a frame while the app is backgrounded', (
    WidgetTester tester,
  ) async {
    tester.binding.handleAppLifecycleStateChanged(AppLifecycleState.paused);
    addTearDown(
      () => tester.binding.handleAppLifecycleStateChanged(
        AppLifecycleState.resumed,
      ),
    );
    expect(tester.binding.framesEnabled, isFalse);
    bool done = false;
    await tester.runAsync(() async {
      await waitForVoiceMediaWidgetsToRelease().then((_) => done = true);
    });
    expect(done, isTrue);
  });

  testWidgets('gives up waiting when no frame arrives', (
    WidgetTester tester,
  ) async {
    expect(tester.binding.framesEnabled, isTrue);
    final Stopwatch stopwatch = Stopwatch()..start();
    await tester.runAsync(
      () => waitForVoiceMediaWidgetsToRelease(
        timeout: const Duration(milliseconds: 50),
      ),
    );
    expect(stopwatch.elapsed, lessThan(const Duration(seconds: 5)));
  });
}
