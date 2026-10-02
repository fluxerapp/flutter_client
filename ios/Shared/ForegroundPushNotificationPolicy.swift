import Foundation

enum ForegroundPushNotificationPolicy {
  static func shouldProcessAlertPush(isAppForeground: Bool) -> Bool {
    return !isAppForeground
  }

  static func targetsOtherAccount(
    userInfo: [AnyHashable: Any],
    activeUserId: String?
  ) -> Bool {
    guard let activeUserId, !activeUserId.isEmpty else {
      return false
    }
    guard let targetUserId = targetUserId(from: userInfo), !targetUserId.isEmpty else {
      return false
    }
    return targetUserId != activeUserId
  }

  static func shouldProcessPush(
    userInfo: [AnyHashable: Any],
    isAppForeground: Bool,
    activeUserId: String? = nil
  ) -> Bool {
    if PushNotificationPayload.isClearPayload(from: userInfo) {
      return true
    }
    guard PushNotificationPayload.hasApsAlert(userInfo) else {
      return false
    }
    if !isAppForeground {
      return true
    }
    return targetsOtherAccount(userInfo: userInfo, activeUserId: activeUserId)
  }

  private static func targetUserId(from userInfo: [AnyHashable: Any]) -> String? {
    if let target = text(userInfo["target_user_id"]) {
      return target
    }
    if let data = userInfo["data"] as? [AnyHashable: Any] {
      return text(data["target_user_id"])
    }
    return nil
  }

  private static func text(_ value: Any?) -> String? {
    if let text = value as? String {
      let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
      return trimmed.isEmpty ? nil : trimmed
    }
    if let number = value as? NSNumber {
      return number.stringValue
    }
    return nil
  }
}
