import AVFAudio
import CallKit
import Flutter
import PushKit
import UIKit
import UserNotifications
import flutter_callkit_incoming

final class IncomingCallReporter: NSObject, CXProviderDelegate {
  private static let queueSpecific = DispatchSpecificKey<UInt8>()

  let queue: DispatchQueue = {
    let queue = DispatchQueue(label: "app.fluxer.voip")
    queue.sync {
      queue.setSpecific(key: IncomingCallReporter.queueSpecific, value: 1)
    }
    return queue
  }()

  private var callProvider: CallProvider?
  private var calls: [UUID: LiveCall] = [:]
  private var ringTimers: [UUID: DispatchWorkItem] = [:]
  private var answerHangup: DispatchWorkItem?
  private var methodChannel: FlutterMethodChannel?
  private var pendingNotify: (event: String, body: [String: Any], uuid: UUID)?
  private var callAudioActive = false
  private var backgroundTask = UIBackgroundTaskIdentifier.invalid
  private var backgroundGeneration = 0

  private struct LiveCall {
    let channelId: String
    let messageId: String
    let name: String
    let handle: String
    var answered = false
    var published = false
  }

  func start() {
    if callProvider != nil {
      return
    }
    let provider = CallProvider(delegate: self, queue: .main)
    callProvider = provider
    for call in CXCallObserver().calls where !call.hasEnded {
      provider.end(uuid: call.uuid, reason: .failed)
    }
  }

  func register(messenger: FlutterBinaryMessenger) {
    if methodChannel != nil {
      return
    }
    let channel = FlutterMethodChannel(
      name: "fluxer_app/voip_callkit",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self else {
        result(nil)
        return
      }
      switch call.method {
      case "hold":
        self.queue.async {
          self.cancelAnswerHangup()
          self.reemitAudioSessionIfActive()
        }
        result(nil)
      case "endAll":
        self.queue.async { self.endAll() }
        result(nil)
      case "hasUnanswered":
        self.queue.async {
          let ringing = self.hasUnansweredCall()
          DispatchQueue.main.async {
            result(ringing)
          }
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    methodChannel = channel
  }

  func handle(payload: PKPushPayload, completion: @escaping () -> Void) {
    let encoded = payload.dictionaryPayload["p"] as? String
    switch decide(encoded: encoded) {
    case .ring(let fields):
      report(
        uuid: fields.callUUID,
        name: fields.callerName,
        handle: fields.handle,
        fields: fields,
        endAfterReport: false,
        completion: completion
      )
    case .reject(let messageId):
      NSLog("[CallKit] voip push kept on screen without a parsed ring")
      let uuid = messageId.map { CallRingUuid.v5(name: $0) } ?? UUID()
      report(
        uuid: uuid,
        name: CallRingResolver.fallbackName,
        handle: CallRingResolver.fallbackHandle,
        fields: nil,
        endAfterReport: false,
        completion: completion
      )
    }
  }

  func providerDidReset(_ provider: CXProvider) {
    queue.async { [weak self] in
      guard let self else {
        return
      }
      self.answerHangup?.cancel()
      self.answerHangup = nil
      for timer in self.ringTimers.values {
        timer.cancel()
      }
      self.ringTimers.removeAll()
      self.calls.removeAll()
      self.pendingNotify = nil
      self.callAudioActive = false
    }
  }

  func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
    action.fail()
  }

  func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    CallAudioSession.prepareForAnswer()
    action.fulfill()
    let uuid = action.callUUID
    queue.async { [weak self] in
      self?.didAnswer(uuid)
    }
    keepAlive()
    bringAppForward()
  }

  func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    action.fulfill()
    let uuid = action.callUUID
    queue.async { [weak self] in
      self?.didEnd(uuid)
    }
    keepAlive()
  }

  func provider(_ provider: CXProvider, perform action: CXSetMutedCallAction) {
    action.fulfill()
    let uuid = action.callUUID
    let muted = action.isMuted
    queue.async { [weak self] in
      self?.emit(Self.muteEvent, body: [
        "id": uuid.uuidString.lowercased(),
        "isMuted": muted,
      ])
    }
  }

