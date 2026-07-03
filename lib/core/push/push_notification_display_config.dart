abstract final class PushNotificationDisplayConfig {
  PushNotificationDisplayConfig._();

  /// When false, incoming push messages do not post a local notification while
  /// the app is in the foreground. This is a temp mesure
  static const bool foregroundNotificationsEnabled = false;
}
