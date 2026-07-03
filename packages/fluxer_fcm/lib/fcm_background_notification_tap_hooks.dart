typedef FcmBackgroundNotificationTapHandler =
    void Function(String? payloadJson);

abstract final class FcmBackgroundNotificationTapHooks {
  static FcmBackgroundNotificationTapHandler? onTap;

  static void handleTap(String? payloadJson) {
    onTap?.call(payloadJson);
  }

  static void resetForTesting() {
    onTap = null;
  }
}
