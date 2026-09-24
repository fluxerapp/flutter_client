import AVFoundation
import CallKit
import Flutter
import PushKit
import UIKit
import UserNotifications
import flutter_callkit_incoming

final class VoipPushHandler: NSObject, PKPushRegistryDelegate, CXProviderDelegate {
  static let shared = VoipPushHandler()

  private var registry: PKPushRegistry?
  private var fallbackProvider: CXProvider?
  private var reportedProvider: CXProvider?
  private var ringingMessageIds = Set<String>()
  private var calls: [String: flutter_callkit_incoming.Data] = [:]
  private var pendingAnswerId: String?
  private var answerAttempts = 0
  private var answerSends = 0
  private var pendingVoipTokenHex: String?
  private var answeredHangup: DispatchWorkItem?
  private var methodChannel: FlutterMethodChannel?

  func start() {
    if registry != nil {
      return
    }
    let registry = PKPushRegistry(queue: .main)
    registry.delegate = self
    registry.desiredPushTypes = [.voIP]
    self.registry = registry
    _ = incomingProvider()
  }

  func register(messenger: FlutterBinaryMessenger) {
    if methodChannel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/voip_callkit",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "hold":
        self.holdAnsweredCall()
        result(nil)
      case "endAll":
        self.endAllReportedCalls()
        result(nil)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    methodChannel = channel
  }

  func pushRegistry(
    _ registry: PKPushRegistry,
    didUpdate pushCredentials: PKPushCredentials,
    for type: PKPushType
  ) {
    guard type == .voIP else {
      return
    }
    let hex = pushCredentials.token.map { String(format: "%02x", $0) }.joined()
    pendingVoipTokenHex = hex
    applyPendingVoipToken()
  }

  func applyPendingVoipToken() {
    guard let hex = pendingVoipTokenHex, !hex.isEmpty else {
      return
    }
    SwiftFlutterCallkitIncomingPlugin.sharedInstance?.setDevicePushTokenVoIP(hex)
  }

  func pushRegistry(_ registry: PKPushRegistry, didInvalidatePushTokenFor type: PKPushType) {
    guard type == .voIP else {
      return
    }
    pendingVoipTokenHex = nil
    SwiftFlutterCallkitIncomingPlugin.sharedInstance?.setDevicePushTokenVoIP("")
  }

  func pushRegistry(
    _ registry: PKPushRegistry,
    didReceiveIncomingPushWith payload: PKPushPayload,
    for type: PKPushType,
    completion: @escaping () -> Void
  ) {
    guard type == .voIP else {
      completion()
      return
    }
    handleVoipPush(payload, mustReport: true, completion: completion)
  }

  @available(iOS 26.4, *)
  func pushRegistry(
    _ registry: PKPushRegistry,
    didReceiveIncomingVoIPPushWith payload: PKPushPayload,
    metadata: PKVoIPPushMetadata,
    withCompletionHandler completion: @escaping () -> Void
  ) {
    handleVoipPush(payload, mustReport: metadata.mustReport, completion: completion)
  }

