import Foundation

enum CallRingOutcome: Equatable {
  case end
  case ring(CallRingFields)
}

struct CallRingFields: Equatable {
  let channelId: String
  let messageId: String
  let callerName: String
  let handle: String
  let callerAvatarUrl: String?
  let durationMs: Int
}

enum CallRingResolver {
  static let fallbackName = "Fluxer"
  static let fallbackHandle = "Incoming call"
  static let minimumDurationMs = 1000

  static func resolve(
    plaintext: String?,
    accountUserId: String,
    nowMs: Int64,
    ringingMessageIds: Set<String>,
    isForeground: Bool
  ) -> CallRingOutcome {
    guard let plaintext,
      let data = plaintext.data(using: .utf8),
      let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    else {
      return .end
    }
    let fields = (json["data"] as? [String: Any]) ?? json
    let type = fields["type"] as? String ?? json["type"] as? String
    guard type == "call_ring" else {
      return .end
    }
    guard let channelId = text(fields["channel_id"]),
      let messageId = text(fields["message_id"])
    else {
      return .end
    }
    if let target = text(fields["target_user_id"]),
      !accountUserId.isEmpty,
      target != accountUserId
    {
      return .end
    }
    if isForeground || ringingMessageIds.contains(messageId) {
      return .end
    }
    let expires = int64(fields["expires_at_ms"])
    if let expires, expires <= nowMs {
      return .end
    }
    let callerName = text(fields["caller_name"])
    let avatar = text(fields["caller_avatar_url"])
    let name = callerName ?? fallbackName
    let remaining = expires.map { Int($0 - nowMs) } ?? minimumDurationMs
    let duration = max(minimumDurationMs, remaining)
    return .ring(
      CallRingFields(
        channelId: channelId,
        messageId: messageId,
        callerName: name,
        handle: callerName ?? fallbackHandle,
        callerAvatarUrl: avatar,
        durationMs: duration
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
