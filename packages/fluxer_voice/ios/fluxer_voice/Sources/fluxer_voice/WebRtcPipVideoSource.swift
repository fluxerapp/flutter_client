import CoreVideo
import WebRTC
import flutter_webrtc
import os

final class WebRtcPipVideoSource: NSObject, PipVideoSource, RTCVideoRenderer {
  static let kind = "webRtcTrack"

  static func register(in registry: PipVideoSourceRegistry) {
    registry.register(kind: kind) { descriptor in
      guard let id = descriptor.id, !id.isEmpty else {
        return nil
      }
      return WebRtcPipVideoSource(trackId: id)
    }
  }

  private let trackId: String
  private var track: RTCVideoTrack?
  private let sinkLock = OSAllocatedUnfairLock<PipFrameSink?>(uncheckedState: nil)
  private var pool: CVPixelBufferPool?
  private var poolWidth: Int32 = 0
  private var poolHeight: Int32 = 0

  init(trackId: String) {
    self.trackId = trackId
    super.init()
  }

  func attach(_ sink: PipFrameSink) -> Bool {
    detach()
    guard let track = FlutterWebRTCPlugin.sharedSingleton()?
      .track(forId: trackId, peerConnectionId: nil) as? RTCVideoTrack
    else {
      return false
    }
    sinkLock.withLockUnchecked { $0 = sink }
    self.track = track
    track.add(self)
    return true
  }

  func detach() {
    track?.remove(self)
    track = nil
    sinkLock.withLockUnchecked { $0 = nil }
  }

  func setSize(_ size: CGSize) {}

  func renderFrame(_ frame: RTCVideoFrame?) {
    guard let frame,
          let sink = sinkLock.withLockUnchecked({ $0 }),
          sink.acceptsFrames,
          let pixelBuffer = pixelBuffer(for: frame)
    else {
      return
    }
    sink.enqueue(pixelBuffer: pixelBuffer, rotation: Self.rotation(of: frame))
  }

  private func pixelBuffer(for frame: RTCVideoFrame) -> CVPixelBuffer? {
    if let buffer = frame.buffer as? RTCCVPixelBuffer,
       !buffer.requiresCropping(),
       !buffer.requiresScaling(toWidth: buffer.width, height: buffer.height) {
      return buffer.pixelBuffer
    }
    return nv12(from: frame.buffer.toI420())
  }

  private func nv12(from i420: RTCI420BufferProtocol) -> CVPixelBuffer? {
    guard let pool = pixelBufferPool(width: i420.width, height: i420.height) else {
      return nil
    }
    var output: CVPixelBuffer?
    guard CVPixelBufferPoolCreatePixelBuffer(kCFAllocatorDefault, pool, &output) == kCVReturnSuccess,
          let output
    else {
      return nil
    }
    CVPixelBufferLockBaseAddress(output, [])
    defer {
      CVPixelBufferUnlockBaseAddress(output, [])
    }
    guard let dstY = CVPixelBufferGetBaseAddressOfPlane(output, 0)?
      .assumingMemoryBound(to: UInt8.self),
          let dstUV = CVPixelBufferGetBaseAddressOfPlane(output, 1)?
      .assumingMemoryBound(to: UInt8.self)
    else {
      return nil
    }
    let converted = RTCYUVHelper.i420(
      toNV12: i420.dataY,
      srcStrideY: i420.strideY,
      srcU: i420.dataU,
      srcStrideU: i420.strideU,
      srcV: i420.dataV,
      srcStrideV: i420.strideV,
      dstY: dstY,
      dstStrideY: Int32(CVPixelBufferGetBytesPerRowOfPlane(output, 0)),
      dstUV: dstUV,
      dstStrideUV: Int32(CVPixelBufferGetBytesPerRowOfPlane(output, 1)),
      width: i420.width,
      height: i420.height
    )
    return converted == 0 ? output : nil
  }

  private func pixelBufferPool(width: Int32, height: Int32) -> CVPixelBufferPool? {
    if let pool, poolWidth == width, poolHeight == height {
      return pool
    }
    let attributes: [CFString: Any] = [
      kCVPixelBufferPixelFormatTypeKey: kCVPixelFormatType_420YpCbCr8BiPlanarVideoRange,
      kCVPixelBufferWidthKey: width,
      kCVPixelBufferHeightKey: height,
      kCVPixelBufferIOSurfacePropertiesKey: [CFString: Any](),
    ]
    let poolAttributes: [CFString: Any] = [kCVPixelBufferPoolMinimumBufferCountKey: 3]
    var created: CVPixelBufferPool?
    guard CVPixelBufferPoolCreate(
      kCFAllocatorDefault,
      poolAttributes as CFDictionary,
      attributes as CFDictionary,
      &created
    ) == kCVReturnSuccess else {
      return nil
    }
    pool = created
    poolWidth = width
    poolHeight = height
    return created
  }

  private static func rotation(of frame: RTCVideoFrame) -> PipFrameRotation {
    switch frame.rotation {
    case ._90:
      return .quarter
    case ._180:
      return .half
    case ._270:
      return .threeQuarter
    default:
      return .none
    }
  }
}
