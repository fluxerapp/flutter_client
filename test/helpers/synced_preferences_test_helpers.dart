import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';

Future<void> drainAsyncWork({int rounds = 64}) async {
  for (var i = 0; i < rounds; i++) {
    await pumpEventQueue();
  }
}

Future<void> flushSyncedPreferencesDebounce(
  SyncedPreferencesStore store,
) async {
  store.triggerDebouncedPushForTest();
  await drainAsyncWork();
}

Future<void> flushSyncedPreferencesRateLimitRetry(
  SyncedPreferencesStore store,
) async {
  store.triggerRateLimitRetryForTest();
  await drainAsyncWork();
}
