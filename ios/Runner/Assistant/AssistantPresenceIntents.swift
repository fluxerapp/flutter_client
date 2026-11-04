import AppIntents
import Foundation

enum PresenceStatusOption: String, AppEnum {
  case online
  case idle
  case dnd
  case invisible

  static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Status")

  static var caseDisplayRepresentations: [PresenceStatusOption: DisplayRepresentation] = [
    .online: "Online",
    .idle: "Idle",
    .dnd: "Do Not Disturb",
    .invisible: "Invisible",
  ]
}

struct SetPresenceStatusIntent: AppIntent {
  static var title: LocalizedStringResource = "Set Status"
  static var description = IntentDescription("Set your Fluxer status.")
  static var openAppWhenRun = true

  @Parameter(title: "Status", requestValueDialog: IntentDialog("Which status?"))
  var status: PresenceStatusOption

  static var parameterSummary: some ParameterSummary {
    Summary("Set status to \(\.$status)")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    .result(dialog: await AssistantCommandRunner.run([
      "type": "presenceSetStatus",
      "status": status.rawValue,
    ], openApp: true))
  }
}

struct SetCustomStatusIntent: AppIntent {
  static var title: LocalizedStringResource = "Set Custom Status"
  static var description = IntentDescription(
    "Set your Fluxer custom status. Leave it blank to clear."
  )
  static var openAppWhenRun = true

  @Parameter(title: "Status", requestValueDialog: IntentDialog("What should your status say?"))
  var text: String?

  static var parameterSummary: some ParameterSummary {
    Summary("Set custom status to \(\.$text)")
  }

  func perform() async throws -> some IntentResult & ProvidesDialog {
    let value = text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    return .result(dialog: await AssistantCommandRunner.run([
      "type": "presenceSetCustomStatus",
      "text": value,
    ], openApp: true))
  }
}
