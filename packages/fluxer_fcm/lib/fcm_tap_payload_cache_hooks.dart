typedef FcmTapPayloadCacheSaver =
    Future<void> Function({
      required Map<String, String> payload,
      String? gcmMessageId,
    });

typedef FcmTapPayloadCachePredicate =
    bool Function(Map<String, String> payload);

abstract final class FcmTapPayloadCacheHooks {
  static FcmTapPayloadCachePredicate? shouldSave;
  static FcmTapPayloadCacheSaver? save;

  static bool shouldSaveTapPayloadCache(Map<String, String> payload) {
    return shouldSave?.call(payload) ?? false;
  }

  static Future<void> saveTapPayloadCache({
    required Map<String, String> payload,
    String? gcmMessageId,
  }) async {
    final FcmTapPayloadCacheSaver? saver = save;
    if (saver == null) {
      return;
    }
    await saver(payload: payload, gcmMessageId: gcmMessageId);
  }

  static void resetForTesting() {
    shouldSave = null;
    save = null;
  }
}
