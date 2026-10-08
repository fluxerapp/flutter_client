import Foundation

enum CallRingOutcome: Equatable {
  case reject(messageId: String?)
  case ring(CallRingFields)
}

struct CallRingFields: Equatable {
  let channelId: String
  let messageId: String
  let callerId: String?
  let callerName: String
  let handle: String
  let callerAvatarUrl: String?
  let durationMs: Int
  let targetUserId: String?
  let guildId: String?

  var callUUID: UUID {
    CallRingUuid.v5(name: messageId)
  }
}

enum CallRingResolver {
  static let fallbackHandle = "Incoming call"
  static let minimumDurationMs = 1000
  static let defaultDurationMs = 45_000
  static let expiryDeliveryGraceMs: Int64 = 10_000

  static func resolve(
    plaintext: String?,
    accountUserId: String,
    nowMs: Int64
  ) -> CallRingOutcome {
    guard let plaintext,
      let data = plaintext.data(using: .utf8),
      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else {
      NSLog("[CallKit] voip ring rejected: malformed payload")
      return .reject(messageId: nil)
    }
    let fields = (json["data"] as? [String: Any]) ?? json
    let type = fields["type"] as? String ?? json["type"] as? String
    let messageId = text(fields["message_id"])
    guard type == "call_ring" else {
      NSLog("[CallKit] voip ring rejected: not a call_ring")
      return .reject(messageId: nil)
    }
    guard let channelId = text(fields["channel_id"]),
      let messageId
    else {
      NSLog("[CallKit] voip ring rejected: missing channel_id or message_id")
      return .reject(messageId: messageId)
    }
    if let target = text(fields["target_user_id"]),
      !accountUserId.isEmpty,
      target != accountUserId
    {
      NSLog("[CallKit] voip ring rejected: target_user_id mismatch")
      return .reject(messageId: messageId)
    }
    let expires = int64(fields["expires_at_ms"])
    if let expires,
      expires + expiryDeliveryGraceMs <= nowMs
    {
      NSLog("[CallKit] voip ring rejected: expired")
      return .reject(messageId: messageId)
    }
    let callerName = text(fields["caller_name"])
    let remaining = expires.map { Int($0 - nowMs) } ?? defaultDurationMs
    return .ring(
      CallRingFields(
        channelId: channelId,
        messageId: messageId,
        callerId: text(fields["caller_id"]),
        callerName: callerName ?? fallbackHandle,
        handle: callerName ?? fallbackHandle,
        callerAvatarUrl: text(fields["caller_avatar_url"]),
        durationMs: max(minimumDurationMs, remaining),
        targetUserId: text(fields["target_user_id"])
          ?? (accountUserId.isEmpty ? nil : accountUserId),
        guildId: text(fields["guild_id"])
      )
    )
  }

  private static func text(_ value: Any?) -> String? {
    if let text = value as? String, !text.isEmpty {
      return text
    }
    if let number = value as? NSNumber {
      return number.stringValue
    }
    return nil
  }

  private static func int64(_ value: Any?) -> Int64? {
    if let number = value as? NSNumber {
      return number.int64Value
    }
    if let text = value as? String {
      return Int64(text)
    }
    return nil
  }
}
