import CoreVideo
import Foundation

public enum PipFrameRotation: Int {
  case none = 0
  case quarter = 90
  case half = 180
  case threeQuarter = 270

  var swapsAxes: Bool {
    self == .quarter || self == .threeQuarter
  }
}

public protocol PipFrameSink: AnyObject {
  var acceptsFrames: Bool { get }

  func enqueue(pixelBuffer: CVPixelBuffer, rotation: PipFrameRotation)
}

public struct PipVideoSourceDescriptor: Hashable {
  public let kind: String
  public let id: String?

  public init(kind: String, id: String?) {
    self.kind = kind
    self.id = id
  }
}

public protocol PipVideoSource: AnyObject {
  func attach(_ sink: PipFrameSink) -> Bool

  func detach()
}

public final class PipVideoSourceRegistry {
  public typealias Factory = (PipVideoSourceDescriptor) -> PipVideoSource?

  public static let shared = PipVideoSourceRegistry()

  private let lock = NSLock()
  private var factories: [String: Factory] = [:]

  public func register(kind: String, factory: @escaping Factory) {
    lock.lock()
    factories[kind] = factory
    lock.unlock()
  }

  func make(_ descriptor: PipVideoSourceDescriptor) -> PipVideoSource? {
    lock.lock()
    let factory = factories[descriptor.kind]
    lock.unlock()
    return factory?(descriptor)
  }
}
