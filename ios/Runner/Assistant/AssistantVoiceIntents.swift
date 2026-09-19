import AppIntents
import Foundation

struct MuteVoiceIntent: AppIntent {
  static var title: LocalizedStringResource = "Mute Microphone"
  static var description = IntentDescription("Mute in the current Fluxer call.")
  static var openAppWhenRun = false

  static var parameterSummary: some ParameterSummary {
    Summary("Mute microphone")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    .result(dialog: await AssistantCommandRunner.speak(["type": "voiceSetMute", "muted": true]))
  }
}

struct UnmuteVoiceIntent: AppIntent {
  static var title: LocalizedStringResource = "Unmute Microphone"
  static var description = IntentDescription("Unmute in the current Fluxer call.")
  static var openAppWhenRun = false

  static var parameterSummary: some ParameterSummary {
    Summary("Unmute microphone")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    .result(dialog: await AssistantCommandRunner.speak(["type": "voiceSetMute", "muted": false]))
  }
}

struct LeaveVoiceIntent: AppIntent {
  static var title: LocalizedStringResource = "Leave Voice"
  static var description = IntentDescription("Leave the current Fluxer voice channel.")
  static var openAppWhenRun = false

  static var parameterSummary: some ParameterSummary {
    Summary("Leave voice")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    .result(dialog: await AssistantCommandRunner.speak(["type": "voiceLeave"]))
  }
}

struct JoinVoiceIntent: AppIntent {
  static var title: LocalizedStringResource = "Join Voice Channel"
  static var description = IntentDescription(
    "Join a Fluxer voice channel after naming the community and channel."
  )
  static var openAppWhenRun = true

  @Parameter(title: "Community", requestValueDialog: IntentDialog("Which community?"))
  var guild: AssistantGuildEntity?

  @Parameter(title: "Channel", requestValueDialog: IntentDialog("Which voice channel?"))
  var channel: AssistantVoiceChannelEntity

  static var parameterSummary: some ParameterSummary {
    Summary("Join \(\.$channel) in \(\.$guild)")
  }

  func perform() async throws -> some IntentResult {
    let guildId = guild?.id ?? channel.guildId
    if guildId.isEmpty {
      throw $guild.needsValueError(IntentDialog("Which community?"))
    }
    if let guild, !channel.guildId.isEmpty, channel.guildId != guild.id {
      throw $channel.needsValueError(
        IntentDialog("\(channel.name) is not in \(guild.name).")
      )
    }
    let communityName = guild?.name ?? channel.guildName
    let prompt = communityName.isEmpty
      ? "Join \(channel.name)?"
      : "Join \(channel.name) in \(communityName)?"
    try await confirmAssistantAction(prompt)
    await AssistantCommandRunner.open([
      "type": "voiceJoin",
      "channelId": channel.id,
      "guildId": guildId,
    ])
    return .result()
  }
}

struct StartDmCallIntent: AppIntent {
  static var title: LocalizedStringResource = "Call Friend"
  static var description = IntentDescription("Start a Fluxer voice call with a friend.")
  static var openAppWhenRun = true

  @Parameter(title: "Friend", requestValueDialog: IntentDialog("Who should Fluxer call?"))
  var friend: AssistantFriendEntity

  static var parameterSummary: some ParameterSummary {
    Summary("Call \(\.$friend)")
  }

  @MainActor
  func perform() async throws -> some IntentResult {
    let name = friend.name.trimmingCharacters(in: .whitespacesAndNewlines)
    try await confirmAssistantAction(
      name.isEmpty ? "Start this call?" : "Call \(name) on Fluxer?"
    )
    AssistantPendingCommand.queueCall(friendId: friend.id)
    return .result()
  }
}
