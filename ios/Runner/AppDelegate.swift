import AVFAudio
import AppIntents
import CallKit
import Flutter
import UIKit
import UserNotifications
import flutter_callkit_incoming

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate, CallkitIncomingAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    VoipRegistry.shared.start()
    let result = super.application(application, didFinishLaunchingWithOptions: launchOptions)
    UNUserNotificationCenter.current().delegate = self
    ApplePushBridge.shared.registerReplyCategory()
    AssistantAppShortcuts.updateAppShortcutParameters()
    return result
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

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    VoipRegistry.shared.register(messenger: engineBridge.applicationRegistrar.messenger())
    ApplePushBridge.shared.register(engineBridge: engineBridge)
    ApplePushBridge.shared.registerReplyCategory()
    AssistantBridge.shared.register(engineBridge: engineBridge)
    PhysicalKeyboardBridge.shared.register(engineBridge: engineBridge)
    VoiceSpeakerRouteBridge.shared.register(
      messenger: engineBridge.applicationRegistrar.messenger()
    )
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
