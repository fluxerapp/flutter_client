import AVFAudio
import AVKit
import Flutter
import UIKit

final class VoiceRoutePickerViewFactory: NSObject, FlutterPlatformViewFactory {
  private let messenger: FlutterBinaryMessenger

  init(messenger: FlutterBinaryMessenger) {
    self.messenger = messenger
    super.init()
  }

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    let params = args as? [String: Any]
    return VoiceRoutePickerPlatformView(
      frame: frame,
      channel: FlutterMethodChannel(
        name: "fluxer_app/voice_route_picker/\(viewId)",
        binaryMessenger: messenger
      ),
      inCall: params?["inCall"] as? Bool ?? false,
      label: params?["label"] as? String,
      value: params?["value"] as? String
    )
  }

  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    FlutterStandardMessageCodec.sharedInstance()
  }
}

enum VoiceRouteSheetSession {
  private static var owner: ObjectIdentifier?

  static func callStarted() {
    owner = nil
  }

  static func activate(for view: AnyObject) {
    let session = AVAudioSession.sharedInstance()
    try? session.setCategory(
      .playAndRecord,
      mode: .voiceChat,
      options: [.allowBluetoothHFP, .allowBluetoothA2DP, .defaultToSpeaker]
    )
    if (try? session.setActive(true)) != nil {
      owner = ObjectIdentifier(view)
    }
  }

  static func release(from id: ObjectIdentifier) {
    guard owner == id else {
      return
    }
    owner = nil
    try? AVAudioSession.sharedInstance().setActive(false, options: .notifyOthersOnDeactivation)
  }
}

final class VoiceRoutePickerPlatformView: NSObject, FlutterPlatformView, AVRoutePickerViewDelegate {
  private let picker: AVRoutePickerView
  private let inCall: Bool
  private let channel: FlutterMethodChannel

  init(
    frame: CGRect,
    channel: FlutterMethodChannel,
    inCall: Bool,
    label: String?,
    value: String?
  ) {
    picker = AVRoutePickerView(frame: frame)
    self.channel = channel
    self.inCall = inCall
    super.init()
    if inCall {
      VoiceRouteSheetSession.callStarted()
    }
    picker.prioritizesVideoDevices = false
    picker.tintColor = .clear
    picker.activeTintColor = .clear
    picker.backgroundColor = .clear
    picker.delegate = self
    if let label, !label.isEmpty {
      picker.isAccessibilityElement = true
      picker.accessibilityLabel = label
      picker.accessibilityValue = value
      picker.accessibilityTraits = .button
    }
    channel.setMethodCallHandler { [weak picker] call, result in
      guard call.method == "setValue" else {
        result(FlutterMethodNotImplemented)
        return
      }
      picker?.accessibilityValue = call.arguments as? String
      result(nil)
    }
  }

  func view() -> UIView {
    picker
  }

  func routePickerViewWillBeginPresentingRoutes(_ routePickerView: AVRoutePickerView) {
    guard !inCall else {
      return
    }
    VoiceRouteSheetSession.activate(for: self)
  }

  func routePickerViewDidEndPresentingRoutes(_ routePickerView: AVRoutePickerView) {
    VoiceRouteSheetSession.release(from: ObjectIdentifier(self))
  }

  deinit {
    channel.setMethodCallHandler(nil)
    VoiceRouteSheetSession.release(from: ObjectIdentifier(self))
  }
}
