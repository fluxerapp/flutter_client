import AVKit
import Flutter
import UIKit

final class VoicePipEventStream: VoicePipEventsStreamHandler {
  private var sink: PigeonEventSink<NativePipEvent>?

  override func onListen(withArguments arguments: Any?, sink: PigeonEventSink<NativePipEvent>) {
    self.sink = sink
  }

  override func onCancel(withArguments arguments: Any?) {
    sink = nil
  }

  func send(_ event: NativePipEvent) {
    sink?.success(event)
  }
}

private final class VoicePipContentViewController: AVPictureInPictureVideoCallViewController {
  let videoView = SampleBufferVideoView(frame: .zero)
  var onLayout: ((CGSize) -> Void)?
  private var lastSize: CGSize = .zero

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    videoView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(videoView)
    NSLayoutConstraint.activate([
      videoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      videoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      videoView.topAnchor.constraint(equalTo: view.topAnchor),
      videoView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let size = view.bounds.size
    guard size != lastSize else {
      return
    }
    lastSize = size
    onLayout?(size)
  }
}

final class VoicePipController: NSObject, VoicePipHostApi, AVPictureInPictureControllerDelegate {
  let events = VoicePipEventStream()

  private let hostView: () -> UIView?
  private var pipController: AVPictureInPictureController?
  private var content: VoicePipContentViewController?
  private var sourceView: UIView?
  private var source: PipVideoSource?
  private var boundDescriptor: PipVideoSourceDescriptor?
  private var config: NativePipConfig?
  private var active = false
  private var observers: [NSObjectProtocol] = []

  init(hostView: @escaping () -> UIView?) {
    self.hostView = hostView
    super.init()
    WebRtcPipVideoSource.register(in: .shared)
    let center = NotificationCenter.default
    observers = [
      center.addObserver(
        forName: UIApplication.willResignActiveNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.prepare()
        self?.content?.videoView.setFullRate(true)
      },
      center.addObserver(
        forName: UIApplication.didEnterBackgroundNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.scheduleIdleUnbind()
      },
      center.addObserver(
        forName: UIApplication.didBecomeActiveNotification,
        object: nil,
        queue: .main
      ) { [weak self] _ in
        self?.didBecomeActive()
      },
    ]
  }

  deinit {
    observers.forEach(NotificationCenter.default.removeObserver)
  }

  func isSupported() throws -> Bool {
    AVPictureInPictureController.isPictureInPictureSupported()
  }

  func arm(config: NativePipConfig) throws {
    let sourceChanged = self.config.map { descriptor(for: $0.source) } != descriptor(for: config.source)
    self.config = config
    prepare(resetAspect: sourceChanged)
  }

  private func prepare(resetAspect: Bool = false) {
    guard let config,
          AVPictureInPictureController.isPictureInPictureSupported(),
          let pipController = ensurePipController(),
          let content
    else {
      return
    }
    content.videoView.mirrored = config.mirror
    if resetAspect || content.preferredContentSize == .zero {
      content.preferredContentSize = CGSize(
        width: CGFloat(max(config.aspectWidth, 1)),
        height: CGFloat(max(config.aspectHeight, 1))
      )
    }
    layoutSourceView()
    bindSourceIfNeeded()
    pipController.canStartPictureInPictureAutomaticallyFromInline = true
  }

  func disarm() throws {
    config = nil
    pipController?.canStartPictureInPictureAutomaticallyFromInline = false
    if active {
      pipController?.stopPictureInPicture()
    } else {
      tearDown()
    }
  }

  func stop() throws {
    if active {
      pipController?.stopPictureInPicture()
    }
  }

