import AVFoundation
import Flutter
import ImageIO
import PhotosUI
import UIKit
import UniformTypeIdentifiers

final class AttachmentMediaBridge: NSObject, PHPickerViewControllerDelegate {
  static let shared = AttachmentMediaBridge()

  private var channel: FlutterMethodChannel?
  private var pendingResult: FlutterResult?
  private var preselected: Set<String> = []

  private static let stagingDirectory = FileManager.default.temporaryDirectory
    .appendingPathComponent("photo_picker", isDirectory: true)

  func register(messenger: FlutterBinaryMessenger) {
    if channel != nil {
      return
    }
    try? FileManager.default.removeItem(at: Self.stagingDirectory)
    let channel = FlutterMethodChannel(
      name: "fluxer_app/attachment_media",
      binaryMessenger: messenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      let arguments = call.arguments as? [String: Any] ?? [:]
      switch call.method {
      case "pick":
        self?.pick(arguments: arguments, result: result)
      case "videoThumbnail":
        Self.videoThumbnail(arguments: arguments, result: result)
      default:
        result(FlutterMethodNotImplemented)
      }
    }
    self.channel = channel
  }

  private func pick(arguments: [String: Any], result: @escaping FlutterResult) {
    guard pendingResult == nil, let presenter = Self.topViewController() else {
      result(nil)
      return
    }
    let selected = arguments["selected"] as? [String] ?? []
    let limit = arguments["limit"] as? Int ?? 1
    var configuration = PHPickerConfiguration(photoLibrary: .shared())
    configuration.filter = .any(of: [.images, .videos])
    configuration.selectionLimit = max(limit, 1)
    configuration.selection = .ordered
    configuration.preferredAssetRepresentationMode = .current
    configuration.preselectedAssetIdentifiers = selected
    let picker = PHPickerViewController(configuration: configuration)
    picker.delegate = self
    pendingResult = result
    preselected = Set(selected)
    presenter.present(picker, animated: true)
  }

  func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
    picker.dismiss(animated: true)
    guard let result = pendingResult else {
      return
    }
    pendingResult = nil
    if results.isEmpty {
      result(nil)
      return
    }
    let preselected = self.preselected
    let lock = NSLock()
    let group = DispatchGroup()
    var picks = [[String: Any]?](repeating: nil, count: results.count)
    for (index, item) in results.enumerated() {
      let assetId = item.assetIdentifier
      if let assetId, preselected.contains(assetId) {
        picks[index] = ["assetId": assetId]
        continue
      }
      group.enter()
      Self.copyFile(from: item.itemProvider) { url in
        if let url {
          var pick: [String: Any] = ["path": url.path, "name": url.lastPathComponent]
          pick["assetId"] = assetId
          lock.lock()
          picks[index] = pick
          lock.unlock()
        }
        group.leave()
      }
    }
    group.notify(queue: .main) {
      result(picks.compactMap { $0 })
    }
  }

  private static func copyFile(
    from provider: NSItemProvider,
    completion: @escaping (URL?) -> Void
  ) {
    let typeIdentifier =
      provider.hasItemConformingToTypeIdentifier(UTType.movie.identifier)
      ? UTType.movie.identifier
      : provider.registeredTypeIdentifiers.first {
        UTType($0)?.conforms(to: .image) == true
      }
    guard let typeIdentifier else {
      completion(nil)
      return
    }
    provider.loadFileRepresentation(forTypeIdentifier: typeIdentifier) { source, _ in
      guard let source else {
        completion(nil)
        return
      }
      completion(stage(source, suggestedName: provider.suggestedName))
    }
  }

  private static func stage(_ source: URL, suggestedName: String?) -> URL? {
    let directory = stagingDirectory
      .appendingPathComponent(UUID().uuidString, isDirectory: true)
    let sourceExtension = source.pathExtension
    var stem = suggestedName ?? source.deletingPathExtension().lastPathComponent
    if (stem as NSString).pathExtension.caseInsensitiveCompare(sourceExtension) == .orderedSame {
      stem = (stem as NSString).deletingPathExtension
    }
    stem = stem.replacingOccurrences(of: "/", with: "_")
    if stem.isEmpty {
      stem = source.deletingPathExtension().lastPathComponent
    }
    do {
      try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
      if let type = UTType(filenameExtension: sourceExtension),
        type.conforms(to: .heic) || type.conforms(to: .heif)
      {
        let destination = directory.appendingPathComponent(stem).appendingPathExtension("jpg")
        return writeJpeg(from: source, to: destination) ? destination : nil
      }
      let destination = directory.appendingPathComponent(stem)
        .appendingPathExtension(sourceExtension)
      try FileManager.default.copyItem(at: source, to: destination)
      return destination
    } catch {
      return nil
    }
  }

  private static func writeJpeg(from source: URL, to destination: URL) -> Bool {
    guard let image = CGImageSourceCreateWithURL(source as CFURL, nil),
      let target = CGImageDestinationCreateWithURL(
        destination as CFURL,
        UTType.jpeg.identifier as CFString,
        1,
        nil
      )
    else {
      return false
    }
    let options = [kCGImageDestinationLossyCompressionQuality: 0.9] as CFDictionary
    CGImageDestinationAddImageFromSource(
      target,
      image,
      CGImageSourceGetPrimaryImageIndex(image),
      options
    )
    return CGImageDestinationFinalize(target)
  }

  private static func videoThumbnail(arguments: [String: Any], result: @escaping FlutterResult) {
    guard let path = arguments["path"] as? String else {
      result(nil)
      return
    }
    let size = arguments["size"] as? Int ?? 300
    let generator = AVAssetImageGenerator(asset: AVURLAsset(url: URL(fileURLWithPath: path)))
    generator.appliesPreferredTrackTransform = true
    generator.maximumSize = CGSize(width: size, height: size)
    generator.generateCGImageAsynchronously(for: .zero) { image, _, _ in
      withExtendedLifetime(generator) {}
      let data = image.flatMap { UIImage(cgImage: $0).jpegData(compressionQuality: 0.8) }
      DispatchQueue.main.async {
        result(data.map { FlutterStandardTypedData(bytes: $0) })
      }
    }
  }

  private static func topViewController() -> UIViewController? {
    let window = UIApplication.shared.connectedScenes
      .compactMap { $0 as? UIWindowScene }
      .flatMap(\.windows)
      .first { $0.isKeyWindow }
    var controller = window?.rootViewController
    while let presented = controller?.presentedViewController {
      controller = presented
    }
    return controller
  }
}
