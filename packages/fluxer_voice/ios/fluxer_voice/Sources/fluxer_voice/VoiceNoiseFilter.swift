import Foundation
import WebRTC
import flutter_webrtc

#if canImport(fluxer_noise_filter)
  import fluxer_noise_filter
#endif

private final class NoiseFilterProcessor: NSObject, ExternalAudioProcessingDelegate {
  func audioProcessingInitialize(withSampleRate sampleRateHz: Int, channels: Int) {}

  func audioProcessingProcess(_ audioBuffer: RTCAudioBuffer) {
    let frames = audioBuffer.frames
    let channels = audioBuffer.channels
    guard channels > 0 else {
      return
    }
    let source = audioBuffer.rawBuffer(forChannel: 0)
    guard fnf_process(source, frames) != 0 else {
      return
    }
    for channel in 1..<max(channels, 1) {
      audioBuffer.rawBuffer(forChannel: channel).update(from: source, count: frames)
    }
  }

  func audioProcessingRelease() {}
}

final class VoiceNoiseFilter: VoiceNoiseFilterHostApi {
  private static let processor = NoiseFilterProcessor()
  private static var attached = false

  func attach() throws -> Bool {
    if !Self.attached {
      AudioManager.sharedInstance().capturePostProcessingAdapter.addProcessing(Self.processor)
      Self.attached = true
    }
    return true
  }

  func setBackend(backend: NativeNoiseFilterBackend) throws -> Bool {
    fnf_set_backend(Int32(backend.rawValue)) != 0
  }

  func status() throws -> NativeNoiseFilterStatus {
    var stats = fnf_stats()
    fnf_get_stats(&stats)
    return NativeNoiseFilterStatus(
      attached: Self.attached,
      backend: NativeNoiseFilterBackend(rawValue: Int(stats.backend)) ?? .none,
      sampleRate: Int64(stats.sample_rate),
      frames: stats.frames,
      bypassedFrames: stats.bypassed_frames,
      recoveredFrames: stats.recovered_frames,
      averageMicros: Double(stats.average_ns) / 1000,
      maxMicros: Double(stats.max_ns) / 1000
    )
  }
}
