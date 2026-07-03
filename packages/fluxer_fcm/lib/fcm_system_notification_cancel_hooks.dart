typedef FcmNativeSystemNotificationCancelHandler =
    Future<void> Function({
      required Iterable<String> messageIds,
      required int excludeNotificationId,
    });

abstract final class FcmSystemNotificationCancelHooks {
  static FcmNativeSystemNotificationCancelHandler? cancelDuplicates;

  static Future<void> tryCancelDuplicates({
    required Iterable<String> messageIds,
    required int excludeNotificationId,
  }) async {
    final FcmNativeSystemNotificationCancelHandler? handler = cancelDuplicates;
    if (handler == null) {
      return;
    }
    await handler(
      messageIds: messageIds,
      excludeNotificationId: excludeNotificationId,
    );
  }

  static void resetForTesting() {
    cancelDuplicates = null;
  }
}
