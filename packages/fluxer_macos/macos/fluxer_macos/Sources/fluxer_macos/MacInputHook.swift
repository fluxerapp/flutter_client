import AppKit
import Foundation

final class MacInputHook: MacInputHookHostApi {
  private let flutterApi: MacInputHookFlutterApi
  private let queue = DispatchQueue(label: "fluxer_macos.input_hook_control")
  private var worker: InputTapWorker?
  private var filter = InputFilter()
  private var observing = false

  init(flutterApi: MacInputHookFlutterApi) {
    self.flutterApi = flutterApi
  }

  func start(completion: @escaping (Result<MacInputHookStartResult, Error>) -> Void) {
    queue.async {
      let result = self.startWorker()
      DispatchQueue.main.async {
        if result == .ok {
          self.observeSession()
        }
        completion(.success(result))
      }
    }
  }

  func stop(completion: @escaping (Result<Void, Error>) -> Void) {
    queue.async {
      self.stopWorker()
      DispatchQueue.main.async {
        self.unobserveSession()
        completion(.success(()))
      }
    }
  }

  func setFilter(keycodes: [Int64], buttons: [Int64], modifiers: Bool) throws {
    let next = InputFilter(
      keycodes: Set(keycodes),
      buttons: Set(buttons),
      modifiers: modifiers
    )
    queue.async {
      self.filter = next
      self.worker?.setFilter(next)
    }
  }

  func shutDown() {
    unobserveSession()
    queue.async {
      self.stopWorker()
    }
  }

  private func startWorker() -> MacInputHookStartResult {
    if worker != nil {
      return .ok
    }
    guard InputMonitoringAccess.status() == .granted else {
      return .permission
    }
    let created = InputTapWorker(
      filter: filter,
      onEvent: { [weak self] event in
        DispatchQueue.main.async {
          self?.flutterApi.onEvent(event: event) { _ in }
        }
      },
      onReleaseAll: { [weak self] in
        DispatchQueue.main.async {
          self?.flutterApi.onReleaseAll { _ in }
        }
      }
    )
    guard created.start() else {
      return .startFailed
    }
    worker = created
    return .ok
  }

  private func stopWorker() {
    worker?.stop()
    worker = nil
  }

  private func observeSession() {
    guard !observing else {
      return
    }
    observing = true
    NSWorkspace.shared.notificationCenter.addObserver(
      self,
      selector: #selector(releaseHeldInput(_:)),
      name: NSWorkspace.willSleepNotification,
      object: nil
    )
    DistributedNotificationCenter.default().addObserver(
      self,
      selector: #selector(releaseHeldInput(_:)),
      name: Notification.Name("com.apple.screenIsLocked"),
      object: nil
    )
  }

  private func unobserveSession() {
    guard observing else {
      return
    }
    observing = false
    NSWorkspace.shared.notificationCenter.removeObserver(self)
    DistributedNotificationCenter.default().removeObserver(self)
  }

  @objc private func releaseHeldInput(_ notification: Notification) {
    queue.async {
      self.worker?.releaseAll()
    }
  }
}
