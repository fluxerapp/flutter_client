import Flutter
import GameController
import UIKit

enum PhysicalKeyboard {
  static let channelName = "fluxer_app/physical_keyboard"

  static var isConnected: Bool {
    GCKeyboard.coalesced != nil
  }
}

final class PhysicalKeyboardBridge: NSObject, FlutterStreamHandler {
  static let shared = PhysicalKeyboardBridge()

  private var eventSink: FlutterEventSink?
  private var observers: [NSObjectProtocol] = []
  private var isRegisteredWithEngine = false

  func register(engineBridge: FlutterImplicitEngineBridge) {
    if isRegisteredWithEngine {
      return
    }
    isRegisteredWithEngine = true
    let channel = FlutterEventChannel(
      name: PhysicalKeyboard.channelName,
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    channel.setStreamHandler(self)
  }

  func onListen(
    withArguments arguments: Any?,
    eventSink events: @escaping FlutterEventSink
  ) -> FlutterError? {
    stopListening()
    eventSink = events
    let center = NotificationCenter.default
    observers = [
      center.addObserver(
        forName: .GCKeyboardDidConnect,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.emit()
      },
      center.addObserver(
        forName: .GCKeyboardDidDisconnect,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.emit()
      },
      center.addObserver(
        forName: UIApplication.didBecomeActiveNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.emit()
      },
    ]
    emit()
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    stopListening()
    return nil
  }

  private func emit() {
    let send = { [weak self] in
      guard let self else {
        return
      }
      self.eventSink?(PhysicalKeyboard.isConnected)
    }
    if Thread.isMainThread {
      send()
      return
    }
    DispatchQueue.main.async(execute: send)
  }

  private func stopListening() {
    for observer in observers {
      NotificationCenter.default.removeObserver(observer)
    }
    observers = []
    eventSink = nil
  }
}
