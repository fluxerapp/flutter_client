import AVFAudio
import AppIntents
import CallKit
import Flutter
import Measure
import UIKit
import UserNotifications
import flutter_callkit_incoming

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, CallkitIncomingAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    excludeDatabaseFromBackup()
    VoipRegistry.shared.start()
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    UNUserNotificationCenter.current().delegate = self
    ApplePushBridge.shared.registerReplyCategory()
    AssistantBridge.shared.refreshAppShortcutsInBackground()
    startMeasureIfEnabled()
    return result
  }

  private func excludeDatabaseFromBackup() {
    let fileManager = FileManager.default
    guard let support = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first else {
      return
    }
    var directory = support.appendingPathComponent("database", isDirectory: true)
    var values = URLResourceValues()
    values.isExcludedFromBackup = true
    try? fileManager.createDirectory(at: directory, withIntermediateDirectories: true)
    try? directory.setResourceValues(values)
  }

  private static let measureReportingEnabledKey = "flutter.observability_reporting_enabled"
  private var measureInitialized = false
  private var measureReportingChannel: FlutterMethodChannel?

  private func startMeasureIfEnabled() {
    guard UserDefaults.standard.bool(forKey: Self.measureReportingEnabledKey) else {
      return
    }
    if initializeMeasure() {
      Measure.start()
    }
  }

  private func initializeMeasure() -> Bool {
    if measureInitialized {
      return true
    }
    let measureInfo = Bundle.main.infoDictionary
    let measureApiKey = measureInfo?["MeasureApiKey"] as? String ?? ""
    let measureApiUrl = measureInfo?["MeasureApiUrl"] as? String ?? ""
    if measureApiKey.isEmpty || measureApiUrl.isEmpty {
      return false
    }
    let clientInfo = ClientInfo(apiKey: measureApiKey, apiUrl: measureApiUrl)
    Measure.initialize(with: clientInfo, config: BaseMeasureConfig(autoStart: false))
    measureInitialized = true
    return true
  }

  private func registerMeasureReporting(messenger: FlutterBinaryMessenger) {
    if measureReportingChannel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/measure_reporting",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      switch call.method {
      case "initialize":
        result(self?.initializeMeasure() ?? false)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    measureReportingChannel = channel
  }

  override func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Foundation.Data
  ) {
    ApplePushBridge.shared.setDeviceToken(deviceToken)
    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }

  override func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    ApplePushBridge.shared.clearDeviceTokenOnFailure()
    super.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
  }

  override func application(
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable: Any],
    fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    ApplePushBridge.shared.handleRemoteNotification(
      userInfo: userInfo,
      applicationState: application.applicationState,
      completion: completionHandler
    )
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    if notification.request.content.categoryIdentifier == CallkitNotificationManager.MISSED_CALL_CATEGORY {
      CallkitNotificationManager.shared.userNotificationCenter(
        center,
        willPresent: notification,
        withCompletionHandler: completionHandler
      )
      return
    }
    ApplePushBridge.shared.handleWillPresent(
      notification: notification,
      completionHandler: completionHandler
    )
  }

  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    if response.actionIdentifier == PushNotificationPayload.messageReplyActionId {
      let text = (response as? UNTextInputNotificationResponse)?.userText ?? ""
      ApplePushBridge.shared.handleNotificationReply(
        text: text,
        userInfo: response.notification.request.content.userInfo,
        completion: completionHandler
      )
      return
    }
    if response.actionIdentifier == CallkitNotificationManager.CALLBACK_ACTION {
      let data = response.notification.request.content.userInfo as? [String: Any]
      SwiftFlutterCallkitIncomingPlugin.sharedInstance?.sendCallbackEvent(data)
      completionHandler()
      return
    }
    ApplePushBridge.shared.emitNotificationTap(
      userInfo: response.notification.request.content.userInfo
    )
    super.userNotificationCenter(
      center,
      didReceive: response,
      withCompletionHandler: completionHandler
    )
  }

  override func accessibilityPerformMagicTap() -> Bool {
    VoiceMagicTapBridge.shared.performMagicTap()
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    VoipRegistry.shared.register(messenger: engineBridge.applicationRegistrar.messenger())
    ApplePushBridge.shared.register(engineBridge: engineBridge)
    ApplePushBridge.shared.registerReplyCategory()
    AssistantBridge.shared.register(engineBridge: engineBridge)
    PhysicalKeyboardBridge.shared.register(engineBridge: engineBridge)
    NativePasteBridge.shared.register(engineBridge: engineBridge)
    VoiceActiveRouteBridge.shared.register(
      messenger: engineBridge.applicationRegistrar.messenger()
    )
    if let routePicker = engineBridge.pluginRegistry.registrar(forPlugin: "VoiceRoutePicker") {
      routePicker.register(
        VoiceRoutePickerViewFactory(messenger: routePicker.messenger()),
        withId: "fluxer_app/voice_route_picker"
      )
    }
    UploadKeepAliveBridge.shared.register(
      messenger: engineBridge.applicationRegistrar.messenger()
    )
    AttachmentMediaBridge.shared.register(
      messenger: engineBridge.applicationRegistrar.messenger()
    )
    AppStoreDistributionBridge.shared.register(
      messenger: engineBridge.applicationRegistrar.messenger()
    )
    DeclaredAgeRangeBridge.shared.register(
      messenger: engineBridge.applicationRegistrar.messenger()
    )
    AppAttestBridge.shared.register(
      messenger: engineBridge.applicationRegistrar.messenger()
    )
    registerMeasureReporting(messenger: engineBridge.applicationRegistrar.messenger())
    VoiceMagicTapBridge.shared.register(messenger: engineBridge.applicationRegistrar.messenger())
  }

  func onAccept(_ call: Call, _ action: CXAnswerCallAction) {
    action.fulfill()
  }

  func onDecline(_ call: Call, _ action: CXEndCallAction) {
    action.fulfill()
  }

  func onEnd(_ call: Call, _ action: CXEndCallAction) {
    action.fulfill()
  }

  func onTimeOut(_ call: Call) {}

  func didActivateAudioSession(_ audioSession: AVAudioSession) {
    CallAudioSession.activate(audioSession)
  }

  func didDeactivateAudioSession(_ audioSession: AVAudioSession) {
    CallAudioSession.deactivate(audioSession)
  }

  func providerDidReset() {}
}

final class UploadKeepAliveBridge {
  static let shared = UploadKeepAliveBridge()

  private var channel: FlutterMethodChannel?
  private var task: UIBackgroundTaskIdentifier = .invalid

  func register(messenger: FlutterBinaryMessenger) {
    if channel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/upload_keep_alive",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      switch call.method {
      case "start":
        self?.begin()
        result(nil)
      case "stop":
        self?.end()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  private func begin() {
    if task != .invalid {
      return
    }
    task = UIApplication.shared.beginBackgroundTask(withName: "fluxer.upload") {
      [weak self] in
      self?.end()
    }
  }

  private func end() {
    if task == .invalid {
      return
    }
    UIApplication.shared.endBackgroundTask(task)
    task = .invalid
  }
}

final class VoiceMagicTapBridge {
  static let shared = VoiceMagicTapBridge()

  private var channel: FlutterMethodChannel?
  private var isInCall = false

  func register(messenger: FlutterBinaryMessenger) {
    if channel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/voice_magic_tap",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      switch call.method {
      case "setInCall":
        self?.isInCall = (call.arguments as? Bool) ?? false
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  func performMagicTap() -> Bool {
    guard isInCall, let channel else {
      return false
    }
    channel.invokeMethod("magicTap", arguments: nil)
    return true
  }
}
