import AppIntents
import Foundation

struct SendDirectMessageIntent: AppIntent {
  static var title: LocalizedStringResource = "Send Message"
  static var description = IntentDescription("Send a Fluxer direct message.")
  static var openAppWhenRun = true

  @Parameter(title: "Friend", requestValueDialog: IntentDialog("Who should receive the message?"))
  var friend: AssistantFriendEntity

  @Parameter(title: "Message", requestValueDialog: IntentDialog("What should the message say?"))
  var message: String

  static var parameterSummary: some ParameterSummary {
    Summary("Send \(\.$message) to \(\.$friend)")
  }

  @MainActor
  func perform() async throws -> some IntentResult {
    let text = message.trimmingCharacters(in: .whitespacesAndNewlines)
    if text.isEmpty {
      throw $message.needsValueError(IntentDialog("What should the message say?"))
    }
    let name = friend.name.trimmingCharacters(in: .whitespacesAndNewlines)
    let prompt = name.isEmpty
      ? "Send \"\(text)\"?"
      : "Send \"\(text)\" to \(name)?"
    try await confirmAssistantAction(prompt)
    AssistantPendingCommand.queueSend(friendId: friend.id, text: text)
    return .result()
  }
}
