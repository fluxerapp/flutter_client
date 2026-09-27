import AVFAudio
import Flutter
import UIKit
import WebRTC

final class VoiceSpeakerRouteBridge {
  static let shared = VoiceSpeakerRouteBridge()

  private var isRegistered = false

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
        let session = RTCAudioSession.sharedInstance()
        session.lockForConfiguration()
        defer { session.unlockForConfiguration() }
        try? session.overrideOutputAudioPort(route == "speaker" ? .speaker : .none)
        result(nil)
      case "availableRoutes":
        result(Self.availableRouteNames())
      default:
        result(FlutterMethodNotImplemented)
      }
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
