import Flutter
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

  private var deviceTokenHex: String?
  private var eventSink: FlutterEventSink?
  fileprivate var tapEventSink: FlutterEventSink?
  fileprivate var pendingTapPayload: [String: String]?
  private var pendingPushEvents: [[String: Any]] = []
  private var isRegisteredWithEngine = false
  private let tapStreamHandler = ApplePushTapStreamHandler()

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

  func handleRemoteNotification(
    userInfo: [AnyHashable: Any],
    applicationState: UIApplication.State
  ) {
    if PushNotificationPayload.isClearPayload(from: userInfo) {
      handleClearPayload(userInfo: userInfo)
      return
    }
    guard PushNotificationPayload.hasApsAlert(userInfo) else {
      return
    }
    let isAppForeground = applicationState == .active
    if !ForegroundPushNotificationPolicy.shouldProcessAlertPush(
      isAppForeground: isAppForeground
    ) {
      return
    }
    emitPushMessage(userInfo: userInfo, messageId: nil)
    if !isAppForeground {
      presentLocalNotificationReplacingRemoteDuplicate(userInfo: userInfo)
    }
  }

  func handleWillPresent(
    notification: UNNotification,
    completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    let userInfo = notification.request.content.userInfo
    if PushNotificationPayload.isClearPayload(from: userInfo) {
      handleClearPayload(userInfo: userInfo)
      completionHandler([])
      return
    }
    completionHandler([])
  }

  private func handleClearPayload(userInfo: [AnyHashable: Any]) {
    if let channelId = PushNotificationPayload.resolveChannelId(from: userInfo) {
      removeDeliveredNotificationsForChannel(channelId: channelId)
    }
  }

  func removeAllDeliveredNotifications() {
    UNUserNotificationCenter.current().removeAllDeliveredNotifications()
  }

  func removeDeliveredNotificationsForChannel(channelId: String) {
    guard !channelId.isEmpty else {
      return
    }
    UNUserNotificationCenter.current().getDeliveredNotifications { notifications in
      let identifiers = notifications.compactMap { notification -> String? in
        guard PushNotificationPayload.notificationMatchesChannel(notification, channelId: channelId)
        else {
          return nil
        }
        return notification.request.identifier
      }
      guard !identifiers.isEmpty else {
        return
      }
      UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: identifiers)
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

  private func presentLocalNotificationReplacingRemoteDuplicate(
    userInfo: [AnyHashable: Any],
    sourceContent: UNNotificationContent? = nil
  ) {
    let identifier = PushNotificationPayload.resolveNotificationIdentifier(from: userInfo)
    UNUserNotificationCenter.current().getDeliveredNotifications { notifications in
      var attachments = sourceContent?.attachments ?? []
      let remoteDuplicateIds = notifications.compactMap { notification -> String? in
        let requestId = notification.request.identifier
        if requestId == identifier {
          return nil
        }
        let deliveredUserInfo = notification.request.content.userInfo
        if let deliveredMessageId = PushNotificationPayload.resolveMessageId(from: deliveredUserInfo),
          deliveredMessageId == requestId
        {
          return nil
        }
        if PushNotificationPayload.resolveMessageId(from: deliveredUserInfo) == identifier {
          if attachments.isEmpty {
            attachments = notification.request.content.attachments
          }
          return requestId
        }
        return nil
      }
      if !remoteDuplicateIds.isEmpty {
        UNUserNotificationCenter.current().removeDeliveredNotifications(
          withIdentifiers: remoteDuplicateIds
        )
      }
      self.scheduleLocalNotification(
        userInfo: userInfo,
        identifier: identifier,
        attachments: attachments
      )
    }
  }

  private func scheduleLocalNotification(
    userInfo: [AnyHashable: Any],
    identifier: String,
    attachments: [UNNotificationAttachment] = []
  ) {
    let display = Self.resolveDisplayContent(from: userInfo)
    let emojiResult = NotificationEmojiDecoder.decode(body: display.body)
    if !attachments.isEmpty {
      addLocalNotification(
        userInfo: userInfo,
        identifier: identifier,
        title: display.title,
        body: emojiResult.body,
        attachments: attachments
      )
      return
    }
    if let messageImageUrl = NotificationPayloadMedia.resolveImageUrl(from: userInfo) {
      downloadAndScheduleLocalNotification(
        userInfo: userInfo,
        identifier: identifier,
        title: display.title,
        body: emojiResult.body,
        imageUrl: messageImageUrl,
        attachmentIdentifier: NotificationImageAttachment.messageImageIdentifier
      )
      return
    }
    if let emojiImageUrl = emojiResult.imageUrls.first {
      downloadAndScheduleLocalNotification(
        userInfo: userInfo,
        identifier: identifier,
        title: display.title,
        body: emojiResult.body,
        imageUrl: emojiImageUrl,
        attachmentIdentifier: NotificationImageAttachment.emojiImageIdentifier
      )
      return
    }
    addLocalNotification(
      userInfo: userInfo,
      identifier: identifier,
      title: display.title,
      body: emojiResult.body,
      attachments: []
    )
  }

  private func downloadAndScheduleLocalNotification(
    userInfo: [AnyHashable: Any],
    identifier: String,
    title: String,
    body: String,
    imageUrl: URL,
    attachmentIdentifier: String
  ) {
    NotificationImageAttachment.downloadImage(from: imageUrl) { localFileUrl in
      var attachments: [UNNotificationAttachment] = []
      var tempFilesToRemove: [URL] = []
      if let fileURL = localFileUrl {
        let attachmentResult = NotificationImageAttachment.makeImageAttachment(
          fileURL: fileURL,
          identifier: attachmentIdentifier
        )
        tempFilesToRemove = attachmentResult.filesToRemove
        if let attachment = attachmentResult.attachment {
          attachments = [attachment]
        }
      }
      self.addLocalNotification(
        userInfo: userInfo,
        identifier: identifier,
        title: title,
        body: body,
        attachments: attachments
      )
      for tempURL in tempFilesToRemove {
        try? FileManager.default.removeItem(at: tempURL)
      }
    }
  }

  private func addLocalNotification(
    userInfo: [AnyHashable: Any],
    identifier: String,
    title: String,
    body: String,
    attachments: [UNNotificationAttachment]
  ) {
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = PushNotificationPayload.resolveNotificationSound(from: userInfo) ?? .default
    content.userInfo = Self.userInfoDictionary(userInfo)
    if !attachments.isEmpty {
      content.attachments = attachments
    }
    if let threadId = PushNotificationPayload.resolveChannelThreadIdentifier(from: userInfo) {
      content.threadIdentifier = threadId
    }
    let request = UNNotificationRequest(
      identifier: identifier,
      content: content,
      trigger: nil
    )
    UNUserNotificationCenter.current().add(request)
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

  private static func hasApsAlert(_ userInfo: [AnyHashable: Any]) -> Bool {
    PushNotificationPayload.hasApsAlert(userInfo)
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

  private static func userInfoDictionary(_ userInfo: [AnyHashable: Any]) -> [AnyHashable: Any] {
    var out: [AnyHashable: Any] = [:]
    for (key, value) in userInfo {
      out[key] = value
    }
    return out
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
      self.removeDeliveredNotificationsForChannel(channelId: channelId)
      result(nil)
    case "removeAllDeliveredNotifications":
      self.removeAllDeliveredNotifications()
      result(nil)
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
