import AVFoundation
import UIKit
import os

final class SampleBufferVideoView: UIView, PipFrameSink {
  private static let warmFrameInterval: CFTimeInterval = 0.5

  private let displayLayer = AVSampleBufferDisplayLayer()
  private let queue = DispatchQueue(label: "app.fluxer.voice.pip.frames", qos: .userInteractive)
  private let gate = OSAllocatedUnfairLock(initialState: FrameGate())
  private var formatDescription: CMVideoFormatDescription?
  private var renderedSize: CGSize = .zero
  private var renderedRotation: PipFrameRotation = .none
  private var displayedRotation: PipFrameRotation = .none

  var mirrored = false {
    didSet {
      if mirrored != oldValue {
        applyGeometry()
      }
    }
  }

  var onVideoSizeChanged: ((CGSize) -> Void)?

  private struct FrameGate {
    var inFlight = false
    var fullRate = false
    var lastFrameTime: CFTimeInterval = 0

    func accepts(at now: CFTimeInterval) -> Bool {
      !inFlight && (fullRate || now - lastFrameTime >= SampleBufferVideoView.warmFrameInterval)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .black
    isUserInteractionEnabled = false
    displayLayer.videoGravity = .resizeAspect
    layer.addSublayer(displayLayer)
  }

  required init?(coder: NSCoder) {
    nil
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    applyGeometry()
  }

  var acceptsFrames: Bool {
    let now = CACurrentMediaTime()
    return gate.withLock { $0.accepts(at: now) }
  }

  func setFullRate(_ fullRate: Bool) {
    gate.withLock { $0.fullRate = fullRate }
  }

  func enqueue(pixelBuffer: CVPixelBuffer, rotation: PipFrameRotation) {
    let now = CACurrentMediaTime()
    let claimed = gate.withLock { state -> Bool in
      guard state.accepts(at: now) else {
        return false
      }
      state.inFlight = true
      state.lastFrameTime = now
      return true
    }
    guard claimed else {
      return
    }
    queue.async { [weak self] in
      guard let self else {
        return
      }
      self.render(pixelBuffer, rotation: rotation)
      self.gate.withLock { $0.inFlight = false }
    }
  }

  func reset() {
    queue.async { [weak self] in
      guard let self else {
        return
      }
      self.flush(removingImage: true)
      self.formatDescription = nil
      self.renderedSize = .zero
    }
  }

  private func applyGeometry() {
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    let bounds = self.bounds
    displayLayer.bounds = displayedRotation.swapsAxes
      ? CGRect(x: 0, y: 0, width: bounds.height, height: bounds.width)
      : CGRect(origin: .zero, size: bounds.size)
    displayLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
    var transform = CGAffineTransform(
      rotationAngle: CGFloat(displayedRotation.rawValue) * .pi / 180
    )
    if mirrored {
      transform = transform.concatenating(CGAffineTransform(scaleX: -1, y: 1))
    }
    displayLayer.setAffineTransform(transform)
    CATransaction.commit()
  }

  private func render(_ pixelBuffer: CVPixelBuffer, rotation: PipFrameRotation) {
    if renderStatusFailed || requiresFlushToResumeDecoding {
      flush(removingImage: false)
    }
    guard isReadyForMoreMediaData, let sample = makeSampleBuffer(pixelBuffer) else {
      return
    }
    enqueueSample(sample)
    let width = CGFloat(CVPixelBufferGetWidth(pixelBuffer))
    let height = CGFloat(CVPixelBufferGetHeight(pixelBuffer))
    let size = rotation.swapsAxes
      ? CGSize(width: height, height: width)
      : CGSize(width: width, height: height)
    guard size != renderedSize || rotation != renderedRotation else {
      return
    }
    renderedSize = size
    renderedRotation = rotation
    DispatchQueue.main.async { [weak self] in
      guard let self else {
        return
      }
      if self.displayedRotation != rotation {
        self.displayedRotation = rotation
        self.applyGeometry()
      }
      self.onVideoSizeChanged?(size)
    }
  }

  private var renderStatusFailed: Bool {
    if #available(iOS 17.0, *) {
      return displayLayer.sampleBufferRenderer.status == .failed
    }
    return displayLayer.status == .failed
  }

  private var requiresFlushToResumeDecoding: Bool {
    if #available(iOS 17.0, *) {
      return displayLayer.sampleBufferRenderer.requiresFlushToResumeDecoding
    }
    return displayLayer.requiresFlushToResumeDecoding
  }

  private var isReadyForMoreMediaData: Bool {
    if #available(iOS 17.0, *) {
      return displayLayer.sampleBufferRenderer.isReadyForMoreMediaData
    }
    return displayLayer.isReadyForMoreMediaData
  }

  private func enqueueSample(_ sample: CMSampleBuffer) {
    if #available(iOS 17.0, *) {
      displayLayer.sampleBufferRenderer.enqueue(sample)
      return
    }
    displayLayer.enqueue(sample)
  }

  private func flush(removingImage: Bool) {
    if #available(iOS 17.0, *) {
      displayLayer.sampleBufferRenderer.flush(removingDisplayedImage: removingImage)
      return
    }
    if removingImage {
      displayLayer.flushAndRemoveImage()
    } else {
      displayLayer.flush()
    }
  }

  private func makeSampleBuffer(_ pixelBuffer: CVPixelBuffer) -> CMSampleBuffer? {
    if formatDescription.map({
      !CMVideoFormatDescriptionMatchesImageBuffer($0, imageBuffer: pixelBuffer)
    }) ?? true {
      var description: CMVideoFormatDescription?
      guard CMVideoFormatDescriptionCreateForImageBuffer(
        allocator: kCFAllocatorDefault,
        imageBuffer: pixelBuffer,
        formatDescriptionOut: &description
      ) == noErr else {
        return nil
      }
      formatDescription = description
    }
    guard let formatDescription else {
      return nil
    }
    var timing = CMSampleTimingInfo(
      duration: .invalid,
      presentationTimeStamp: CMClockGetTime(CMClockGetHostTimeClock()),
      decodeTimeStamp: .invalid
    )
    var sample: CMSampleBuffer?
    guard CMSampleBufferCreateReadyWithImageBuffer(
      allocator: kCFAllocatorDefault,
      imageBuffer: pixelBuffer,
      formatDescription: formatDescription,
      sampleTiming: &timing,
      sampleBufferOut: &sample
    ) == noErr, let sample else {
      return nil
    }
    if let attachments = CMSampleBufferGetSampleAttachmentsArray(sample, createIfNecessary: true),
       CFArrayGetCount(attachments) > 0 {
      let attachment = unsafeBitCast(
        CFArrayGetValueAtIndex(attachments, 0),
        to: CFMutableDictionary.self
      )
      CFDictionarySetValue(
        attachment,
        Unmanaged.passUnretained(kCMSampleAttachmentKey_DisplayImmediately).toOpaque(),
        Unmanaged.passUnretained(kCFBooleanTrue).toOpaque()
      )
    }
    return sample
  }
}
