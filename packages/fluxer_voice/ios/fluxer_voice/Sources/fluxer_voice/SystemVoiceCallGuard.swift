import CallKit
import Flutter

final class SystemVoiceCallGuard: SystemVoiceCallGuardHostApi {
  private let observer = CXCallObserver()

  func isExternalCallActive(
    fluxerOwnsVoice: Bool,
    completion: @escaping (Result<Bool, Error>) -> Void
  ) {
    if fluxerOwnsVoice {
      completion(.success(false))
      return
    }
    completion(.success(observer.calls.contains { !$0.hasEnded }))
  }
}
