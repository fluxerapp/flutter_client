import Foundation
import UserNotifications

/// APNs payload helpers: channel `thread-id` for grouping, `message_id` for per-message identity.
/// Remote pushes need a per-message `apns-collapse-id` (or none); channel-scoped collapse replaces prior messages.
enum PushNotificationPayload {
  static let messageReplyCategoryId = "fluxer_message"
  static let messageReplyActionId = "fluxer_reply"

  static func canReply(from userInfo: [AnyHashable: Any]) -> Bool {
    if isClearPayload(from: userInfo) || isCallRingPayload(from: userInfo) {
      return false
    }
    return resolveChannelId(from: userInfo) != nil && replyMessageId(from: userInfo) != nil
  }

  static func resolveSenderIdentifier(from userInfo: [AnyHashable: Any]) -> String? {
    if let authorId = nonEmptyText(userInfo["author_id"]) {
      return authorId
    }
    if let data = userInfo["data"] as? [AnyHashable: Any],
      let authorId = nonEmptyText(data["author_id"])
    {
      return authorId
    }
    if let avatarUrl = NotificationPayloadMedia.resolveAvatarUrl(from: userInfo) {
      return senderId(fromAvatarUrl: avatarUrl)
    }
    return nil
  }

  static func senderId(fromAvatarUrl url: URL) -> String? {
    let parts = url.path.split(separator: "/").map(String.init)
    guard let avatarsIndex = parts.firstIndex(of: "avatars"),
      avatarsIndex + 1 < parts.count
    else {
      return nil
    }
    let candidate = parts[avatarsIndex + 1]
    if candidate.isEmpty || candidate.contains(".") {
      return nil
    }
    return candidate
  }

  static func replyMessageId(from userInfo: [AnyHashable: Any]) -> String? {
    if let messageId = userInfo["message_id"] as? String, !messageId.isEmpty {
      return messageId
    }
    if let data = userInfo["data"] as? [AnyHashable: Any],
      let messageId = data["message_id"] as? String, !messageId.isEmpty
    {
      return messageId
    }
    return nil
  }

  static func resolveThreadIdentifier(from userInfo: [AnyHashable: Any]) -> String? {
    resolveChannelThreadIdentifier(from: userInfo)
  }

  static func resolveChannelThreadIdentifier(from userInfo: [AnyHashable: Any]) -> String? {
    if let aps = userInfo["aps"] as? [AnyHashable: Any],
      let threadId = nonEmptyText(aps["thread-id"])
    {
      return threadId
    }
    if let notificationTag = nonEmptyText(userInfo["notification_tag"]) {
      return notificationTag
    }
    if let data = userInfo["data"] as? [AnyHashable: Any],
      let notificationTag = nonEmptyText(data["notification_tag"])
    {
      return notificationTag
    }
    if let channelId = rawChannelId(from: userInfo) {
      return "channel:\(channelId)"
    }
    return nil
  }

  /// Group name for guild channels and group DMs. Nil for a 1:1 DM.
  static func resolveSpeakableGroupName(title: String) -> String? {
    if title.hasSuffix(" (Group DM)") {
      return "Group DM"
    }
    guard let open = title.range(of: " (#", options: .backwards),
      let comma = title.range(of: ", ", range: open.upperBound..<title.endIndex),
      title.hasSuffix(")")
    else {
      return nil
    }
    let channelName = title[open.upperBound..<comma.lowerBound]
    if channelName.isEmpty {
      return nil
    }
    return String(channelName)
  }

  static func resolveMessageSentDate(from userInfo: [AnyHashable: Any]) -> Date? {
    guard let messageId = replyMessageId(from: userInfo) ?? resolveMessageId(from: userInfo),
      let sentMs = SnowflakeTime.timestampMs(from: messageId)
    else {
      return nil
    }
    let nowMs = Int64(Date().timeIntervalSince1970 * 1000)
    guard sentMs <= nowMs + 60_000 else {
      return nil
    }
    return Date(timeIntervalSince1970: TimeInterval(sentMs) / 1000)
  }

