import AppIntents
import Foundation

struct AssistantFriendEntity: AppEntity {
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Friend")
  static var defaultQuery = AssistantFriendEntityQuery()

  var id: String
  var name: String
  var username: String
  var avatarUrl: String

  var displayRepresentation: DisplayRepresentation {
    let subtitle: LocalizedStringResource? =
      (username.isEmpty || username == name) ? nil : "\(username)"
    return DisplayRepresentation(
      title: "\(name)",
      subtitle: subtitle,
      image: friendDisplayImage()
    )
  }

  private func friendDisplayImage() -> DisplayRepresentation.Image? {
    if let data = AssistantAvatarCache.imageDataIfPresent(for: avatarUrl), !data.isEmpty {
      return DisplayRepresentation.Image(data: data)
    }
    let trimmed = avatarUrl.trimmingCharacters(in: .whitespacesAndNewlines)
    guard let url = URL(string: trimmed), !trimmed.isEmpty else {
      return nil
    }
    return DisplayRepresentation.Image(url: url)
  }
}

struct AssistantFriendEntityQuery: EntityStringQuery {
  func entities(for identifiers: [String]) async throws -> [AssistantFriendEntity] {
    let byId = Dictionary(
      AssistantEntityStore.shared.friends.map { ($0.id, $0) },
      uniquingKeysWith: { first, _ in first }
    )
    return identifiers.compactMap { id in
      let trimmed = id.trimmingCharacters(in: .whitespacesAndNewlines)
      guard !trimmed.isEmpty, let record = byId[trimmed] else {
        return nil
      }
      return Self.mapFriend(record)
    }
  }

  func suggestedEntities() async throws -> [AssistantFriendEntity] {
    AssistantEntityStore.shared.friends.map(Self.mapFriend)
  }

  func entities(matching string: String) async throws -> [AssistantFriendEntity] {
    AssistantFriendRecord.matching(string, in: AssistantEntityStore.shared.friends)
      .map(Self.mapFriend)
  }

  private static func mapFriend(_ record: AssistantFriendRecord) -> AssistantFriendEntity {
    AssistantFriendEntity(
      id: record.id,
      name: record.name,
      username: record.username,
      avatarUrl: record.avatarUrl
    )
  }
}

struct AssistantGuildEntity: AppEntity {
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Community")
  static var defaultQuery = AssistantGuildEntityQuery()

  var id: String
  var name: String

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(title: "\(name)")
  }
}

struct AssistantGuildEntityQuery: EntityStringQuery {
  func entities(for identifiers: [String]) async throws -> [AssistantGuildEntity] {
    let idSet = Set(identifiers)
    return AssistantEntityStore.shared.guilds
      .filter { idSet.contains($0.id) }
      .map { AssistantGuildEntity(id: $0.id, name: $0.name) }
  }

  func suggestedEntities() async throws -> [AssistantGuildEntity] {
    AssistantEntityStore.shared.guilds.map {
      AssistantGuildEntity(id: $0.id, name: $0.name)
    }
  }

  func entities(matching string: String) async throws -> [AssistantGuildEntity] {
    AssistantEntityStore.shared.guilds
      .filter { $0.name.localizedStandardContains(string) }
      .map { AssistantGuildEntity(id: $0.id, name: $0.name) }
  }
}

struct AssistantVoiceChannelEntity: AppEntity {
  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Voice Channel")
  static var defaultQuery = AssistantVoiceChannelEntityQuery()

  var id: String
  var name: String
  var guildId: String
  var guildName: String

  var displayRepresentation: DisplayRepresentation {
    DisplayRepresentation(
      title: "\(name)",
      subtitle: guildName.isEmpty ? nil : "\(guildName)"
    )
  }
}

struct AssistantVoiceChannelEntityQuery: EntityStringQuery {
  func entities(for identifiers: [String]) async throws -> [AssistantVoiceChannelEntity] {
    let idSet = Set(identifiers)
    return AssistantEntityStore.shared.channels
      .filter { $0.isVoice && idSet.contains($0.id) }
      .map(Self.mapChannel)
  }

  func suggestedEntities() async throws -> [AssistantVoiceChannelEntity] {
    voiceChannels().map(Self.mapChannel)
  }

  func entities(matching string: String) async throws -> [AssistantVoiceChannelEntity] {
    voiceChannels()
      .filter { $0.matches(string) }
      .map(Self.mapChannel)
  }

  private func voiceChannels() -> [AssistantChannelRecord] {
    AssistantEntityStore.shared.channels.filter(\.isVoice)
  }

  private static func mapChannel(_ record: AssistantChannelRecord) -> AssistantVoiceChannelEntity {
    AssistantVoiceChannelEntity(
      id: record.id,
      name: record.name,
      guildId: record.guildId ?? "",
      guildName: record.guildName ?? ""
    )
  }
}
