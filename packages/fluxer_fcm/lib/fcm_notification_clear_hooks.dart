import 'dart:async';

typedef FcmNotificationClearHandler =
    FutureOr<void> Function(Map<String, String> payload);

abstract final class FcmNotificationClearHooks {
  static FcmNotificationClearHandler? onClear;

  static Future<void> handleClear(Map<String, String> payload) async {
    final FcmNotificationClearHandler? handler = onClear;
    if (handler == null) {
      return;
    }
    await handler(payload);
  }

  static void resetForTesting() {
    onClear = null;
  }
}
