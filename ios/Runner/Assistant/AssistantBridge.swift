import AppIntents
import Flutter
import Foundation

final class AssistantBridge: NSObject {
  static let shared = AssistantBridge()

  private static let methodChannelName = "fluxer_app/assistant"
  static let readyWaitNanoseconds: UInt64 = 20_000_000_000
  private static let pollNanoseconds: UInt64 = 50_000_000
  private static let fallbackSpoken = "Fluxer could not complete that."

  private var methodChannel: FlutterMethodChannel?
  private var isRegisteredWithEngine = false

  private override init() {
    super.init()
  }

  func register(engineBridge: FlutterImplicitEngineBridge) {
    if isRegisteredWithEngine {
      return
    }
    isRegisteredWithEngine = true
    let messenger = engineBridge.applicationRegistrar.messenger()
    let channel = FlutterMethodChannel(
      name: Self.methodChannelName,
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { call, result in
      Self.shared.handleMethodCall(call, result: result)
    }
    methodChannel = channel
  }

  var hasDartHandler: Bool {
    methodChannel != nil
  }

  func perform(
    _ payload: [String: Any],
    openApp: Bool,
    waitNanoseconds: UInt64 = AssistantBridge.readyWaitNanoseconds
  ) async -> (status: String, spoken: String) {
    if methodChannel == nil {
      if !openApp {
        return (status: "notReady", spoken: Self.fallbackSpoken)
      }
      let ready = await waitUntilRegistered(waitNanoseconds: waitNanoseconds)
      if !ready {
        return (status: "notReady", spoken: Self.fallbackSpoken)
      }
    }
    guard let channel = methodChannel else {
      return (status: "notReady", spoken: Self.fallbackSpoken)
    }
    return await invokeRunCommand(
      channel,
      payload: payload,
      waitNanoseconds: waitNanoseconds
    )
  }

  private func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "updateEntities":
      AssistantEntityStore.shared.replace(call.arguments)
      AssistantAppShortcuts.updateAppShortcutParameters()
      result(nil)
    case "takePending":
      result(AssistantPendingCommand.takeIfAccount(call.arguments as? String))
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func waitUntilRegistered(waitNanoseconds: UInt64) async -> Bool {
    let deadline = DispatchTime.now().uptimeNanoseconds + waitNanoseconds
    while methodChannel == nil {
      if DispatchTime.now().uptimeNanoseconds >= deadline {
        return false
      }
      try? await Task.sleep(nanoseconds: Self.pollNanoseconds)
    }
    return true
  }

  private func invokeRunCommand(
    _ channel: FlutterMethodChannel,
    payload: [String: Any],
    waitNanoseconds: UInt64
  ) async -> (status: String, spoken: String) {
    let deadline = DispatchTime.now().uptimeNanoseconds + waitNanoseconds
    while true {
      let mapped = await invokeOnce(channel, payload: payload)
      switch mapped {
      case let .payload(status, spoken):
        return (status: status, spoken: spoken)
      case let .failed(spoken):
        return (status: "failed", spoken: spoken)
      case .notReady:
        if DispatchTime.now().uptimeNanoseconds >= deadline {
          return (status: "notReady", spoken: Self.fallbackSpoken)
        }
        try? await Task.sleep(nanoseconds: Self.pollNanoseconds)
      }
    }
  }

  private func invokeOnce(
    _ channel: FlutterMethodChannel,
    payload: [String: Any]
  ) async -> InvokeOutcome {
    await withCheckedContinuation { continuation in
      DispatchQueue.main.async {
        channel.invokeMethod("runCommand", arguments: payload) { response in
          continuation.resume(returning: Self.parseResult(response))
        }
      }
    }
  }

  private enum InvokeOutcome {
    case payload(status: String, spoken: String)
    case notReady
    case failed(spoken: String)
  }

  private static func parseResult(_ response: Any?) -> InvokeOutcome {
    if let error = response as? FlutterError {
      let code = error.code.lowercased()
      let message = error.message ?? ""
      if code.contains("unimplemented") ||
        message.localizedCaseInsensitiveContains("no implementation found")
      {
        return .notReady
      }
      return .failed(spoken: error.message ?? fallbackSpoken)
    }
    guard let map = response as? [String: Any] else {
      return .notReady
    }
    let status = map["status"] as? String ?? "failed"
    let spoken = map["spoken"] as? String
    if let spoken, !spoken.isEmpty {
      return .payload(status: status, spoken: spoken)
    }
    return .payload(status: status, spoken: fallbackSpoken)
  }
}
