import AVFAudio
import Flutter
import UIKit
import WebRTC

enum VoiceOutputPortPlan: Equatable {
  case speaker
  case keepSystemRoute
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
  availableInputPorts: [AVAudioSession.Port],
  currentOutputPorts: [AVAudioSession.Port]
) -> VoiceOutputPortPlan {
  let headsetIsActive = currentOutputPorts.contains { voiceHeadsetOutputPortTypes.contains($0) }
  switch route {
  case "earpiece":
    return headsetIsActive ? .keepSystemRoute : .earpiece
  case "headset":
    for port in voiceCallInputPortPriority {
      if availableInputPorts.contains(port) {
        return .headset(port)
      }
    }
    return .headsetUnavailable
  default:
    return headsetIsActive ? .keepSystemRoute : .speaker
  }
}

private let voiceNamedOutputPortTypes: Set<AVAudioSession.Port> = [
  .airPlay,
  .carAudio,
  .HDMI,
  .lineOut,
  .usbAudio,
]

private let voiceHeadsetOutputPortTypes = voiceNamedOutputPortTypes.union([
  .bluetoothHFP,
  .bluetoothA2DP,
  .bluetoothLE,
  .headphones,
  .headsetMic,
])

func voiceActiveRouteName(outputPorts: [AVAudioSession.Port]) -> String? {
  let outputs = Set(outputPorts)
  if outputs.contains(where: { voiceHeadsetOutputPortTypes.contains($0) }) {
    return "headset"
  }
  if outputs.contains(.builtInReceiver) {
    return "earpiece"
  }
  if outputs.contains(.builtInSpeaker) {
    return "speaker"
  }
  return nil
}

func voiceActiveRouteDeviceName(outputs: [(port: AVAudioSession.Port, name: String)]) -> String? {
  for output in outputs where voiceNamedOutputPortTypes.contains(output.port) {
    let name = output.name.trimmingCharacters(in: .whitespacesAndNewlines)
    if !name.isEmpty {
      return name
    }
  }
  return nil
}

func voiceActiveRoute(from route: AVAudioSessionRouteDescription) -> [String: String]? {
  guard let name = voiceActiveRouteName(outputPorts: route.outputs.map(\.portType)) else {
    return nil
  }
  var result = ["route": name]
  result["name"] = voiceActiveRouteDeviceName(
    outputs: route.outputs.map { (port: $0.portType, name: $0.portName) }
  )
  return result
}

private final class VoiceSpeakerRouteEventStreamHandler: NSObject, FlutterStreamHandler {
  private var observers: [NSObjectProtocol] = []
  private var pendingRouteEvent: DispatchWorkItem?

  func onListen(
    withArguments arguments: Any?,
    eventSink events: @escaping FlutterEventSink
  ) -> FlutterError? {
    let center = NotificationCenter.default
    observers = [
      center.addObserver(
        forName: AVAudioSession.routeChangeNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.scheduleRouteEvent(to: events)
      },
      center.addObserver(
        forName: AVAudioSession.interruptionNotification,
        object: nil,
        queue: .main
      ) { [weak self] notification in
        let raw = notification.userInfo?[AVAudioSessionInterruptionTypeKey] as? UInt
        guard let raw, AVAudioSession.InterruptionType(rawValue: raw) == .ended else {
          return
        }
        self?.scheduleRouteEvent(to: events)
      },
      center.addObserver(
        forName: AVAudioSession.mediaServicesWereResetNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.scheduleRouteEvent(to: events)
      },
    ]
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    pendingRouteEvent?.cancel()
    pendingRouteEvent = nil
    for observer in observers {
      NotificationCenter.default.removeObserver(observer)
    }
    observers = []
    return nil
  }

  private func scheduleRouteEvent(to events: @escaping FlutterEventSink) {
    pendingRouteEvent?.cancel()
    let work = DispatchWorkItem {
      guard let route = voiceActiveRoute(
        from: AVAudioSession.sharedInstance().currentRoute
      ) else {
        return
      }
      events(route)
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
      case "activeRoute":
        result(Self.readActiveRoute())
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    FlutterEventChannel(
      name: "fluxer_app/voice_speaker_route_events",
      binaryMessenger: messenger
    ).setStreamHandler(routeEventHandler)
  }

  private static func readActiveRoute() -> [String: String]? {
    voiceActiveRoute(from: AVAudioSession.sharedInstance().currentRoute)
  }

  private static func apply(route: String) {
    let session = RTCAudioSession.sharedInstance()
    session.lockForConfiguration()
    defer { session.unlockForConfiguration() }
    let av = AVAudioSession.sharedInstance()
    let inputs = av.availableInputs ?? []
    let plan = voiceOutputPortPlan(
      route: route,
      availableInputPorts: inputs.map(\.portType),
      currentOutputPorts: av.currentRoute.outputs.map(\.portType)
    )
    switch plan {
    case .speaker:
      try? av.setPreferredInput(nil)
      try? session.overrideOutputAudioPort(.speaker)
    case .keepSystemRoute:
      return
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
