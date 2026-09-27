import AVFAudio
import CallKit
import WebRTC

enum CallAudioSession {
  static func activate(_ audioSession: AVAudioSession) {
    let rtc = RTCAudioSession.sharedInstance()
    rtc.useManualAudio = true
    rtc.audioSessionDidActivate(audioSession)
    rtc.isAudioEnabled = true
  }

  static func deactivate(_ audioSession: AVAudioSession) {
    let rtc = RTCAudioSession.sharedInstance()
    rtc.audioSessionDidDeactivate(audioSession)
    rtc.isAudioEnabled = false
    if CXCallObserver().calls.isEmpty {
      rtc.useManualAudio = false
    }
  }

  static func prepareForAnswer() {
    let session = AVAudioSession.sharedInstance()
    try? session.setCategory(
      .playAndRecord,
      mode: .videoChat,
      options: [.allowBluetoothHFP, .allowBluetoothA2DP, .defaultToSpeaker]
    )
  }
}

final class CallProvider {
  let provider: CXProvider

  init(delegate: CXProviderDelegate, queue: DispatchQueue) {
    let config = CXProviderConfiguration()
    config.supportsVideo = false
    config.maximumCallGroups = 1
    config.maximumCallsPerCallGroup = 2
    config.supportedHandleTypes = [.generic]
    config.ringtoneSound = "incoming_ring.caf"
    config.includesCallsInRecents = true
    let provider = CXProvider(configuration: config)
    provider.setDelegate(delegate, queue: queue)
    self.provider = provider
  }

  func reportIncoming(
    uuid: UUID,
    update: CXCallUpdate,
    completion: @escaping (Error?) -> Void
  ) {
    provider.reportNewIncomingCall(with: uuid, update: update, completion: completion)
  }

  func end(uuid: UUID, reason: CXCallEndedReason) {
    provider.reportCall(with: uuid, endedAt: Date(), reason: reason)
  }

  static func update(name: String, handle: String) -> CXCallUpdate {
    let update = CXCallUpdate()
    update.localizedCallerName = name
    update.remoteHandle = CXHandle(type: .generic, value: handle)
    update.hasVideo = false
    update.supportsHolding = false
    update.supportsGrouping = false
    update.supportsUngrouping = false
    update.supportsDTMF = false
    return update
  }
}