  func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
    CallAudioSession.activate(audioSession)
    queue.async { [weak self] in
      guard let self else {
        return
      }
      self.callAudioActive = true
      self.emit(Self.audioSessionEvent, body: ["isActive": true])
    }
  }

  func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
    CallAudioSession.deactivate(audioSession)
    queue.async { [weak self] in
      guard let self else {
        return
      }
      self.callAudioActive = false
      self.emit(Self.audioSessionEvent, body: ["isActive": false])
    }
  }

  private func didAnswer(_ uuid: UUID) {
    ringTimers[uuid]?.cancel()
    ringTimers[uuid] = nil
    guard var call = calls[uuid] else {
      return
    }
    call.answered = true
    calls[uuid] = call
    scheduleAnswerHangup()
    publish(Self.acceptEvent, uuid: uuid, body: eventBody(call, uuid: uuid, accepted: true))
  }

  private func didEnd(_ uuid: UUID) {
    let call = calls.removeValue(forKey: uuid)
    ringTimers[uuid]?.cancel()
    ringTimers[uuid] = nil
    if call?.answered == true {
      cancelAnswerHangup()
    }
    if pendingNotify?.uuid == uuid {
      pendingNotify = nil
    }
    guard let call else {
      return
    }
    let event = call.answered ? Self.endedEvent : Self.declineEvent
    emit(event, body: eventBody(call, uuid: uuid, accepted: call.answered))
  }

  private func report(
    uuid: UUID,
    name: String,
    handle: String,
    fields: CallRingFields?,
    endAfterReport: Bool,
    completion: @escaping () -> Void
  ) {
    start()
    guard let callProvider else {
      completion()
      return
    }
    if fields != nil {
      dropOtherRings(except: uuid)
    }
    if let fields, calls[uuid] == nil {
      calls[uuid] = LiveCall(
        channelId: fields.channelId,
        messageId: fields.messageId,
        name: name,
        handle: handle
      )
    }
    let update = CallProvider.update(name: name, handle: handle)
    callProvider.reportIncoming(uuid: uuid, update: update) { [weak self] error in
      completion()
      guard let self else {
        return
      }
      self.onQueue {
        self.finishReport(
          uuid: uuid,
          error: error,
          fields: fields,
          endAfterReport: endAfterReport
        )
      }
    }
  }

  private func finishReport(
    uuid: UUID,
    error: Error?,
    fields: CallRingFields?,
    endAfterReport: Bool
  ) {
    if let error {
      if isAlreadyReported(error) {
        publishRing(uuid: uuid, fields: fields)
        return
      }
      if calls[uuid]?.published != true {
        calls.removeValue(forKey: uuid)
      }
      NSLog("[CallKit] report failed: \(error.localizedDescription)")
      return
    }
    NSLog("[CallKit] voip call reported")
    if endAfterReport {
      if calls[uuid]?.answered == true || calls[uuid]?.published == true {
        return
      }
      calls.removeValue(forKey: uuid)
      callProvider?.end(uuid: uuid, reason: .failed)
      return
    }
    guard fields != nil else {
      scheduleBareTimeout(uuid)
      return
    }
    publishRing(uuid: uuid, fields: fields)
  }

  private func scheduleBareTimeout(_ uuid: UUID) {
    ringTimers[uuid]?.cancel()
    let work = DispatchWorkItem { [weak self] in
      guard let self else {
        return
      }
      self.ringTimers[uuid] = nil
      guard self.calls[uuid]?.answered != true else {
        return
      }
      self.callProvider?.end(uuid: uuid, reason: .unanswered)
    }
    ringTimers[uuid] = work
    queue.asyncAfter(deadline: .now() + 30, execute: work)
  }

  private func publishRing(uuid: UUID, fields: CallRingFields?) {
    guard let fields, var call = calls[uuid], !call.published else {
      return
    }
    call.published = true
    calls[uuid] = call
    publish(Self.incomingEvent, uuid: uuid, body: eventBody(call, uuid: uuid, accepted: false))
    clearCallMessage(messageId: fields.messageId)
    scheduleRingTimeout(uuid: uuid, durationMs: fields.durationMs)
  }

  private func decide(encoded: String?) -> CallRingOutcome {
    guard let encoded else {
      NSLog("[CallKit] voip payload missing p")
      return .reject(messageId: nil)
    }
    guard let record = WebPushKeychain.decodeBase64Url(encoded),
      let decrypted = WebPushRecordDecryptor.decryptVoip(record: record)
    else {
      NSLog("[CallKit] voip payload did not decrypt")
      return .reject(messageId: nil)
    }
    let outcome = CallRingResolver.resolve(
      plaintext: decrypted.plaintext,
      accountUserId: decrypted.userId,
      nowMs: Int64(Date().timeIntervalSince1970 * 1000)
    )
    if case .reject = outcome {
      NSLog("[CallKit] voip payload was not a live ring")
    }
    return outcome
  }

  private func dropOtherRings(except uuid: UUID) {
    let others = calls.keys.filter { $0 != uuid && calls[$0]?.answered == false }
    for other in others {
      ringTimers[other]?.cancel()
      ringTimers[other] = nil
      calls.removeValue(forKey: other)
      if pendingNotify?.uuid == other {
        pendingNotify = nil
      }
      callProvider?.end(uuid: other, reason: .unanswered)
    }
  }

  private func scheduleRingTimeout(uuid: UUID, durationMs: Int) {
    ringTimers[uuid]?.cancel()
    let work = DispatchWorkItem { [weak self] in
      self?.endUnanswered(uuid)
    }
    ringTimers[uuid] = work
    queue.asyncAfter(deadline: .now() + .milliseconds(durationMs), execute: work)
  }

  private func endUnanswered(_ uuid: UUID) {
    ringTimers[uuid] = nil
    guard let call = calls[uuid], !call.answered else {
      return
    }
    calls.removeValue(forKey: uuid)
    if pendingNotify?.uuid == uuid {
      pendingNotify = nil
    }
    callProvider?.end(uuid: uuid, reason: .unanswered)
    emit(Self.timeoutEvent, body: eventBody(call, uuid: uuid, accepted: false))
  }

  private func scheduleAnswerHangup() {
    cancelAnswerHangup()
    let work = DispatchWorkItem { [weak self] in
      self?.endAll()
    }
    answerHangup = work
    queue.asyncAfter(deadline: .now() + 45, execute: work)
  }

  private func cancelAnswerHangup() {
    answerHangup?.cancel()
    answerHangup = nil
  }

  private func hasUnansweredCall() -> Bool {
    if calls.values.contains(where: { !$0.answered }) {
      return true
    }
    return CXCallObserver().calls.contains { call in
      !call.hasEnded && !call.isOutgoing && !call.hasConnected
    }
  }

  private func endAll() {
    cancelAnswerHangup()
    for timer in ringTimers.values {
      timer.cancel()
    }
    ringTimers.removeAll()
    pendingNotify = nil
    let ending = Array(calls.keys)
    calls.removeAll()
    for uuid in ending {
      callProvider?.end(uuid: uuid, reason: .remoteEnded)
    }
    for call in CXCallObserver().calls where !call.hasEnded {
      callProvider?.end(uuid: call.uuid, reason: .remoteEnded)
    }
  }

  private func eventBody(_ call: LiveCall, uuid: UUID, accepted: Bool) -> [String: Any] {
    [
      "id": uuid.uuidString.lowercased(),
      "nameCaller": call.name,
      "handle": call.handle,
      "appName": "Fluxer",
      "type": 0,
      "isAccepted": accepted,
      "extra": [
        "channelId": call.channelId,
        "messageId": call.messageId,
      ],
    ]
  }

  private func publish(_ event: String, uuid: UUID, body: [String: Any]) {
    pendingNotify = (event, body, uuid)
    emit(event, body: body)
    for delay in [1.0, 3.0] {
      queue.asyncAfter(deadline: .now() + delay) { [weak self] in
        self?.retryNotify()
      }
    }
  }

  private func retryNotify() {
    guard let pending = pendingNotify, calls[pending.uuid] != nil else {
      return
    }
    emit(pending.event, body: pending.body)
  }

  private func reemitAudioSessionIfActive() {
    guard callAudioActive else {
      return
    }
    emit(Self.audioSessionEvent, body: ["isActive": true])
  }

  private func emit(_ event: String, body: [String: Any]) {
    DispatchQueue.main.async {
      SwiftFlutterCallkitIncomingPlugin.sharedInstance?.sendEventCustom(
        event,
        body: body as NSDictionary
      )
    }
  }

  private func onQueue(_ work: @escaping () -> Void) {
    if DispatchQueue.getSpecific(key: Self.queueSpecific) != nil {
      work()
    } else {
      queue.async(execute: work)
    }
  }

  private func clearCallMessage(messageId: String) {
    guard !messageId.isEmpty else {
      return
    }
    let clear = {
      let center = UNUserNotificationCenter.current()
      center.removePendingNotificationRequests(withIdentifiers: [messageId])
      center.removeDeliveredNotifications(withIdentifiers: [messageId])
      center.getDeliveredNotifications { notifications in
        let identifiers = notifications.compactMap { notification -> String? in
          let id = PushNotificationPayload.resolveMessageId(
            from: notification.request.content.userInfo
          )
          return id == messageId ? notification.request.identifier : nil
        }
        guard !identifiers.isEmpty else {
          return
        }
        center.removeDeliveredNotifications(withIdentifiers: identifiers)
      }
    }
    DispatchQueue.main.async(execute: clear)
    for delay in [1.0, 3.0, 10.0] {
      DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: clear)
    }
  }

  private func keepAlive() {
    DispatchQueue.main.async { [weak self] in
      self?.beginKeepAlive()
    }
  }

  private func beginKeepAlive() {
    endKeepAlive()
    backgroundGeneration += 1
    let generation = backgroundGeneration
    backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "CallKit") { [weak self] in
      self?.endKeepAlive()
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
      guard let self, self.backgroundGeneration == generation else {
        return
      }
      self.endKeepAlive()
    }
  }

  private func endKeepAlive() {
    guard backgroundTask != .invalid else {
      return
    }
    UIApplication.shared.endBackgroundTask(backgroundTask)
    backgroundTask = .invalid
  }

  private func bringAppForward() {
    DispatchQueue.main.async {
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
  }

  private func isAlreadyReported(_ error: Error) -> Bool {
    let nsError = error as NSError
    return nsError.domain == CXErrorDomainIncomingCall
      && nsError.code == CXErrorCodeIncomingCallError.callUUIDAlreadyExists.rawValue
  }

  private static let incomingEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_INCOMING"
  private static let acceptEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_ACCEPT"
  private static let declineEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_DECLINE"
  private static let endedEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_ENDED"
  private static let timeoutEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_TIMEOUT"
  private static let muteEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_MUTE"
  private static let audioSessionEvent =
    "com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_AUDIO_SESSION"
}
