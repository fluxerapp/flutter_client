import AVFAudio
import CallKit
import Flutter
import PushKit
import UIKit
import UserNotifications
import flutter_callkit_incoming

final class IncomingCallReporter: NSObject, CXProviderDelegate, CXCallObserverDelegate {
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
  private var pendingTerminal: (event: String, body: [String: Any])?
  private var listenerReady = false
  private var notifyAttempt = 0
  private var notifyRetry: DispatchWorkItem?
  private var terminalRetry: DispatchWorkItem?
  private var callAudioActive = false
  private let backgroundLock = NSLock()
  private var backgroundTask = UIBackgroundTaskIdentifier.invalid
  private var backgroundGeneration = 0
  private var earlyActions: [UUID: EarlyCallAction] = [:]
  private var placeholderUUIDs: Set<UUID> = []
  private var heldCalls: Set<UUID> = []
  private var muteEchoes: [UUID: Bool] = [:]
  private var callController: CXCallController?
  private var callObserver: CXCallObserver?

  private enum EarlyCallAction {
    case answered
    case ended
  }

  private struct LiveCall {
    let channelId: String
    let messageId: String
    let name: String
    let handle: String
    let targetUserId: String
    let guildId: String
    var answered = false
    var published = false
    var outgoing = false
    var connected = false
  }

  func start() {
    if callProvider != nil {
      return
    }
    let provider = CallProvider(delegate: self, queue: queue)
    callProvider = provider
    callController = CXCallController(queue: queue)
    let observer = CXCallObserver()
    observer.setDelegate(self, queue: queue)
    callObserver = observer
    for call in observer.calls where !call.hasEnded {
      provider.end(uuid: call.uuid, reason: .failed)
    }
  }

