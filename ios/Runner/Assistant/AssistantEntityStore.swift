import Foundation

struct AssistantGuildRecord: Equatable {
  let id: String
  let name: String
}

struct AssistantChannelRecord: Equatable {
  let id: String
  let name: String
  let kind: String
  let guildId: String?
  let guildName: String?

  var isVoice: Bool { kind == "voice" }

  func matches(_ query: String) -> Bool {
    let needle = query.trimmingCharacters(in: .whitespacesAndNewlines)
    if needle.isEmpty {
      return false
    }
    if name.caseInsensitiveCompare(needle) == .orderedSame {
      return true
    }
    if name.localizedStandardContains(needle) {
      return true
    }
    if let guildName, !guildName.isEmpty {
      return guildName.caseInsensitiveCompare(needle) == .orderedSame
    }
    return false
  }
}

final class AssistantEntityStore {
  static let shared = AssistantEntityStore()

  private static let persistKey = "fluxer.assistant.entities.v1"

  private let lock = NSLock()
  private var accountUserIdStorage: String?
  private var friendsStorage: [AssistantFriendRecord] = []
  private var guildsStorage: [AssistantGuildRecord] = []
  private var channelsStorage: [AssistantChannelRecord] = []

  private init() {
    loadPersisted()
    AssistantAvatarCache.prefetch(friendsStorage.map(\.avatarUrl))
  }

  var accountUserId: String? {
    lock.lock()
    defer { lock.unlock() }
    return accountUserIdStorage
  }

  var friends: [AssistantFriendRecord] {
    lock.lock()
    defer { lock.unlock() }
    return friendsStorage
  }

  var guilds: [AssistantGuildRecord] {
    lock.lock()
    defer { lock.unlock() }
    return guildsStorage
  }

  var channels: [AssistantChannelRecord] {
    lock.lock()
    defer { lock.unlock() }
    return channelsStorage
  }

  func replace(_ raw: Any?) {
    guard let map = raw as? [String: Any] else {
      return
    }
    let friends = Self.parseFriends(map["friends"])
    let guilds = Self.parseGuilds(map["guilds"])
    let channels = Self.parseChannels(map["channels"])
    let accountRaw = map["accountUserId"] as? String
    let accountUserId = (accountRaw?.isEmpty == false) ? accountRaw : nil
    lock.lock()
    accountUserIdStorage = accountUserId
    friendsStorage = friends
    guildsStorage = guilds
    channelsStorage = channels
    lock.unlock()
    persist(
      accountUserId: accountUserId,
      friends: friends,
      guilds: guilds,
      channels: channels
    )
    AssistantAvatarCache.prefetch(friends.map(\.avatarUrl))
  }

  private func persist(
    accountUserId: String?,
    friends: [AssistantFriendRecord],
    guilds: [AssistantGuildRecord],
    channels: [AssistantChannelRecord]
  ) {
    var payload: [String: Any] = [
      "friends": friends.map {
        var row: [String: Any] = ["id": $0.id, "name": $0.name, "username": $0.username]
        if !$0.avatarUrl.isEmpty {
          row["avatarUrl"] = $0.avatarUrl
        }
        return row
      },
      "guilds": guilds.map { ["id": $0.id, "name": $0.name] },
      "channels": channels.map {
        var row: [String: Any] = ["id": $0.id, "name": $0.name, "kind": $0.kind]
        if let guildId = $0.guildId {
          row["guildId"] = guildId
        }
        if let guildName = $0.guildName {
          row["guildName"] = guildName
        }
        return row
      },
    ]
    if let accountUserId, !accountUserId.isEmpty {
      payload["accountUserId"] = accountUserId
    }
    AssistantDefaults.set(payload, forKey: Self.persistKey)
  }

  private func loadPersisted() {
    let payload = AssistantDefaults.dictionary(forKey: Self.persistKey)
    let accountRaw = payload?["accountUserId"] as? String
    accountUserIdStorage = (accountRaw?.isEmpty == false) ? accountRaw : nil
    friendsStorage = Self.parseFriends(payload?["friends"])
    guildsStorage = Self.parseGuilds(payload?["guilds"])
    channelsStorage = Self.parseChannels(payload?["channels"])
  }

  private static func parseFriends(_ raw: Any?) -> [AssistantFriendRecord] {
    guard let rows = raw as? [[String: Any]] else {
      return []
    }
    var seen = Set<String>()
    return rows.compactMap { row in
      guard let id = row["id"] as? String, !id.isEmpty, seen.insert(id).inserted else {
        return nil
      }
      let name = row["name"] as? String ?? id
      let username = row["username"] as? String ?? ""
      let avatarUrl = row["avatarUrl"] as? String ?? ""
      return AssistantFriendRecord(
        id: id,
        name: name,
        username: username,
        avatarUrl: avatarUrl
      )
    }
  }

  private static func parseGuilds(_ raw: Any?) -> [AssistantGuildRecord] {
    guard let rows = raw as? [[String: Any]] else {
      return []
    }
    var seen = Set<String>()
    return rows.compactMap { row in
      guard let id = row["id"] as? String, !id.isEmpty, seen.insert(id).inserted else {
        return nil
      }
      let name = row["name"] as? String ?? id
      return AssistantGuildRecord(id: id, name: name)
    }
  }

  private static func parseChannels(_ raw: Any?) -> [AssistantChannelRecord] {
    guard let rows = raw as? [[String: Any]] else {
      return []
    }
    var seen = Set<String>()
    return rows.compactMap { row in
      guard let id = row["id"] as? String, !id.isEmpty, seen.insert(id).inserted else {
        return nil
      }
      let kind = row["kind"] as? String ?? ""
      guard kind == "voice" else {
        return nil
      }
      let name = row["name"] as? String ?? id
      return AssistantChannelRecord(
        id: id,
        name: name,
        kind: kind,
        guildId: row["guildId"] as? String,
        guildName: row["guildName"] as? String
      )
    }
  }
}
