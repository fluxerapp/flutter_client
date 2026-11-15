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
      messenger: messenger,
      channelSuffix: "\(viewId)",
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

private final class VoiceRoutePickerValueApi: VoiceRoutePickerHostApi {
  weak var picker: AVRoutePickerView?

  init(picker: AVRoutePickerView) {
    self.picker = picker
  }

  func setValue(value: String?) throws {
    picker?.accessibilityValue = value
  }
}

final class VoiceRoutePickerPlatformView: NSObject, FlutterPlatformView, AVRoutePickerViewDelegate {
  private let picker: AVRoutePickerView
  private let inCall: Bool
  private let messenger: FlutterBinaryMessenger
  private let channelSuffix: String
  private let valueApi: VoiceRoutePickerValueApi

  init(
    frame: CGRect,
    messenger: FlutterBinaryMessenger,
    channelSuffix: String,
    inCall: Bool,
    label: String?,
    value: String?
  ) {
    picker = AVRoutePickerView(frame: frame)
    self.messenger = messenger
    self.channelSuffix = channelSuffix
    valueApi = VoiceRoutePickerValueApi(picker: picker)
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
    VoiceRoutePickerHostApiSetup.setUp(
      binaryMessenger: messenger,
      api: valueApi,
      messageChannelSuffix: channelSuffix
    )
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
    VoiceRoutePickerHostApiSetup.setUp(
      binaryMessenger: messenger,
      api: nil,
      messageChannelSuffix: channelSuffix
    )
    VoiceRouteSheetSession.release(from: ObjectIdentifier(self))
  }
}