  func hasLiveCalls() -> Bool {
    performSync { !calls.isEmpty }
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
        let id = (call.arguments as? [String: Any])?["id"] as? String
        self.queue.async {
          self.cancelAnswerHangup()
          self.endKeepAlive()
          self.markOutgoingConnected(id: id)
          self.reemitAudioSessionIfActive()
        }
        result(nil)
      case "acceptAck":
        self.queue.async {
          self.extendAnswerHangup()
        }
        result(nil)
      case "startOutgoing":
        let args = call.arguments as? [String: Any]
        self.queue.async {
          self.startOutgoing(args: args) { started in
            DispatchQueue.main.async {
              result(started)
            }
          }
        }
      case "mute":
        let args = call.arguments as? [String: Any]
        let id = args?["id"] as? String
        let muted = args?["muted"] as? Bool ?? false
        self.queue.async {
          self.requestMute(id: id, muted: muted)
        }
        result(nil)
      case "endAll":
        self.queue.async { self.endAll() }
        result(nil)
      case "end":
        let id = (call.arguments as? [String: Any])?["id"] as? String
        self.queue.async { self.end(id: id) }
        result(nil)
      case "hasUnanswered":
        self.queue.async {
          let ringing = self.hasUnansweredCall()
          DispatchQueue.main.async {
            result(ringing)
          }
        }
      case "currentCalls":
        self.queue.async {
          let payload = self.currentCallsPayload()
          DispatchQueue.main.async {
            result(payload)
          }
        }
      case "listening":
        self.queue.async {
          self.markListenerReady()
          DispatchQueue.main.async {
            result(nil)
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
    let uuid = Self.provisionalCallUUID(encoded: encoded)
    onQueue {
      self.placeholderUUIDs.insert(uuid)
    }
    let pushDone = PushCompletionGate(completion: completion)
    reportPlaceholderIncoming(uuid: uuid) { [weak self] error in
      pushDone.finish()
      guard let self else {
        return
      }
      self.onQueue {
        self.finishPlaceholderReport(uuid: uuid, error: error, encoded: encoded)
      }
    }
    pushDone.armFallback(after: 5, on: queue)
  }

  func providerDidReset(_ provider: CXProvider) {
    onQueue {
      self.earlyActions.removeAll()
      self.endKeepAlive()
      self.answerHangup?.cancel()
      self.answerHangup = nil
      for timer in self.ringTimers.values {
        timer.cancel()
      }
      self.ringTimers.removeAll()
      self.calls.removeAll()
      self.pendingNotify = nil
      self.cancelNotifyRetry()
      self.terminalRetry?.cancel()
      self.terminalRetry = nil
      self.callAudioActive = false
      self.placeholderUUIDs.removeAll()
      self.heldCalls.removeAll()
      self.muteEchoes.removeAll()
      CallAudioSession.reset()
      self.emit(Self.customEvent, body: ["kind": "providerReset"])
    }
  }

  func provider(_ provider: CXProvider, perform action: CXStartCallAction) {
    let uuid = action.callUUID
    onQueue {
      guard self.calls[uuid]?.outgoing == true else {
        action.fail()
        return
      }
      CallAudioSession.prepareForOutgoing()
      self.callProvider?.reportOutgoingConnecting(uuid: uuid)
      action.fulfill()
    }
  }

  func provider(_ provider: CXProvider, perform action: CXSetHeldCallAction) {
    let uuid = action.callUUID
    let onHold = action.isOnHold
    action.fulfill()
    onQueue {
      guard self.calls[uuid] != nil else {
        return
      }
      if onHold {
        self.heldCalls.insert(uuid)
      } else {
        self.heldCalls.remove(uuid)
      }
      self.emit(Self.holdEvent, body: [
        "id": uuid.uuidString.lowercased(),
        "isOnHold": onHold,
      ])
    }
  }

  func callObserver(_ callObserver: CXCallObserver, callChanged call: CXCall) {
    onQueue {
      self.resumeHeldCallsIfIdle(changed: call)
    }
  }

  func provider(_ provider: CXProvider, perform action: CXAnswerCallAction) {
    CallAudioSession.prepareForAnswer()
    action.fulfill()
    let uuid = action.callUUID
    onQueue {
      self.didAnswer(uuid)
    }
    bringAppForward()
  }

  func provider(_ provider: CXProvider, perform action: CXEndCallAction) {
    action.fulfill()
    let uuid = action.callUUID
    onQueue {
      self.didEnd(uuid)
    }
    keepAlive(for: 3)
  }

  func provider(_ provider: CXProvider, perform action: CXSetMutedCallAction) {
    action.fulfill()
    let uuid = action.callUUID
    let muted = action.isMuted
    onQueue {
      if let echo = self.muteEchoes.removeValue(forKey: uuid), echo == muted {
        return
      }
      self.emit(Self.muteEvent, body: [
        "id": uuid.uuidString.lowercased(),
        "isMuted": muted,
      ])
    }
  }

  func provider(_ provider: CXProvider, didActivate audioSession: AVAudioSession) {
    CallAudioSession.activate(audioSession)
    onQueue {
      self.callAudioActive = true
      self.emit(Self.audioSessionEvent, body: ["isActive": true])
    }
  }

  func provider(_ provider: CXProvider, didDeactivate audioSession: AVAudioSession) {
    CallAudioSession.deactivate(audioSession, hasLiveCalls: !calls.isEmpty)
    onQueue {
      self.callAudioActive = false
      self.emit(Self.audioSessionEvent, body: ["isActive": false])
    }
  }

  private func didAnswer(_ uuid: UUID) {
    if earlyActions[uuid] == .ended {
      return
    }
    ringTimers[uuid]?.cancel()
    ringTimers[uuid] = nil
    keepAlive(for: 30)
    guard var call = calls[uuid] else {
      earlyActions[uuid] = .answered
      return
    }
    call.answered = true
    calls[uuid] = call
    scheduleAnswerHangup()
    publish(Self.acceptEvent, uuid: uuid, body: eventBody(call, uuid: uuid, accepted: true))
  }

  private func didEnd(_ uuid: UUID) {
    let call = calls.removeValue(forKey: uuid)
    placeholderUUIDs.remove(uuid)
    heldCalls.remove(uuid)
    muteEchoes.removeValue(forKey: uuid)
    if call == nil {
      earlyActions[uuid] = .ended
    } else {
      earlyActions.removeValue(forKey: uuid)
    }
    ringTimers[uuid]?.cancel()
    ringTimers[uuid] = nil
    if call?.answered == true {
      cancelAnswerHangup()
      endKeepAlive()
    }
    if pendingNotify?.uuid == uuid {
      pendingNotify = nil
      cancelNotifyRetry()
    }
    guard let call else {
      return
    }
    let event = call.answered ? Self.endedEvent : Self.declineEvent
    emitTerminal(event, body: eventBody(call, uuid: uuid, accepted: call.answered))
  }

  private func reportPlaceholderIncoming(
    uuid: UUID,
    reportCompletion: @escaping (Error?) -> Void
  ) {
    start()
    guard let callProvider else {
      reportCompletion(nil)
      return
    }
    let update = CallProvider.update(
      name: CallRingResolver.fallbackHandle,
      handle: CallRingResolver.fallbackHandle
    )
    callProvider.reportIncoming(uuid: uuid, update: update, completion: reportCompletion)
  }

  private func finishPlaceholderReport(uuid: UUID, error: Error?, encoded: String?) {
    if let error {
      if isAlreadyReported(error) {
        applyVoipPayload(uuid: uuid, encoded: encoded)
        return
      }
      FluxerNativeMeasure.reportHandled(
        error,
        source: "callkit.incoming_call_reporter",
        context: "report failed"
      )
      return
    }
    NSLog("[CallKit] voip call reported")
    applyVoipPayload(uuid: uuid, encoded: encoded)
  }

  private func applyVoipPayload(uuid: UUID, encoded: String?) {
    switch decide(encoded: encoded) {
    case .ring(let fields):
      adoptRing(uuid: uuid, fields: fields)
    case .reject:
      endRejectedPlaceholder(uuid)
    }
  }

  private func adoptRing(uuid: UUID, fields: CallRingFields) {
    if let existing = liveRingUUID(forMessageId: fields.messageId), existing != uuid {
      let early = earlyActions.removeValue(forKey: uuid)
      endPlaceholder(uuid, reason: .failed)
      if early == .answered, earlyActions[existing] != .ended {
        earlyActions[existing] = .answered
      }
      mergeRing(into: existing, fields: fields)
      return
    }
    mergeRing(into: uuid, fields: fields)
  }

  private func mergeRing(into uuid: UUID, fields: CallRingFields) {
    let early = earlyActions.removeValue(forKey: uuid)
    if early == .ended {
      let call = liveCall(uuidFields: fields)
      emitTerminal(
        Self.declineEvent,
        body: eventBody(call, uuid: uuid, accepted: false)
      )
      return
    }
    let answeredEarly = early == .answered
    let alreadyAnswered = calls[uuid]?.answered == true
    dropOtherRings(except: uuid)
    calls[uuid] = liveCall(
      uuidFields: fields,
      answered: alreadyAnswered || answeredEarly,
      published: calls[uuid]?.published ?? false
    )
    let update = CallProvider.update(name: fields.callerName, handle: fields.handle)
    callProvider?.updateIncoming(uuid: uuid, update: update)
    publishRing(uuid: uuid, fields: fields)
    if answeredEarly, !alreadyAnswered, let call = calls[uuid] {
      scheduleAnswerHangup()
      publish(Self.acceptEvent, uuid: uuid, body: eventBody(call, uuid: uuid, accepted: true))
    }
  }

  private func endRejectedPlaceholder(_ uuid: UUID) {
    let early = earlyActions.removeValue(forKey: uuid)
    if early == .ended || calls[uuid]?.answered == true || calls[uuid]?.published == true {
      return
    }
    ringTimers[uuid]?.cancel()
    ringTimers[uuid] = nil
    calls.removeValue(forKey: uuid)
    callProvider?.end(uuid: uuid, reason: .failed)
    if early == .answered {
      cancelAnswerHangup()
      endKeepAlive()
    }
  }

  private func endPlaceholder(_ uuid: UUID, reason: CXCallEndedReason) {
    ringTimers[uuid]?.cancel()
    ringTimers[uuid] = nil
    calls.removeValue(forKey: uuid)
    callProvider?.end(uuid: uuid, reason: reason)
  }

  private func liveCall(
    uuidFields fields: CallRingFields,
    answered: Bool = false,
    published: Bool = false
  ) -> LiveCall {
    LiveCall(
      channelId: fields.channelId,
      messageId: fields.messageId,
      name: fields.callerName,
      handle: fields.handle,
      targetUserId: fields.targetUserId ?? "",
      guildId: fields.guildId ?? "",
      answered: answered,
      published: published
    )
  }

  private func liveRingUUID(forMessageId messageId: String) -> UUID? {
    for (uuid, call) in calls where !call.answered && call.messageId == messageId {
      return uuid
    }
    return nil
  }

  private static func provisionalCallUUID(encoded: String?) -> UUID {
    guard let encoded, !encoded.isEmpty else {
      return UUID()
    }
    return CallRingUuid.v5(name: encoded)
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
    return CallRingResolver.resolve(
      plaintext: decrypted.plaintext,
      accountUserId: decrypted.userId,
      nowMs: Int64(Date().timeIntervalSince1970 * 1000)
    )
  }

  private func dropOtherRings(except uuid: UUID) {
    let others = calls.keys.filter { $0 != uuid && calls[$0]?.answered == false }
    for other in others {
      ringTimers[other]?.cancel()
      ringTimers[other] = nil
      calls.removeValue(forKey: other)
      if pendingNotify?.uuid == other {
        pendingNotify = nil
        cancelNotifyRetry()
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
      cancelNotifyRetry()
    }
    callProvider?.end(uuid: uuid, reason: .unanswered)
    emitTerminal(Self.timeoutEvent, body: eventBody(call, uuid: uuid, accepted: false))
  }

  private func scheduleAnswerHangup(after seconds: Double = 45) {
    cancelAnswerHangup()
    let work = DispatchWorkItem { [weak self] in
      self?.endAll()
    }
    answerHangup = work
    queue.asyncAfter(deadline: .now() + seconds, execute: work)
  }

  private func extendAnswerHangup() {
    guard answerHangup != nil else {
      return
    }
    scheduleAnswerHangup(after: 120)
  }

  private func startOutgoing(args: [String: Any]?, completion: @escaping (Bool) -> Void) {
    guard let args,
      let id = args["id"] as? String,
      let uuid = UUID(uuidString: id),
      let channelId = args["channelId"] as? String,
      !channelId.isEmpty
    else {
      completion(false)
      return
    }
    start()
    guard let callController else {
      completion(false)
      return
    }
    if calls[uuid]?.outgoing == true {
      completion(true)
      return
    }
    if calls[uuid] != nil || calls.values.contains(where: { $0.channelId == channelId }) {
      completion(false)
      return
    }
    let rawName = args["name"] as? String ?? ""
    let name = rawName.isEmpty ? CallRingResolver.fallbackHandle : rawName
    let rawHandle = args["handle"] as? String ?? ""
    let handle = rawHandle.isEmpty ? name : rawHandle
    calls[uuid] = LiveCall(
      channelId: channelId,
      messageId: args["messageId"] as? String ?? "",
      name: name,
      handle: handle,
      targetUserId: "",
      guildId: args["guildId"] as? String ?? "",
      answered: true,
      published: true,
      outgoing: true,
      connected: false
    )
    let action = CXStartCallAction(call: uuid, handle: CXHandle(type: .generic, value: handle))
    action.isVideo = false
    action.contactIdentifier = name
    callController.request(CXTransaction(action: action)) { [weak self] error in
      guard let self else {
        completion(false)
        return
      }
      self.onQueue {
        if let error {
          NSLog("[CallKit] outgoing call request failed: \(error.localizedDescription)")
          self.calls.removeValue(forKey: uuid)
          completion(false)
          return
        }
        guard self.calls[uuid] != nil else {
          completion(false)
          return
        }
        self.callProvider?.updateIncoming(
          uuid: uuid,
          update: CallProvider.update(name: name, handle: handle)
        )
        completion(true)
      }
    }
  }

  private func markOutgoingConnected(id: String?) {
    guard let id, let uuid = UUID(uuidString: id), var call = calls[uuid],
      call.outgoing, !call.connected
    else {
      return
    }
    call.connected = true
    calls[uuid] = call
    callProvider?.reportOutgoingConnected(uuid: uuid)
  }

  private func requestMute(id: String?, muted: Bool) {
    guard let id, let uuid = UUID(uuidString: id), calls[uuid] != nil,
      let callController
    else {
      return
    }
    muteEchoes[uuid] = muted
    let action = CXSetMutedCallAction(call: uuid, muted: muted)
    callController.request(CXTransaction(action: action)) { [weak self] error in
      guard let self else {
        return
      }
      if error != nil {
        self.onQueue { self.clearMuteEcho(uuid: uuid, muted: muted) }
        return
      }
      self.queue.asyncAfter(deadline: .now() + 1) { [weak self] in
        self?.clearMuteEcho(uuid: uuid, muted: muted)
      }
    }
  }

  private func clearMuteEcho(uuid: UUID, muted: Bool) {
    if muteEchoes[uuid] == muted {
      muteEchoes.removeValue(forKey: uuid)
    }
  }

  private func resumeHeldCallsIfIdle(changed: CXCall) {
    guard changed.hasEnded, !heldCalls.isEmpty, let callObserver, let callController else {
      return
    }
    let otherLive = callObserver.calls.contains { call in
      !call.hasEnded && calls[call.uuid] == nil
    }
    guard !otherLive else {
      return
    }
    for uuid in heldCalls where calls[uuid] != nil {
      let action = CXSetHeldCallAction(call: uuid, onHold: false)
      callController.request(CXTransaction(action: action)) { error in
        if let error {
          NSLog("[CallKit] resume held call failed: \(error.localizedDescription)")
        }
      }
    }
  }

  private func cancelAnswerHangup() {
    answerHangup?.cancel()
    answerHangup = nil
  }

  private func hasUnansweredCall() -> Bool {
    if calls.values.contains(where: { !$0.answered }) {
      return true
    }
    let observed = callObserver?.calls ?? CXCallObserver().calls
    return observed.contains { call in
      placeholderUUIDs.contains(call.uuid) && !call.hasEnded && !call.isOutgoing
        && !call.hasConnected
    }
  }

  private func end(id: String?) {
    guard let id, let uuid = UUID(uuidString: id) else {
      return
    }
    let call = calls.removeValue(forKey: uuid)
    placeholderUUIDs.remove(uuid)
    heldCalls.remove(uuid)
    muteEchoes.removeValue(forKey: uuid)
    ringTimers[uuid]?.cancel()
    ringTimers[uuid] = nil
    if call?.answered == true {
      cancelAnswerHangup()
      endKeepAlive()
    }
    if pendingNotify?.uuid == uuid {
      pendingNotify = nil
      cancelNotifyRetry()
    }
    callProvider?.end(uuid: uuid, reason: .remoteEnded)
  }

  private func endAll() {
    cancelAnswerHangup()
    endKeepAlive()
    for timer in ringTimers.values {
      timer.cancel()
    }
    ringTimers.removeAll()
    pendingNotify = nil
    cancelNotifyRetry()
    let ending = Array(calls.keys)
    calls.removeAll()
    placeholderUUIDs.removeAll()
    heldCalls.removeAll()
    muteEchoes.removeAll()
    for uuid in ending {
      callProvider?.end(uuid: uuid, reason: .remoteEnded)
    }
    for call in CXCallObserver().calls where !call.hasEnded {
      callProvider?.end(uuid: call.uuid, reason: .remoteEnded)
    }
  }

  private func extraFields(_ call: LiveCall) -> [String: Any] {
    var extra: [String: Any] = [
      "channelId": call.channelId,
      "messageId": call.messageId,
    ]
    if call.outgoing {
      extra["activeVoice"] = true
    }
    if !call.targetUserId.isEmpty {
      extra["targetUserId"] = call.targetUserId
    }
    if !call.guildId.isEmpty {
      extra["guildId"] = call.guildId
    }
    return extra
  }

  private func eventBody(_ call: LiveCall, uuid: UUID, accepted: Bool) -> [String: Any] {
    [
      "id": uuid.uuidString.lowercased(),
      "nameCaller": call.name,
      "handle": call.handle,
      "appName": "Fluxer",
      "type": 0,
      "isAccepted": accepted,
      "extra": extraFields(call),
    ]
  }

  private func currentCallsPayload() -> [[String: Any]] {
    var payload: [[String: Any]] = []
    payload.reserveCapacity(calls.count)
    for (uuid, call) in calls {
      payload.append(eventBody(call, uuid: uuid, accepted: call.answered))
    }
    return payload
  }

  private func publish(_ event: String, uuid: UUID, body: [String: Any]) {
    pendingNotify = (event, body, uuid)
    notifyAttempt = 0
    emit(event, body: body)
    scheduleNotifyRetry()
  }

  private func scheduleNotifyRetry() {
    cancelNotifyRetry()
    guard !listenerReady, pendingNotify != nil else {
      return
    }
    guard notifyAttempt < Self.notifyRetryDelays.count else {
      return
    }
    let delay = Self.notifyRetryDelays[notifyAttempt]
    notifyAttempt += 1
    let work = DispatchWorkItem { [weak self] in
      self?.retryNotify()
    }
    notifyRetry = work
    queue.asyncAfter(deadline: .now() + delay, execute: work)
  }

  private func retryNotify() {
    notifyRetry = nil
    guard !listenerReady, let pending = pendingNotify, calls[pending.uuid] != nil else {
      return
    }
    emit(pending.event, body: pending.body)
    scheduleNotifyRetry()
  }

  private func cancelNotifyRetry() {
    notifyRetry?.cancel()
    notifyRetry = nil
  }

  private func markListenerReady() {
    listenerReady = true
    cancelNotifyRetry()
    if let pending = pendingNotify, calls[pending.uuid] != nil {
      emit(pending.event, body: pending.body)
    }
    pendingNotify = nil
    guard let terminal = pendingTerminal else {
      return
    }
    emit(terminal.event, body: terminal.body)
    scheduleTerminalRetry()
  }

  private func emitTerminal(_ event: String, body: [String: Any]) {
    pendingTerminal = (event, body)
    emit(event, body: body)
    guard listenerReady else {
      return
    }
    scheduleTerminalRetry()
  }

  private func scheduleTerminalRetry() {
    terminalRetry?.cancel()
    let work = DispatchWorkItem { [weak self] in
      guard let self, let pending = self.pendingTerminal else {
        return
      }
      self.pendingTerminal = nil
      self.terminalRetry = nil
      self.emit(pending.event, body: pending.body)
    }
    terminalRetry = work
    queue.asyncAfter(deadline: .now() + 1, execute: work)
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

  func performSync<T>(_ work: () -> T) -> T {
    if DispatchQueue.getSpecific(key: Self.queueSpecific) != nil {
      return work()
    }
    return queue.sync(execute: work)
  }

  private func keepAlive(for seconds: TimeInterval) {
    DispatchQueue.main.async { [weak self] in
      self?.startKeepAlive(for: seconds)
    }
  }

  private func startKeepAlive(for seconds: TimeInterval) {
    let task = UIApplication.shared.beginBackgroundTask(withName: "CallKit") { [weak self] in
      self?.endKeepAliveNow()
    }
    backgroundLock.lock()
    let previous = backgroundTask
    backgroundTask = task
    backgroundGeneration += 1
    let generation = backgroundGeneration
    backgroundLock.unlock()
    if previous != .invalid {
      UIApplication.shared.endBackgroundTask(previous)
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [weak self] in
      guard let self else {
        return
      }
      self.backgroundLock.lock()
      let current = self.backgroundGeneration
      self.backgroundLock.unlock()
      guard current == generation else {
        return
      }
      self.endKeepAliveNow()
    }
  }

  private func endKeepAlive() {
    DispatchQueue.main.async { [weak self] in
      self?.endKeepAliveNow()
    }
  }

  private func endKeepAliveNow() {
    backgroundLock.lock()
    let task = backgroundTask
    backgroundTask = .invalid
    backgroundGeneration += 1
    backgroundLock.unlock()
    guard task != .invalid else {
      return
    }
    UIApplication.shared.endBackgroundTask(task)
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

  private static let notifyRetryDelays: [Double] = [1, 2, 3, 5, 8, 13, 21]
  private static let incomingEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_INCOMING"
  private static let acceptEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_ACCEPT"
  private static let declineEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_DECLINE"
  private static let endedEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_ENDED"
  private static let timeoutEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_TIMEOUT"
  private static let muteEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_MUTE"
  private static let holdEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_HOLD"
  private static let customEvent = "com.hiennv.flutter_callkit_incoming.ACTION_CALL_CUSTOM"
  private static let audioSessionEvent =
    "com.hiennv.flutter_callkit_incoming.ACTION_CALL_TOGGLE_AUDIO_SESSION"
}

private final class PushCompletionGate {
  private let lock = NSLock()
  private var finished = false
  private let completion: () -> Void
  private var fallback: DispatchWorkItem?

  init(completion: @escaping () -> Void) {
    self.completion = completion
  }

  func finish() {
    lock.lock()
    guard !finished else {
      lock.unlock()
      return
    }
    finished = true
    fallback?.cancel()
    lock.unlock()
    completion()
  }

  func armFallback(after seconds: Double, on queue: DispatchQueue) {
    let work = DispatchWorkItem { [weak self] in
      self?.finish()
    }
    lock.lock()
    if finished {
      lock.unlock()
      return
    }
    fallback = work
    lock.unlock()
    queue.asyncAfter(deadline: .now() + seconds, execute: work)
  }
}
