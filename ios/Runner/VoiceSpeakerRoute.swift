import AVFAudio
import AVKit
import Flutter
import UIKit
import WebRTC

enum VoiceOutputPortPlan: Equatable {
  case speaker
  case earpiece
  case headset(AVAudioSession.Port)
  case headsetUnavailable
}

let voiceCallInputPortPriority: [AVAudioSession.Port] = [
  .bluetoothHFP,
  .headsetMic,
  .usbAudio,
]

func voiceOutputPortPlan(
  route: String,
  availableInputPorts: [AVAudioSession.Port]
) -> VoiceOutputPortPlan {
  switch route {
  case "earpiece":
    return .earpiece
  case "headset":
    for port in voiceCallInputPortPriority {
      if availableInputPorts.contains(port) {
        return .headset(port)
      }
    }
    return .headsetUnavailable
  default:
    return .speaker
  }
}

private let voiceHeadsetOutputPortTypes: Set<AVAudioSession.Port> = [
  .bluetoothHFP,
  .bluetoothA2DP,
  .bluetoothLE,
  .headphones,
  .headsetMic,
  .usbAudio,
  .airPlay,
  .carAudio,
]

func voiceActiveRouteName(outputPorts: [AVAudioSession.Port]) -> String {
  let outputs = Set(outputPorts)
  let headsetPorts = voiceHeadsetOutputPortTypes
  if outputs.contains(where: { headsetPorts.contains($0) }) {
    return "headset"
  }
  if outputs.contains(.builtInReceiver) {
    return "earpiece"
  }
  if outputs.contains(.builtInSpeaker) {
    return "speaker"
  }
  return "speaker"
}

func voiceActiveRouteName(from route: AVAudioSessionRouteDescription) -> String {
  voiceActiveRouteName(outputPorts: route.outputs.map(\.portType))
}

private final class VoiceSpeakerRouteEventStreamHandler: NSObject, FlutterStreamHandler {
  private var routeObserver: NSObjectProtocol?
  private var pendingRouteEvent: DispatchWorkItem?

  func onListen(
    withArguments arguments: Any?,
    eventSink events: @escaping FlutterEventSink
  ) -> FlutterError? {
    routeObserver = NotificationCenter.default.addObserver(
      forName: AVAudioSession.routeChangeNotification,
      object: nil,
      queue: .main
    ) { [weak self] _ in
      self?.scheduleRouteEvent(to: events)
    }
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    pendingRouteEvent?.cancel()
    pendingRouteEvent = nil
    if let routeObserver {
      NotificationCenter.default.removeObserver(routeObserver)
    }
    routeObserver = nil
    return nil
  }

  private func scheduleRouteEvent(to events: @escaping FlutterEventSink) {
    pendingRouteEvent?.cancel()
    let work = DispatchWorkItem {
      let name = voiceActiveRouteName(
        from: AVAudioSession.sharedInstance().currentRoute
      )
      events(name)
    }
    pendingRouteEvent = work
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: work)
  }
}

final class VoiceSpeakerRouteBridge {
  static let shared = VoiceSpeakerRouteBridge()

  private var isRegistered = false
  private let routeEventHandler = VoiceSpeakerRouteEventStreamHandler()

