import AppIntents
import Foundation

struct SetOnlineIntent: AppIntent {
  static var title: LocalizedStringResource = "Set Online"
  static var description = IntentDescription("Set your Fluxer status to Online.")
  static var openAppWhenRun = false

  static var parameterSummary: some ParameterSummary {
    Summary("Set Online")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    .result(dialog: await AssistantCommandRunner.speak([
      "type": "presenceSetStatus",
      "status": "online",
    ]))
  }
}

struct SetDoNotDisturbIntent: AppIntent {
  static var title: LocalizedStringResource = "Set Do Not Disturb"
  static var description = IntentDescription("Set your Fluxer status to Do Not Disturb.")
  static var openAppWhenRun = false

  static var parameterSummary: some ParameterSummary {
    Summary("Set Do Not Disturb")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    .result(dialog: await AssistantCommandRunner.speak([
      "type": "presenceSetStatus",
      "status": "dnd",
    ]))
  }
}

struct SetCustomStatusIntent: AppIntent {
  static var title: LocalizedStringResource = "Set Custom Status"
  static var description = IntentDescription(
    "Set your Fluxer custom status. Leave it blank to clear."
  )
  static var openAppWhenRun = false

  @Parameter(title: "Status", requestValueDialog: IntentDialog("What should your status say?"))
  var text: String?

  static var parameterSummary: some ParameterSummary {
    Summary("Set custom status to \(\.$text)")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    let value = text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    .result(dialog: await AssistantCommandRunner.speak([
      "type": "presenceSetCustomStatus",
      "text": value,
    ]))
  }
}