  private func handleVoipPush(
    _ payload: PKPushPayload,
    mustReport: Bool,
    completion: @escaping () -> Void
  ) {
    guard mustReport else {
      completion()
      return
    }
    let callId = UUID().uuidString
    let data = Self.placeholderCall(id: callId)
    calls[callId] = data
    let encoded = payload.dictionaryPayload["p"] as? String
    reportIncoming(data) {
      completion()
      switch Self.decide(
        encoded: encoded,
        ringingMessageIds: [],
        isForeground: false
      ) {
      case .drop, .keepPlaceholder:
        self.publishIncoming(data)
      case .ring(let fields):
        self.ringingMessageIds.insert(fields.messageId)
        self.apply(fields, to: data)
        self.updateReportedCaller(data)
        self.publishIncoming(data)
        if Self.callIsReported(data) {
          self.collapseCallMessageNotification(messageId: fields.messageId)
          DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.collapseCallMessageNotification(messageId: fields.messageId)
          }
        }
        self.deliverPendingAnswer()
      }
    }
  }

  func providerDidReset(_ provider: CXProvider) {
    if fallbackProvider === provider {
      fallbackProvider = nil
    }
    reportedProvider = nil
    calls.removeAll()
    ringingMessageIds.removeAll()
    holdAnsweredCall()
    pendingAnswerId = nil
  }

  func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    configureAudioSession()
    action.fulfill()
    pendingAnswerId = action.callUUID.uuidString
    answerAttempts = 0
    answerSends = 0
    bringAppForward()
    deliverPendingAnswer()
    scheduleUnheldHangup()
  }

  func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    action.fulfill()
    if pendingAnswerId == action.callUUID.uuidString {
      holdAnsweredCall()
      pendingAnswerId = nil
    }
    forgetCall(uuid: action.callUUID.uuidString)
  }

  func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {}

  func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {}

  private func holdAnsweredCall() {
    answeredHangup?.cancel()
    answeredHangup = nil
  }

  func endAllReportedCalls() {
    holdAnsweredCall()
    pendingAnswerId = nil
    answerAttempts = 0
    answerSends = 0
    let provider = reportedProvider ?? fallbackProvider
    var ids = Set(calls.keys)
    for call in CXCallObserver().calls where !call.hasEnded {
      ids.insert(call.uuid.uuidString)
    }
    for id in ids {
      if let uuid = UUID(uuidString: id), let provider {
        provider.reportCall(with: uuid, endedAt: Date(), reason: .remoteEnded)
      }
      forgetCall(uuid: id)
    }
  }

  private func scheduleUnheldHangup() {
    holdAnsweredCall()
    let work = DispatchWorkItem { [weak self] in
      self?.endAllReportedCalls()
    }
    answeredHangup = work
    DispatchQueue.main.asyncAfter(deadline: .now() + 45, execute: work)
  }

  private func configureAudioSession() {
    let session = AVAudioSession.sharedInstance()
    try? session.setCategory(
      .playAndRecord,
      mode: .voiceChat,
      options: [.allowBluetooth, .allowBluetoothA2DP]
    )
  }

  private func reportIncoming(
    _ data: flutter_callkit_incoming.Data,
    reported: @escaping () -> Void
  ) {
    let provider = incomingProvider()
    reportedProvider = provider
    let staleIds = calls.keys.filter { $0 != data.uuid }
    for id in staleIds {
      if let existing = UUID(uuidString: id) {
        provider.reportCall(with: existing, endedAt: Date(), reason: .unanswered)
      }
      calls.removeValue(forKey: id)
    }
    guard let uuid = UUID(uuidString: data.uuid) else {
      reported()
      return
    }
    let update = CXCallUpdate()
    update.localizedCallerName = data.nameCaller
    update.remoteHandle = CXHandle(type: .generic, value: data.handle)
    update.hasVideo = false
    update.supportsHolding = false
    update.supportsGrouping = false
    update.supportsUngrouping = false
    update.supportsDTMF = false
    provider.reportNewIncomingCall(with: uuid, update: update) { error in
      if let error {
        NSLog("[VoipPush] report failed: \(error.localizedDescription)")
      }
      DispatchQueue.main.async(execute: reported)
    }
  }

  private func deliverPendingAnswer() {
    guard let id = pendingAnswerId else {
      return
    }
    answerAttempts += 1
    if answerAttempts > 40 {
      pendingAnswerId = nil
      answerSends = 0
      return
    }
    let channel = calls[id]?.extra["channelId"] as? String
    if let plugin = SwiftFlutterCallkitIncomingPlugin.sharedInstance,
      let data = calls[id],
      let channel,
      !channel.isEmpty
    {
      plugin.sendEventCustom(
        "com.hiennv.flutter_callkit_incoming.ACTION_CALL_ACCEPT",
        body: data.toJSON() as NSDictionary
      )
      answerSends += 1
      if answerSends >= 6 {
        pendingAnswerId = nil
        answerSends = 0
        return
      }
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      self.deliverPendingAnswer()
    }
  }

  private func bringAppForward() {
    let scene = UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .first
    guard let scene else {
      return
    }
    UIApplication.shared.requestSceneSessionActivation(
      scene.session,
      userActivity: nil,
      options: nil,
      errorHandler: nil
    )
  }

  private func updateReportedCaller(_ data: flutter_callkit_incoming.Data) {
    guard let uuid = UUID(uuidString: data.uuid) else {
      return
    }
    let update = CXCallUpdate()
    update.localizedCallerName = data.nameCaller
    update.remoteHandle = CXHandle(type: .generic, value: data.handle)
    update.hasVideo = false
    update.supportsHolding = false
    update.supportsGrouping = false
    update.supportsUngrouping = false
    update.supportsDTMF = false
    let provider = reportedProvider ?? incomingProvider()
    provider.reportCall(with: uuid, updated: update)
  }

  private func endReportedCall(_ data: flutter_callkit_incoming.Data) {
    forgetCall(uuid: data.uuid)
    guard let uuid = UUID(uuidString: data.uuid) else {
      return
    }
    let provider = reportedProvider ?? incomingProvider()
    provider.reportCall(with: uuid, endedAt: Date(), reason: .remoteEnded)
  }

  private func forgetCall(uuid: String) {
    if let messageId = calls[uuid]?.extra["messageId"] as? String {
      ringingMessageIds.remove(messageId)
    }
    calls.removeValue(forKey: uuid)
  }

  private func publishIncoming(_ data: flutter_callkit_incoming.Data) {
    SwiftFlutterCallkitIncomingPlugin.sharedInstance?.sendEventCustom(
      "com.hiennv.flutter_callkit_incoming.ACTION_CALL_INCOMING",
      body: data.toJSON() as NSDictionary
    )
  }

  private func collapseCallMessageNotification(messageId: String) {
    guard !messageId.isEmpty else {
      return
    }
    let center = UNUserNotificationCenter.current()
    center.removePendingNotificationRequests(withIdentifiers: [messageId])
    center.removeDeliveredNotifications(withIdentifiers: [messageId])
    center.getDeliveredNotifications { notifications in
      let identifiers = notifications.compactMap { notification -> String? in
        let userInfo = notification.request.content.userInfo
        let id = PushNotificationPayload.resolveMessageId(from: userInfo)
        return id == messageId ? notification.request.identifier : nil
      }
      guard !identifiers.isEmpty else {
        return
      }
      center.removeDeliveredNotifications(withIdentifiers: identifiers)
    }
  }

  private func incomingProvider() -> CXProvider {
    if let fallbackProvider {
      return fallbackProvider
    }
    let config = CXProviderConfiguration()
    config.supportsVideo = false
    config.maximumCallGroups = 1
    config.maximumCallsPerCallGroup = 2
    config.supportedHandleTypes = [.generic]
    config.ringtoneSound = "incoming_ring.caf"
    config.includesCallsInRecents = true
    let provider = CXProvider(configuration: config)
    provider.setDelegate(self, queue: .main)
    fallbackProvider = provider
    return provider
  }

  private static func callIsReported(_ data: flutter_callkit_incoming.Data) -> Bool {
    guard let uuid = UUID(uuidString: data.uuid) else {
      return false
    }
    return CXCallObserver().calls.contains { $0.uuid == uuid }
  }

  private enum ReportedCall {
    case ring(CallRingFields)
    case drop
    case keepPlaceholder
  }

  private static func decide(
    encoded: String?,
    ringingMessageIds: Set<String>,
    isForeground: Bool
  ) -> ReportedCall {
    guard let encoded,
      let record = WebPushKeychain.decodeBase64Url(encoded),
      let decrypted = WebPushRecordDecryptor.decryptVoip(record: record)
    else {
      return .keepPlaceholder
    }
    switch CallRingResolver.resolve(
      plaintext: decrypted.plaintext,
      accountUserId: decrypted.userId,
      nowMs: Int64(Date().timeIntervalSince1970 * 1000),
      ringingMessageIds: ringingMessageIds,
      isForeground: isForeground
    ) {
    case .end:
      return .drop
    case .ring(let fields):
      return .ring(fields)
    }
  }

  private func apply(_ fields: CallRingFields, to data: flutter_callkit_incoming.Data) {
    data.nameCaller = fields.callerName
    data.handle = fields.handle
    data.duration = fields.durationMs
    if let avatar = fields.callerAvatarUrl {
      data.avatar = avatar
    }
    data.extra = [
      "channelId": fields.channelId,
      "messageId": fields.messageId,
    ] as NSDictionary
  }

  private static func placeholderCall(id: String) -> flutter_callkit_incoming.Data {
    let data = flutter_callkit_incoming.Data(
      id: id,
      nameCaller: CallRingResolver.fallbackName,
      handle: CallRingResolver.fallbackHandle,
      type: 0
    )
    data.appName = "Fluxer"
    data.duration = 45_000
    data.supportsVideo = false
    data.configureAudioSession = false
    data.audioSessionMode = "videoChat"
    data.audioSessionActive = true
    data.handleType = "generic"
    data.ringtonePath = "incoming_ring.caf"
    data.isShowMissedCallNotification = false
    data.iconName = ""
    data.normalHandle = 1
    return data
  }
}
