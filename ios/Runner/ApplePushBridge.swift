import Flutter
import Intents
import UIKit
import UserNotifications

final class ApplePushBridge: NSObject, FlutterStreamHandler {
  static let shared = ApplePushBridge()

  private static let methodChannelName = "fluxer_app/apple_push"
  private static let eventChannelName = "fluxer_app/apple_push/messages"
  private static let tapEventChannelName = "fluxer_app/apple_push/taps"
  private static let defaultNotificationTitle = "Fluxer"
  private static let defaultNotificationBody = "New message"
  private static let maxPendingPushEvents = 32
  private static let maxPendingReplies = 8

  private var deviceTokenHex: String?
  private var eventSink: FlutterEventSink?
  fileprivate var tapEventSink: FlutterEventSink?
  fileprivate var pendingTapPayload: [String: String]?
  private var pendingPushEvents: [[String: Any]] = []
  private var isRegisteredWithEngine = false
  private let tapStreamHandler = ApplePushTapStreamHandler()
  private var methodChannel: FlutterMethodChannel?
  private var replyHandlerReady = false
  private var pendingReplies: [PendingReply] = []
  private var replyCategoryGeneration = 0

  private override init() {
    super.init()
    tapStreamHandler.bridge = self
  }

  func register(engineBridge: FlutterImplicitEngineBridge) {
    if isRegisteredWithEngine {
      return
    }
    isRegisteredWithEngine = true
    let messenger = engineBridge.applicationRegistrar.messenger()
    let methodChannel = FlutterMethodChannel(
      name: Self.methodChannelName,
      binaryMessenger: messenger
    )
    self.methodChannel = methodChannel
    methodChannel.setMethodCallHandler { call, result in
      Self.shared.handleMethodCall(call, result: result)
    }
    let eventChannel = FlutterEventChannel(
      name: Self.eventChannelName,
      binaryMessenger: messenger
    )
    eventChannel.setStreamHandler(self)
    let tapEventChannel = FlutterEventChannel(
      name: Self.tapEventChannelName,
      binaryMessenger: messenger
    )
    tapEventChannel.setStreamHandler(tapStreamHandler)
  }

  func setDeviceToken(_ deviceToken: Data) {
    let hex = deviceToken.map { String(format: "%02x", $0) }.joined()
    Self.logApns("device token received length=\(hex.count) token=\(Self.maskToken(hex))")
    if Thread.isMainThread {
      deviceTokenHex = hex
    } else {
      DispatchQueue.main.async {
        self.deviceTokenHex = hex
      }
    }
  }

  func clearDeviceTokenOnFailure() {
    Self.logApns("device token registration failed; clearing cached token")
    if Thread.isMainThread {
      deviceTokenHex = nil
    } else {
      DispatchQueue.main.async {
        self.deviceTokenHex = nil
      }
    }
  }

  func registerReplyCategory() {
    let reply = UNTextInputNotificationAction(
      identifier: PushNotificationPayload.messageReplyActionId,
      title: NSLocalizedString("PUSH_REPLY", comment: ""),
      options: [],
      textInputButtonTitle: NSLocalizedString("PUSH_REPLY", comment: ""),
      textInputPlaceholder: NSLocalizedString("PUSH_REPLY_PLACEHOLDER", comment: "")
    )
    let category = UNNotificationCategory(
      identifier: PushNotificationPayload.messageReplyCategoryId,
      actions: [reply],
      intentIdentifiers: ["INSendMessageIntent"],
      options: []
    )
    DispatchQueue.main.async {
      self.replyCategoryGeneration += 1
      let generation = self.replyCategoryGeneration
      UNUserNotificationCenter.current().getNotificationCategories { existing in
        DispatchQueue.main.async {
          guard generation == self.replyCategoryGeneration else {
            return
          }
          var categories = existing.filter {
            $0.identifier != PushNotificationPayload.messageReplyCategoryId
          }
          categories.insert(category)
          UNUserNotificationCenter.current().setNotificationCategories(categories)
        }
      }
    }
  }

