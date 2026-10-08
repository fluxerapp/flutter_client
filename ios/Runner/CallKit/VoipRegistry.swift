import Flutter
import Foundation
import PushKit
import flutter_callkit_incoming

final class VoipRegistry: NSObject {
  static let shared = VoipRegistry()

  private let reporter = IncomingCallReporter()
  private var registry: PKPushRegistry?
  private var pushDelegate: VoipPushDelegate?
  private var pendingTokenHex: String?
  private var parkedCompletions: [ObjectIdentifier: [() -> Void]] = [:]

  func start() {
    if registry != nil {
      return
    }
    reporter.start()
    let delegate = VoipPushDelegate(owner: self)
    pushDelegate = delegate
    let registry = PKPushRegistry(queue: reporter.queue)
    registry.delegate = delegate
    registry.desiredPushTypes = [.voIP]
    self.registry = registry
  }

  func register(messenger: FlutterBinaryMessenger) {
    reporter.register(messenger: messenger)
    applyPendingVoipToken()
  }

  func applyPendingVoipToken() {
    guard let hex = pendingTokenHex, !hex.isEmpty else {
      return
    }
    SwiftFlutterCallkitIncomingPlugin.sharedInstance?.setDevicePushTokenVoIP(hex)
  }

  fileprivate func storeVoipToken(_ token: Foundation.Data) {
    let hex = token.map { String(format: "%02x", $0) }.joined()
    pendingTokenHex = hex
    UserDefaults.standard.set(hex, forKey: "DevicePushTokenVoIP")
    NSLog("[CallKit] voip token ready")
    DispatchQueue.main.async { [weak self] in
      self?.applyPendingVoipToken()
    }
  }

  fileprivate func clearVoipToken() {
    pendingTokenHex = nil
    UserDefaults.standard.removeObject(forKey: "DevicePushTokenVoIP")
    DispatchQueue.main.async {
      SwiftFlutterCallkitIncomingPlugin.sharedInstance?.setDevicePushTokenVoIP("")
    }
  }

  fileprivate func receive(payload: PKPushPayload, completion: @escaping () -> Void) {
    let payloadId = ObjectIdentifier(payload)
    if parkedCompletions[payloadId] != nil {
      parkedCompletions[payloadId]?.append(completion)
      return
    }
    parkedCompletions[payloadId] = []
    NSLog("[CallKit] voip payload")
    reporter.handle(payload: payload) { [weak self] in
      guard let self else {
        completion()
        return
      }
      self.reporter.queue.async {
        let parked = self.parkedCompletions.removeValue(forKey: payloadId) ?? []
        completion()
        for parkedCompletion in parked {
          parkedCompletion()
        }
      }
    }
  }
}

private final class VoipPushDelegate: NSObject, PKPushRegistryDelegate {
  private unowned let owner: VoipRegistry

  init(owner: VoipRegistry) {
    self.owner = owner
  }

  func pushRegistry(
    _ registry: PKPushRegistry,
    didUpdate pushCredentials: PKPushCredentials,
    for type: PKPushType
  ) {
    guard type == .voIP else {
      return
    }
    owner.storeVoipToken(pushCredentials.token)
  }

  func pushRegistry(_ registry: PKPushRegistry, didInvalidatePushTokenFor type: PKPushType) {
    guard type == .voIP else {
      return
    }
    owner.clearVoipToken()
  }

  func pushRegistry(
    _ registry: PKPushRegistry,
    didReceiveIncomingPushWith payload: PKPushPayload,
    for type: PKPushType,
    completion: @escaping () -> Void
  ) {
    guard type == .voIP else {
      completion()
      return
    }
    owner.receive(payload: payload, completion: completion)
  }

  @available(iOS 26.4, *)
  func pushRegistry(
    _ registry: PKPushRegistry,
    didReceiveIncomingVoIPPushWith payload: PKPushPayload,
    metadata: PKVoIPPushMetadata,
    withCompletionHandler completion: @escaping () -> Void
  ) {
    if !metadata.mustReport {
      NSLog("[CallKit] voip push mustReport=false")
    }
    owner.receive(payload: payload, completion: completion)
  }
}