  func register(messenger: FlutterBinaryMessenger) {
    if isRegistered {
      return
    }
    isRegistered = true
    let channel = FlutterMethodChannel(
      name: "fluxer_app/voice_speaker_route",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "setRoute":
        let route = (call.arguments as? [String: Any])?["route"] as? String
        Self.apply(route: route ?? "speaker")
        result(nil)
      case "availableRoutes":
        result(Self.availableRouteNames())
      case "presentRoutePicker":
        let anchor = Self.anchorRect(from: call.arguments)
        Self.presentRoutePicker(anchor: anchor) { selectedRoute in
          result(selectedRoute)
        }
      case "activeRoute":
        result(Self.readActiveRouteName())
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    FlutterEventChannel(
      name: "fluxer_app/voice_speaker_route_events",
      binaryMessenger: messenger
    ).setStreamHandler(routeEventHandler)
  }

  private static func readActiveRouteName() -> String {
    voiceActiveRouteName(from: AVAudioSession.sharedInstance().currentRoute)
  }

  private static func presentRoutePicker(
    anchor: CGRect?,
    completion: @escaping (String?) -> Void
  ) {
    DispatchQueue.main.async {
      prepareAudioSessionForRoutePicker()
      #if targetEnvironment(simulator)
      presentRoutePickerActionSheet(anchor: anchor, completion: completion)
      return
      #endif
      if !presentSystemRoutePicker(anchor: anchor) {
        presentRoutePickerActionSheet(anchor: anchor, completion: completion)
        return
      }
      completion(nil)
    }
  }

  private static func anchorRect(from arguments: Any?) -> CGRect? {
    guard let arguments = arguments as? [String: Any],
          let anchor = arguments["anchor"] as? [String: Any],
          let x = anchor["x"] as? Double,
          let y = anchor["y"] as? Double,
          let width = anchor["width"] as? Double,
          let height = anchor["height"] as? Double,
          width > 0,
          height > 0 else {
      return nil
    }
    return CGRect(x: x, y: y, width: width, height: height)
  }

  private static func sourceRect(
    for anchor: CGRect,
    in sourceView: UIView
  ) -> CGRect {
    guard let window = sourceView.window else {
      return anchor
    }
    return sourceView.convert(anchor, from: window)
  }

  private static func configurePopover(
    _ popover: UIPopoverPresentationController,
    anchor: CGRect?,
    sourceView: UIView
  ) {
    popover.sourceView = sourceView
    if let anchor {
      popover.sourceRect = sourceRect(for: anchor, in: sourceView)
      popover.permittedArrowDirections = [.up, .down]
    } else {
      let bounds = sourceView.bounds
      popover.sourceRect = CGRect(
        x: bounds.midX,
        y: bounds.maxY - 1,
        width: 2,
        height: 2
      )
      popover.permittedArrowDirections = [.up]
    }
  }

  private static func prepareAudioSessionForRoutePicker() {
    let session = AVAudioSession.sharedInstance()
    try? session.setCategory(
      .playAndRecord,
      mode: .voiceChat,
      options: [.allowBluetoothHFP, .allowBluetoothA2DP, .defaultToSpeaker]
    )
    try? session.setActive(true)
  }

  @discardableResult
  private static func presentSystemRoutePicker(anchor: CGRect?) -> Bool {
    guard let hostView = routePickerHostView() else {
      return false
    }
    let pickerFrame: CGRect
    if let anchor, let window = hostView.window {
      pickerFrame = hostView.convert(anchor, from: window)
    } else if let anchor {
      pickerFrame = anchor
    } else {
      pickerFrame = CGRect(x: 0, y: 0, width: 44, height: 44)
    }
    let routePicker = AVRoutePickerView(frame: pickerFrame)
    routePicker.prioritizesVideoDevices = false
    routePicker.alpha = 0.01
    routePicker.isUserInteractionEnabled = true
    hostView.addSubview(routePicker)
    routePicker.layoutIfNeeded()

    let triggered = triggerRoutePickerButton(in: routePicker)
    if !triggered {
      routePicker.removeFromSuperview()
      return false
    }

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
      triggerRoutePickerButton(in: routePicker)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
      routePicker.removeFromSuperview()
    }
    return true
  }

  private static func triggerRoutePickerButton(in routePicker: AVRoutePickerView) -> Bool {
    guard let button = routePicker.findRoutePickerButton() else {
      return false
    }
    button.sendActions(for: .touchUpInside)
    return true
  }