  private func ensurePipController() -> AVPictureInPictureController? {
    if let pipController {
      return pipController
    }
    guard let host = hostView() else {
      return nil
    }
    let sourceView = UIView(frame: host.bounds)
    sourceView.isUserInteractionEnabled = false
    sourceView.backgroundColor = .clear
    host.addSubview(sourceView)
    let content = VoicePipContentViewController()
    content.videoView.onVideoSizeChanged = { [weak content] size in
      guard size.width > 0, size.height > 0 else {
        return
      }
      content?.preferredContentSize = size
    }
    content.onLayout = { [weak self] _ in
      guard let self, self.active else {
        return
      }
      self.emit(restoreRequested: false)
    }
    let controller = AVPictureInPictureController(
      contentSource: AVPictureInPictureController.ContentSource(
        activeVideoCallSourceView: sourceView,
        contentViewController: content
      )
    )
    controller.delegate = self
    self.sourceView = sourceView
    self.content = content
    pipController = controller
    return controller
  }

  private func layoutSourceView() {
    guard let sourceView, let host = sourceView.superview else {
      return
    }
    if let rect = config?.sourceRect, rect.width > 0, rect.height > 0 {
      sourceView.frame = CGRect(x: rect.left, y: rect.top, width: rect.width, height: rect.height)
    } else {
      sourceView.frame = host.bounds
    }
  }

  private func descriptor(for source: NativePipVideoSource) -> PipVideoSourceDescriptor {
    switch source.kind {
    case .webRtcTrack:
      return PipVideoSourceDescriptor(kind: WebRtcPipVideoSource.kind, id: source.trackId)
    }
  }

  private func bindSourceIfNeeded() {
    guard let config, let content else {
      return
    }
    let descriptor = descriptor(for: config.source)
    if descriptor == boundDescriptor, source != nil {
      return
    }
    unbindSource()
    if boundDescriptor != descriptor {
      content.videoView.reset()
    }
    boundDescriptor = descriptor
    guard let next = PipVideoSourceRegistry.shared.make(descriptor),
          next.attach(content.videoView)
    else {
      return
    }
    source = next
  }

  private func didBecomeActive() {
    content?.videoView.setFullRate(false)
    bindSourceIfNeeded()
    if active {
      pipController?.stopPictureInPicture()
    }
  }

  private func scheduleIdleUnbind() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
      guard let self, !self.active,
            UIApplication.shared.applicationState == .background
      else {
        return
      }
      self.unbindSource()
    }
  }

  private func unbindSource() {
    source?.detach()
    source = nil
  }

  private func tearDown() {
    unbindSource()
    boundDescriptor = nil
    sourceView?.removeFromSuperview()
    sourceView = nil
    pipController?.delegate = nil
    pipController = nil
    content = nil
  }

  private func emit(restoreRequested: Bool) {
    let size = content?.viewIfLoaded?.bounds.size ?? .zero
    events.send(
      NativePipEvent(
        active: active,
        restoreRequested: restoreRequested,
        width: active && size.width > 0 ? Double(size.width) : nil,
        height: active && size.height > 0 ? Double(size.height) : nil
      )
    )
  }

  func pictureInPictureControllerWillStartPictureInPicture(
    _ pictureInPictureController: AVPictureInPictureController
  ) {
    content?.videoView.setFullRate(true)
    bindSourceIfNeeded()
  }

  func pictureInPictureControllerDidStartPictureInPicture(
    _ pictureInPictureController: AVPictureInPictureController
  ) {
    active = true
    emit(restoreRequested: false)
  }

  func pictureInPictureController(
    _ pictureInPictureController: AVPictureInPictureController,
    failedToStartPictureInPictureWithError error: Error
  ) {
    active = false
    emit(restoreRequested: false)
  }

  func pictureInPictureControllerDidStopPictureInPicture(
    _ pictureInPictureController: AVPictureInPictureController
  ) {
    active = false
    content?.videoView.setFullRate(false)
    emit(restoreRequested: false)
    if config == nil {
      tearDown()
    } else if UIApplication.shared.applicationState == .background {
      unbindSource()
    }
  }

  func pictureInPictureController(
    _ pictureInPictureController: AVPictureInPictureController,
    restoreUserInterfaceForPictureInPictureStopWithCompletionHandler completionHandler:
      @escaping (Bool) -> Void
  ) {
    emit(restoreRequested: true)
    completionHandler(true)
  }
}