  static func resolveMessageId(from userInfo: [AnyHashable: Any]) -> String? {
    if let messageId = replyMessageId(from: userInfo) {
      return messageId
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
    guard let aps = userInfo["aps"] as? [AnyHashable: Any] else {
      return false
    }
    return aps["alert"] != nil
  }

  static func isCallRingPayload(from userInfo: [AnyHashable: Any]) -> Bool {
    if isCallRingValue(userInfo["type"]) {
      return true
    }
    if let data = userInfo["data"] as? [AnyHashable: Any], isCallRingValue(data["type"]) {
      return true
    }
    return false
  }

  static func hasDisplayableAlert(title: String, body: String) -> Bool {
    return !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
      || !body.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
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
    if isClearPayload(from: userInfo) || isCallRingPayload(from: userInfo) {
      return nil
    }
    let soundFileName = isDmPayload(from: userInfo)
      ? directMessageNotificationSoundFileName
      : messageNotificationSoundFileName
    return UNNotificationSound(named: UNNotificationSoundName(rawValue: soundFileName))
  }

  static func resolveChannelId(from userInfo: [AnyHashable: Any]) -> String? {
    if let channelId = rawChannelId(from: userInfo) {
      return channelId
    }
    if let threadId = resolveChannelThreadIdentifier(from: userInfo),
      threadId.hasPrefix("channel:")
    {
      let suffix = String(threadId.dropFirst("channel:".count))
      let channelPart = suffix.split(separator: ":", maxSplits: 1).first.map(String.init) ?? ""
      if !channelPart.isEmpty {
        return channelPart
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

  static func messageIsCoveredByAck(messageId: String?, upToMessageId: String?) -> Bool {
    guard let upToMessageId, !upToMessageId.isEmpty else {
      return true
    }
    guard let messageId, !messageId.isEmpty else {
      return false
    }
    return compareNumericIds(messageId, upToMessageId) <= 0
  }

  static func notificationMatchesChannel(
    _ notification: UNNotification,
    channelId: String
  ) -> Bool {
    let userInfo = notification.request.content.userInfo
    if let resolvedChannelId = resolveChannelId(from: userInfo) {
      return resolvedChannelId == channelId
    }
    let channelTag = "channel:\(channelId)"
    let contentThread = notification.request.content.threadIdentifier
    if contentThread == channelTag ||
      contentThread == channelId ||
      contentThread.hasPrefix("\(channelTag):")
    {
      return true
    }
    if let threadId = resolveChannelThreadIdentifier(from: userInfo),
      threadId == channelTag ||
      threadId == channelId ||
      threadId.hasPrefix("\(channelTag):")
    {
      return true
    }
    let tag = (userInfo["tag"] as? String) ?? (userInfo["notification_tag"] as? String)
    if let tag, tag == channelTag || tag.hasPrefix("\(channelTag):") {
      return true
    }
    return false
  }

  private static func rawChannelId(from userInfo: [AnyHashable: Any]) -> String? {
    if let channelId = nonEmptyText(userInfo["channel_id"]) {
      return channelId
    }
    if let data = userInfo["data"] as? [AnyHashable: Any] {
      return nonEmptyText(data["channel_id"])
    }
    return nil
  }

  private static func compareNumericIds(_ lhs: String, _ rhs: String) -> Int {
    let left = stripLeadingZeros(lhs)
    let right = stripLeadingZeros(rhs)
    if left.count != right.count {
      return left.count < right.count ? -1 : 1
    }
    if left == right {
      return 0
    }
    return left < right ? -1 : 1
  }

  private static func stripLeadingZeros(_ value: String) -> String {
    let stripped = value.drop { $0 == "0" }
    return stripped.isEmpty ? "0" : String(stripped)
  }

  private static func isCallRingValue(_ value: Any?) -> Bool {
    guard let string = value as? String else {
      return false
    }
    return string == "call_ring"
  }

  private static func isClearValue(_ value: Any?) -> Bool {
    guard let string = value as? String, !string.isEmpty else {
      return false
    }
    return string == "notification_clear" || string == "clear_channel"
  }

  private static func nonEmptyText(_ value: Any?) -> String? {
    if let text = value as? String {
      let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
      return trimmed.isEmpty ? nil : trimmed
    }
    if let int = value as? Int {
      return String(int)
    }
    if let number = value as? NSNumber {
      return number.stringValue
    }
    return nil
  }
}
