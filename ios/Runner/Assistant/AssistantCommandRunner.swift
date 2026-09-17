import AppIntents
import Foundation

enum AssistantCommandRunner {
  static func speak(_ payload: [String: Any]) async -> IntentDialog {
    await run(payload, openApp: false)
  }

  static func open(_ payload: [String: Any]) async {
    _ = await run(payload, openApp: true)
  }

  static func run(
    _ payload: [String: Any],
    openApp: Bool
  ) async -> IntentDialog {
    let result = await AssistantBridge.shared.perform(payload, openApp: openApp)
    if isVoiceSession(payload), result.status == "notReady" || result.status == "needsLogin" {
      return IntentDialog(stringLiteral: "You're not in a call.")
    }
    return IntentDialog(stringLiteral: result.spoken)
  }

  private static func isVoiceSession(_ payload: [String: Any]) -> Bool {
    switch payload["type"] as? String {
    case "voiceSetMute", "voiceLeave":
      return true
    default:
      return false
    }
  }
}

extension AppIntent {
  func confirmAssistantAction(_ spoken: String) async throws {
    let dialog = IntentDialog(stringLiteral: spoken)
    do {
      if #available(iOS 18.0, *) {
        try await requestConfirmation(dialog: dialog)
      } else {
        try await requestConfirmation(result: .result(dialog: dialog))
      }
    } catch is CancellationError {
      throw CancellationError()
    } catch let error as NSError where error.code == NSUserCancelledError {
      throw error
    } catch {
    }
  }
}
