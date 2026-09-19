import Foundation

enum AssistantPendingCommand {
  private static let key = "fluxer.assistant.pending.v1"
  private static let lock = NSLock()
  private static var inFlight = false
  static var performsInBackground = true

  static func queueSend(friendId: String, text: String) {
    queue(sendDmPayload(friendId: friendId, text: text))
  }

  static func queueCall(friendId: String) {
    queue(callPayload(friendId: friendId))
  }

  static func queue(_ payload: [String: Any]) {
    lock.lock()
    storeLocked(payload)
    let runNow = performsInBackground && AssistantBridge.shared.hasDartHandler && !inFlight
    if runNow {
      inFlight = true
    }
    lock.unlock()
    guard runNow else {
      return
    }
    Task {
      defer { endSend() }
      let result = await AssistantBridge.shared.perform(
        payload,
        openApp: false
      )
      if result.status == "ok" {
        clearStored()
      }
    }
  }

  static func sendDmPayload(friendId: String, text: String) -> [String: Any] {
    tagged([
      "type": "sendDm",
      "friendId": friendId,
      "text": text,
    ])
  }

  static func callPayload(friendId: String) -> [String: Any] {
    tagged([
      "type": "voiceStartDmCall",
      "friendId": friendId,
    ])
  }

  static func store(_ payload: [String: Any]) {
    lock.lock()
    defer { lock.unlock() }
    storeLocked(payload)
  }

  static func beginSend() {
    lock.lock()
    inFlight = true
    lock.unlock()
  }

  static func endSend() {
    lock.lock()
    inFlight = false
    lock.unlock()
  }

  static func takeIfAccount(_ accountUserId: String?) -> [String: Any]? {
    lock.lock()
    defer { lock.unlock() }
    if inFlight {
      return nil
    }
    guard let payload = AssistantDefaults.dictionary(forKey: key) else {
      return nil
    }
    let pendingAccount = payload["accountUserId"] as? String
    if let pendingAccount, !pendingAccount.isEmpty, pendingAccount != accountUserId {
      return nil
    }
    AssistantDefaults.remove(forKey: key)
    return payload
  }

  static func clear() {
    lock.lock()
    inFlight = false
    AssistantDefaults.remove(forKey: key)
    lock.unlock()
  }

  private static func storeLocked(_ payload: [String: Any]) {
    AssistantDefaults.set(tagged(payload), forKey: key)
  }

  private static func tagged(_ payload: [String: Any]) -> [String: Any] {
    var next = payload
    if next["accountUserId"] == nil, let accountUserId = AssistantEntityStore.shared.accountUserId {
      next["accountUserId"] = accountUserId
    }
    return next
  }

  private static func clearStored() {
    lock.lock()
    AssistantDefaults.remove(forKey: key)
    lock.unlock()
  }
}
