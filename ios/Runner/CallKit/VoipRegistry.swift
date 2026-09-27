import Flutter
import Foundation
import PushKit
import flutter_callkit_incoming

final class VoipRegistry: NSObject {
  static let shared = VoipRegistry()

  private let reporter = IncomingCallReporter()
  private var registry: PKPushRegistry?
  private var pushDelegate: NSObject?
  private var pendingTokenHex: String?

  func start() {
    if registry != nil {
      return
    }
    reporter.start()
    let delegate: PKPushRegistryDelegate
    if #available(iOS 26.4, *) {
      let modern = ModernVoipPushDelegate(owner: self)
      pushDelegate = modern
      delegate = modern
    } else {
      let classic = ClassicVoipPushDelegate(owner: self)
      pushDelegate = classic
      delegate = classic
    }
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
    reporter.handle(payload: payload, completion: completion)
  }
}

private final class ClassicVoipPushDelegate: NSObject, PKPushRegistryDelegate {
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
    NSLog("[CallKit] voip payload")
    owner.receive(payload: payload, completion: completion)
  }
}

@available(iOS 26.4, *)
private final class ModernVoipPushDelegate: NSObject, PKPushRegistryDelegate {
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
    didReceiveIncomingVoIPPushWith payload: PKPushPayload,
    metadata: PKVoIPPushMetadata,
    withCompletionHandler completion: @escaping () -> Void
  ) {
    NSLog("[CallKit] voip payload")
    owner.receive(payload: payload, completion: completion)
  }
}
