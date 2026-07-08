import Foundation

enum ForegroundPushNotificationPolicy {
  static func shouldProcessAlertPush(isAppForeground: Bool) -> Bool {
    return !isAppForeground
  }

  static func shouldProcessPush(
    userInfo: [AnyHashable: Any],
    isAppForeground: Bool
  ) -> Bool {
    if PushNotificationPayload.isClearPayload(from: userInfo) {
      return true
    }
    guard PushNotificationPayload.hasApsAlert(userInfo) else {
      return false
    }
    return shouldProcessAlertPush(isAppForeground: isAppForeground)
  }
}
