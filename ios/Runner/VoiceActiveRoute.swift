import AVFAudio
import Flutter

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

func voiceActiveRouteName(outputPorts: [AVAudioSession.Port]) -> NativeVoiceRoute? {
  let outputs = Set(outputPorts)
  if outputs.contains(where: { voiceHeadsetOutputPortTypes.contains($0) }) {
    return .headset
  }
  if outputs.contains(.builtInReceiver) {
    return .earpiece
  }
  if outputs.contains(.builtInSpeaker) {
    return .speaker
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

func voiceActiveRoute(from route: AVAudioSessionRouteDescription) -> NativeVoiceActiveRoute? {
  guard let active = voiceActiveRouteName(outputPorts: route.outputs.map(\.portType)) else {
    return nil
  }
  return NativeVoiceActiveRoute(
    route: active,
    name: voiceActiveRouteDeviceName(
      outputs: route.outputs.map { (port: $0.portType, name: $0.portName) }
    )
  )
}

private final class VoiceActiveRouteStream: VoiceActiveRouteChangesStreamHandler {
  private var observers: [NSObjectProtocol] = []
  private var pendingRouteEvent: DispatchWorkItem?

  override func onListen(
    withArguments arguments: Any?,
    sink: PigeonEventSink<NativeVoiceActiveRoute>
  ) {
    stopObserving()
    let center = NotificationCenter.default
    observers = [
      center.addObserver(
        forName: AVAudioSession.routeChangeNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.scheduleRouteEvent(to: sink)
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
        self?.scheduleRouteEvent(to: sink)
      },
      center.addObserver(
        forName: AVAudioSession.mediaServicesWereResetNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.scheduleRouteEvent(to: sink)
      },
    ]
  }

  override func onCancel(withArguments arguments: Any?) {
    stopObserving()
  }

  private func stopObserving() {
    pendingRouteEvent?.cancel()
    pendingRouteEvent = nil
    for observer in observers {
      NotificationCenter.default.removeObserver(observer)
    }
    observers = []
  }

  private func scheduleRouteEvent(to sink: PigeonEventSink<NativeVoiceActiveRoute>) {
    pendingRouteEvent?.cancel()
    let work = DispatchWorkItem {
      guard let route = voiceActiveRoute(
        from: AVAudioSession.sharedInstance().currentRoute
      ) else {
        return
      }
      sink.success(route)
    }
    pendingRouteEvent = work
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: work)
  }
}

final class VoiceActiveRouteBridge: VoiceActiveRouteHostApi {
  static let shared = VoiceActiveRouteBridge()

  private var isRegistered = false
  private let routeStream = VoiceActiveRouteStream()

  func register(messenger: FlutterBinaryMessenger) {
    if isRegistered {
      return
    }
    isRegistered = true
    VoiceActiveRouteHostApiSetup.setUp(binaryMessenger: messenger, api: self)
    VoiceActiveRouteChangesStreamHandler.register(with: messenger, streamHandler: routeStream)
  }

  func activeRoute(completion: @escaping (Result<NativeVoiceActiveRoute?, Error>) -> Void) {
    completion(.success(voiceActiveRoute(from: AVAudioSession.sharedInstance().currentRoute)))
  }
}
