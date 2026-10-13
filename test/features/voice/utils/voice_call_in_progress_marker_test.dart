import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_call_in_progress_marker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
  });

  test(
    'a session that dies in a call is reported once on next launch',
    () async {
      await markVoiceCallInProgress('c1');
      expect(await takeInterruptedVoiceCallChannelId(), 'c1');
      expect(await takeInterruptedVoiceCallChannelId(), isNull);
    },
  );

  test('leaving the call clears the marker', () async {
    await markVoiceCallInProgress('c1');
    await clearVoiceCallInProgress();
    expect(await takeInterruptedVoiceCallChannelId(), isNull);
  });

  test('switching channels keeps only the latest channel', () async {
    await markVoiceCallInProgress('c1');
    await markVoiceCallInProgress('c2');
    expect(await takeInterruptedVoiceCallChannelId(), 'c2');
  });
}