  func handleNotificationReply(
    text: String,
    userInfo: [AnyHashable: Any],
    completion: @escaping () -> Void
  ) {
    let trimmed = text.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else {
      completion()
      return
    }
    let resolved = WebPushRecordDecryptor.resolvedUserInfo(userInfo)
    let args: [String: Any] = [
      "text": trimmed,
      "payload": Self.flattenUserInfo(resolved),
    ]
    DispatchQueue.main.async {
      if self.replyHandlerReady, let channel = self.methodChannel {
        self.invokeReply(channel: channel, args: args, completion: completion)
        return
      }
      self.pendingReplies.append(PendingReply(args: args, completion: completion))
      let overflow = self.pendingReplies.count - Self.maxPendingReplies
      if overflow > 0 {
        let dropped = Array(self.pendingReplies.prefix(overflow))
        self.pendingReplies.removeFirst(overflow)
        for reply in dropped {
          reply.completion()
        }
      }
    }
  }

  private func flushPendingReplies() {
    guard replyHandlerReady, let channel = methodChannel, !pendingReplies.isEmpty else {
      return
    }
    let queued = pendingReplies
    pendingReplies.removeAll()
    for reply in queued {
      invokeReply(channel: channel, args: reply.args, completion: reply.completion)
    }
  }

  private func invokeReply(
    channel: FlutterMethodChannel,
    args: [String: Any],
    completion: @escaping () -> Void
  ) {
    channel.invokeMethod("sendNotificationReply", arguments: args) { _ in
      DispatchQueue.main.async(execute: completion)
    }
  }

  func handleRemoteNotification(
    userInfo: [AnyHashable: Any],
    applicationState: UIApplication.State,
    completion: @escaping (UIBackgroundFetchResult) -> Void
  ) {
    let resolved = WebPushRecordDecryptor.resolvedUserInfo(userInfo)
    if PushNotificationPayload.isClearPayload(from: resolved) {
      handleClearPayload(userInfo: resolved) {
        completion(.newData)
      }
      return
    }
    guard PushNotificationPayload.hasApsAlert(resolved) else {
      completion(.noData)
      return
    }
    let isAppForeground = applicationState == .active
    if !ForegroundPushNotificationPolicy.shouldProcessAlertPush(
      isAppForeground: isAppForeground
    ) {
      completion(.noData)
      return
    }
    emitPushMessage(userInfo: resolved, messageId: nil)
    completion(.newData)
  }

  func handleWillPresent(
    notification: UNNotification,
    completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    let resolved = WebPushRecordDecryptor.resolvedUserInfo(
      notification.request.content.userInfo
    )
    if PushNotificationPayload.isClearPayload(from: resolved) {
      handleClearPayload(userInfo: resolved, completion: nil)
      completionHandler([])
      return
    }
    completionHandler([])
  }

  private func handleClearPayload(
    userInfo: [AnyHashable: Any],
    completion: (() -> Void)?
  ) {
    let finish = {
      self.applyBadgeCount(from: userInfo) {
        completion?()
      }
    }
    guard let channelId = PushNotificationPayload.resolveChannelId(from: userInfo) else {
      DispatchQueue.main.async(execute: finish)
      return
    }
    removeDeliveredNotificationsForChannel(
      channelId: channelId,
      upToMessageId: PushNotificationPayload.resolveMessageId(from: userInfo)
    ) {
      DispatchQueue.main.async(execute: finish)
    }
  }

  private func applyBadgeCount(
    from userInfo: [AnyHashable: Any],
    completion: @escaping () -> Void
  ) {
    let raw = userInfo["badge_count"] ?? (userInfo["data"] as? [AnyHashable: Any])?["badge_count"]
    let count: Int?
    if let number = raw as? Int {
      count = number
    } else if let number = raw as? NSNumber {
      count = number.intValue
    } else if let text = raw as? String {
      count = Int(text)
    } else {
      count = nil
    }
    guard let count else {
      completion()
      return
    }
    UNUserNotificationCenter.current().setBadgeCount(max(count, 0)) { _ in
      DispatchQueue.main.async(execute: completion)
    }
  }

