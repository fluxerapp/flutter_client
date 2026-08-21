import Foundation
import UserNotifications

/// APNs payload helpers: channel `thread-id` for grouping, `message_id` for per-message identity.
/// Remote pushes need a per-message `apns-collapse-id` (or none); channel-scoped collapse replaces prior messages.
enum PushNotificationPayload {
  static func resolveThreadIdentifier(from userInfo: [AnyHashable: Any]) -> String? {
    resolveChannelThreadIdentifier(from: userInfo)
  }

  static func resolveChannelThreadIdentifier(from userInfo: [AnyHashable: Any]) -> String? {
    if let aps = userInfo["aps"] as? [AnyHashable: Any],
      let threadId = aps["thread-id"] as? String, !threadId.isEmpty
    {
      return threadId
    }
    if let channelId = userInfo["channel_id"] as? String, !channelId.isEmpty {
      return channelId
    }
    if let data = userInfo["data"] as? [AnyHashable: Any],
      let channelId = data["channel_id"] as? String, !channelId.isEmpty
    {
      return channelId
    }
    return nil
  }

  static func resolveMessageId(from userInfo: [AnyHashable: Any]) -> String? {
    if let messageId = userInfo["message_id"] as? String, !messageId.isEmpty {
      return messageId
    }
    if let data = userInfo["data"] as? [AnyHashable: Any] {
      if let messageId = data["message_id"] as? String, !messageId.isEmpty {
        return messageId
      }
    }
    if let id = userInfo["id"] as? String, !id.isEmpty {
      return id
    }
    if let data = userInfo["data"] as? [AnyHashable: Any],
      let id = data["id"] as? String, !id.isEmpty
    {
      return id
    }
    return nil
  }

  static func resolveNotificationIdentifier(from userInfo: [AnyHashable: Any]) -> String {
    resolveMessageId(from: userInfo) ?? UUID().uuidString
  }

  static func hasApsAlert(_ userInfo: [AnyHashable: Any]) -> Bool {
    guard let aps = userInfo["aps"] as? [String: Any] else {
      return false
    }
    return aps["alert"] != nil
  }

  static func isClearPayload(from userInfo: [AnyHashable: Any]) -> Bool {
    if isClearValue(userInfo["type"]) || isClearValue(userInfo["action"]) {
      return true
    }
    if let data = userInfo["data"] as? [AnyHashable: Any] {
      if isClearValue(data["type"]) || isClearValue(data["action"]) {
        return true
      }
    }
    return false
  }

  static let messageNotificationSoundFileName = "message.caf"
  static let directMessageNotificationSoundFileName = "direct_message.caf"

  static func isDmPayload(from userInfo: [AnyHashable: Any]) -> Bool {
    guard let guildId = resolveGuildId(from: userInfo) else {
      return true
    }
    return guildId == "@me" || guildId == "null"
  }

  static func resolveGuildId(from userInfo: [AnyHashable: Any]) -> String? {
    if let guildId = userInfo["guild_id"] as? String, !guildId.isEmpty {
      return guildId
    }
    if let data = userInfo["data"] as? [AnyHashable: Any],
      let guildId = data["guild_id"] as? String, !guildId.isEmpty
    {
      return guildId
    }
    return nil
  }

  static func resolveNotificationSound(from userInfo: [AnyHashable: Any]) -> UNNotificationSound? {
    if isClearPayload(from: userInfo) {
      return nil
    }
    let soundFileName = isDmPayload(from: userInfo)
      ? directMessageNotificationSoundFileName
      : messageNotificationSoundFileName
    return UNNotificationSound(named: UNNotificationSoundName(rawValue: soundFileName))
  }

  static func resolveChannelId(from userInfo: [AnyHashable: Any]) -> String? {
    if let channelId = userInfo["channel_id"] as? String, !channelId.isEmpty {
      return channelId
    }
    if let data = userInfo["data"] as? [AnyHashable: Any],
      let channelId = data["channel_id"] as? String, !channelId.isEmpty
    {
      return channelId
    }
    if let threadId = resolveChannelThreadIdentifier(from: userInfo),
      threadId.hasPrefix("channel:")
    {
      let suffix = String(threadId.dropFirst("channel:".count))
      if !suffix.isEmpty {
        return suffix
      }
    }
    if let url = resolveNavigationUrl(from: userInfo) {
      return extractChannelId(from: url)
    }
    return nil
  }

  static func resolveNavigationUrl(from userInfo: [AnyHashable: Any]) -> String? {
    if let url = userInfo["url"] as? String, !url.isEmpty {
      return url
    }
    if let navigate = userInfo["navigate"] as? String, !navigate.isEmpty {
      return navigate
    }
    if let data = userInfo["data"] as? [AnyHashable: Any] {
      if let url = data["url"] as? String, !url.isEmpty {
        return url
      }
      if let navigate = data["navigate"] as? String, !navigate.isEmpty {
        return navigate
      }
    }
    return nil
  }

  static func extractChannelId(from path: String) -> String? {
    var normalized = path.trimmingCharacters(in: .whitespacesAndNewlines)
    if normalized.hasPrefix("http://") || normalized.hasPrefix("https://"),
      let url = URL(string: normalized)
    {
      normalized = url.path
    }
    if !normalized.hasPrefix("/") {
      normalized = "/\(normalized)"
    }
    guard normalized.hasPrefix("/channels/") else {
      return nil
    }
    let parts = normalized.split(separator: "/").map(String.init)
    guard parts.count >= 4 else {
      return nil
    }
    if parts[2] == "@me" || parts[2] == "@favorites" {
      return parts[3]
    }
    if parts[3] == "members" {
      return nil
    }
    return parts[3]
  }

  static func notificationMatchesChannel(
    _ notification: UNNotification,
    channelId: String
  ) -> Bool {
    let userInfo = notification.request.content.userInfo
    if let resolvedChannelId = resolveChannelId(from: userInfo), resolvedChannelId == channelId {
      return true
    }
    let channelTag = "channel:\(channelId)"
    if let threadId = resolveChannelThreadIdentifier(from: userInfo),
      threadId == channelTag || threadId == channelId
    {
      return true
    }
    if let messageId = resolveMessageId(from: userInfo),
      notification.request.identifier == messageId
    {
      return true
    }
    return false
  }

  private static func isClearValue(_ value: Any?) -> Bool {
    guard let string = value as? String, !string.isEmpty else {
      return false
    }
    return string == "notification_clear" || string == "clear_channel"
  }
}