  private static func presentRoutePickerActionSheet(
    anchor: CGRect?,
    completion: @escaping (String?) -> Void
  ) {
    guard let presenter = topViewController() else {
      completion(nil)
      return
    }
    let routes = availableRouteNames()
    let alert = UIAlertController(
      title: nil,
      message: nil,
      preferredStyle: .actionSheet
    )
    for route in routes {
      let title = routePickerActionTitle(for: route)
      alert.addAction(
        UIAlertAction(title: title, style: .default) { _ in
          apply(route: route)
          completion(route)
        }
      )
    }
    alert.addAction(
      UIAlertAction(title: "Cancel", style: .cancel) { _ in
        completion(nil)
      }
    )
    if let popover = alert.popoverPresentationController,
       let sourceView = presenter.viewIfLoaded {
      configurePopover(popover, anchor: anchor, sourceView: sourceView)
    }
    presenter.present(alert, animated: true)
  }

  private static func routePickerActionTitle(for route: String) -> String {
    switch route {
    case "earpiece":
      return "Earpiece"
    case "headset":
      return "Headphones"
    default:
      return "Speaker"
    }
  }

  private static func routePickerHostView() -> UIView? {
    if let window = keyWindow() {
      return window.rootViewController?.view ?? window
    }
    for scene in UIApplication.shared.connectedScenes {
      guard let windowScene = scene as? UIWindowScene else {
        continue
      }
      if windowScene.activationState != .foregroundActive {
        continue
      }
      if let key = windowScene.windows.first(where: \.isKeyWindow) {
        return key.rootViewController?.view ?? key
      }
      if let first = windowScene.windows.first {
        return first.rootViewController?.view ?? first
      }
    }
    return nil
  }

  private static func keyWindow() -> UIWindow? {
    UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap(\.windows)
      .first(where: \.isKeyWindow)
  }

  private static func topViewController() -> UIViewController? {
    var controller = keyWindow()?.rootViewController
    while let presented = controller?.presentedViewController {
      controller = presented
    }
    return controller
  }

  private static func apply(route: String) {
    let session = RTCAudioSession.sharedInstance()
    session.lockForConfiguration()
    defer { session.unlockForConfiguration() }
    let av = AVAudioSession.sharedInstance()
    let inputs = av.availableInputs ?? []
    let plan = voiceOutputPortPlan(
      route: route,
      availableInputPorts: inputs.map(\.portType)
    )
    switch plan {
    case .speaker:
      try? av.setPreferredInput(nil)
      try? session.overrideOutputAudioPort(.speaker)
    case .earpiece:
      try? session.overrideOutputAudioPort(.none)
      let builtIn = inputs.first { $0.portType == .builtInMic }
      try? av.setPreferredInput(builtIn)
    case .headset(let port):
      try? session.overrideOutputAudioPort(.none)
      let match = inputs.first { $0.portType == port }
      try? av.setPreferredInput(match)
    case .headsetUnavailable:
      try? session.overrideOutputAudioPort(.none)
      try? av.setPreferredInput(nil)
    }
  }

  private static func availableRouteNames() -> [String] {
    var names = ["speaker"]
    if UIDevice.current.userInterfaceIdiom == .phone {
      names.append("earpiece")
    }
    if hasHeadset() {
      names.append("headset")
    }
    return names
  }

  private static func hasHeadset() -> Bool {
    let session = AVAudioSession.sharedInstance()
    let outputs = session.currentRoute.outputs.map(\.portType)
    let inputs = (session.availableInputs ?? []).map(\.portType)
    return (outputs + inputs).contains { port in
      switch port {
      case .bluetoothHFP, .bluetoothA2DP, .bluetoothLE, .headphones, .headsetMic, .usbAudio:
        return true
      default:
        return false
      }
    }
  }
}

private extension UIView {
  func findRoutePickerButton() -> UIButton? {
    if let button = self as? UIButton {
      return button
    }
    for subview in subviews {
      if let button = subview.findRoutePickerButton() {
        return button
      }
    }
    return nil
  }
}