  func removeAllDeliveredNotifications() {
    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
  }

  func removeDeliveredNotificationsForChannel(
    channelId: String,
    upToMessageId: String? = nil,
    completion: (() -> Void)? = nil
  ) {
    guard !channelId.isEmpty else {
      completion?()
      return
    }
    UNUserNotificationCenter.current().getDeliveredNotifications { notifications in
      let identifiers = notifications.compactMap { notification -> String? in
        guard PushNotificationPayload.notificationMatchesChannel(notification, channelId: channelId)
        else {
          return nil
        }
        let messageId = PushNotificationPayload.resolveMessageId(
          from: notification.request.content.userInfo
        )
        guard PushNotificationPayload.messageIsCoveredByAck(
          messageId: messageId,
          upToMessageId: upToMessageId
        ) else {
          return nil
        }
        return notification.request.identifier
      }
      if identifiers.isEmpty {
        completion?()
        return
      }
      UNUserNotificationCenter.current().removeDeliveredNotifications(
        withIdentifiers: identifiers
      )
      completion?()
    }
  }

  func emitNotificationTap(userInfo: [AnyHashable: Any]) {
    let payload = Self.flattenUserInfo(userInfo)
    DispatchQueue.main.async {
      guard let sink = self.tapEventSink else {
        self.pendingTapPayload = payload
        return
      }
      sink(payload)
    }
  }

  func emitPushMessage(userInfo: [AnyHashable: Any], messageId: String?) {
    let event = Self.buildPushEvent(userInfo: userInfo, messageId: messageId)
    DispatchQueue.main.async {
      if let sink = self.eventSink {
        sink(event)
        return
      }
      self.enqueuePendingPushEvent(event)
    }
  }

  private func enqueuePendingPushEvent(_ event: [String: Any]) {
    pendingPushEvents.append(event)
    if pendingPushEvents.count > Self.maxPendingPushEvents {
      pendingPushEvents.removeFirst(pendingPushEvents.count - Self.maxPendingPushEvents)
    }
  }

  private func flushPendingPushEvents() {
    guard let sink = eventSink else {
      return
    }
    let events = pendingPushEvents
    pendingPushEvents.removeAll()
    for event in events {
      sink(event)
    }
  }

  private static func buildPushEvent(
    userInfo: [AnyHashable: Any],
    messageId: String?
  ) -> [String: Any] {
    let payload = flattenUserInfo(userInfo)
    let display = resolveDisplayContent(from: userInfo)
    let decodedBody = NotificationEmojiDecoder.decode(body: display.body).body
    var notification: [String: Any] = [:]
    notification["title"] = display.title
    notification["body"] = decodedBody
    let id = messageId ?? PushNotificationPayload.resolveNotificationIdentifier(from: userInfo)
    return [
      "messageId": id,
      "notification": notification,
      "data": payload,
    ]
  }

  private static func resolveDisplayContent(
    from userInfo: [AnyHashable: Any]
  ) -> (title: String, body: String) {
    var title: String?
    var body: String?
    if let aps = userInfo["aps"] as? [String: Any] {
      if let alert = aps["alert"] as? [String: Any] {
        title = alert["title"] as? String
        body = alert["body"] as? String
      } else if let alert = aps["alert"] as? String {
        body = alert
      }
    }
    if title == nil {
      title = userInfo["title"] as? String
    }
    if body == nil {
      body = userInfo["body"] as? String
    }
    if let data = userInfo["data"] as? [String: Any] {
      if title == nil {
        title = data["title"] as? String
      }
      if body == nil {
        body = data["body"] as? String
      }
    }
    return (
      title: title ?? defaultNotificationTitle,
      body: body ?? defaultNotificationBody
    )
  }

  private static func requestAuthorizationIfNeeded(completion: @escaping () -> Void) {
    UNUserNotificationCenter.current().getNotificationSettings { settings in
      switch settings.authorizationStatus {
      case .notDetermined:
        UNUserNotificationCenter.current().requestAuthorization(
          options: [.alert, .badge, .sound]
        ) { _, _ in
          DispatchQueue.main.async {
            completion()
          }
        }
      default:
        DispatchQueue.main.async {
          completion()
        }
      }
    }
  }

  private func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "registerRemoteNotifications":
      DispatchQueue.main.async {
        Self.logApns("registerRemoteNotifications requested")
        Self.requestAuthorizationIfNeeded {
          UIApplication.shared.registerForRemoteNotifications()
          result(nil)
        }
      }
    case "getDeviceToken":
      DispatchQueue.main.async {
        if let token = self.deviceTokenHex, !token.isEmpty {
          Self.logApns("getDeviceToken hit cache token=\(Self.maskToken(token))")
        } else {
          Self.logApns("getDeviceToken cache miss")
        }
        result(self.deviceTokenHex)
      }
    case "removeDeliveredNotificationsForChannel":
      guard let args = call.arguments as? [String: Any],
        let channelId = args["channelId"] as? String,
        !channelId.isEmpty
      else {
        result(
          FlutterError(
            code: "invalid_args",
            message: "channelId is required",
            details: nil
          )
        )
        return
      }
      let messageId = args["messageId"] as? String
      self.removeDeliveredNotificationsForChannel(
        channelId: channelId,
        upToMessageId: messageId
      ) {
        DispatchQueue.main.async {
          result(nil)
        }
      }
    case "removeAllDeliveredNotifications":
      self.removeAllDeliveredNotifications()
      result(nil)
    case "replyHandlerReady":
      DispatchQueue.main.async {
        self.replyHandlerReady = true
        result(nil)
        self.flushPendingReplies()
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private static func flattenUserInfo(_ userInfo: [AnyHashable: Any]) -> [String: String] {
    var out: [String: String] = [:]
    for (key, value) in userInfo {
      guard (key as? String) != "aps" else {
        continue
      }
      let keyString = String(describing: key)
      if keyString == "data", let dataDict = value as? [String: Any] {
        for (dataKey, dataValue) in dataDict {
          out[String(describing: dataKey)] = "\(dataValue)"
        }
        continue
      }
      if let dict = value as? [String: Any] {
        if let data = try? JSONSerialization.data(withJSONObject: dict),
          let string = String(data: data, encoding: .utf8)
        {
          out[keyString] = string
        } else {
          out[keyString] = String(describing: value)
        }
      } else if let array = value as? [Any] {
        if let data = try? JSONSerialization.data(withJSONObject: array),
          let string = String(data: data, encoding: .utf8)
        {
          out[keyString] = string
        } else {
          out[keyString] = String(describing: value)
        }
      } else {
        out[keyString] = "\(value)"
      }
    }
    if out["url"] == nil || out["url"]?.isEmpty == true,
      let navigate = out["navigate"], !navigate.isEmpty
    {
      out["url"] = navigate
    }
    return out
  }

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
    -> FlutterError?
  {
    eventSink = events
    flushPendingPushEvents()
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    eventSink = nil
    return nil
  }

  private static func logApns(_ message: String) {
    #if DEBUG
      print("[ApplePushBridge] \(message)")
    #endif
  }

  private static func maskToken(_ token: String) -> String {
    guard token.count > 12 else {
      return "***"
    }
    let prefix = token.prefix(8)
    let suffix = token.suffix(4)
    return "\(prefix)...\(suffix)"
  }
}

private struct PendingReply {
  let args: [String: Any]
  let completion: () -> Void
}

private final class ApplePushTapStreamHandler: NSObject, FlutterStreamHandler {
  weak var bridge: ApplePushBridge?

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
    -> FlutterError?
  {
    bridge?.tapEventSink = events
    if let pending = bridge?.pendingTapPayload {
      events(pending)
      bridge?.pendingTapPayload = nil
    }
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    bridge?.tapEventSink = nil
    return nil
  }
}
