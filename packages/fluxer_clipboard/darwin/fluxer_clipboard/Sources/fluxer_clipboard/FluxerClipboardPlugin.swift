import Foundation
import UniformTypeIdentifiers

#if os(iOS)
  import Flutter
  import UIKit
#elseif os(macOS)
  import AppKit
  import FlutterMacOS
#endif

public final class FluxerClipboardPlugin: NSObject, FlutterPlugin, ClipboardHostApi {
  private let queue = DispatchQueue(label: "com.fluxer.clipboard", qos: .userInitiated)

  public static func register(with registrar: FlutterPluginRegistrar) {
    #if os(iOS)
      let messenger = registrar.messenger()
    #else
      let messenger = registrar.messenger
    #endif
    ClipboardHostApiSetup.setUp(binaryMessenger: messenger, api: FluxerClipboardPlugin())
  }

  func readItems(
    mimeTypes: [String],
    maxItems: Int64,
    completion: @escaping (Result<[NativeClipboardItem], Error>) -> Void
  ) {
    let limit = Int(max(0, maxItems))
    queue.async {
      let matchers = mimeTypes.compactMap(ClipboardTypeMatcher.init)
      let items = ClipboardReader.readItems(matchers: matchers, limit: limit)
      DispatchQueue.main.async { completion(.success(items)) }
    }
  }

  func readText(completion: @escaping (Result<String?, Error>) -> Void) {
    queue.async {
      let text = ClipboardReader.readText()
      DispatchQueue.main.async { completion(.success(text)) }
    }
  }
}

struct ClipboardTypeMatcher {
  let mimeType: String?
  let type: UTType

  init?(mimeType raw: String) {
    let mime = raw.trimmingCharacters(in: .whitespaces).lowercased()
    if mime.hasSuffix("/*") {
      switch mime.dropLast(2) {
      case "image": type = .image
      case "video": type = .movie
      case "audio": type = .audio
      case "text": type = .text
      default: return nil
      }
      mimeType = nil
      return
    }
    guard let resolved = UTType(mimeType: mime), !resolved.isDynamic else {
      return nil
    }
    mimeType = mime
    type = resolved
  }

  func match(_ identifiers: [String]) -> (identifier: String, mimeType: String?)? {
    if let mimeType {
      if identifiers.contains(type.identifier) {
        return (type.identifier, mimeType)
      }
      for identifier in identifiers {
        if let candidate = UTType(identifier), !candidate.isDynamic,
          candidate.conforms(to: type)
        {
          return (identifier, mimeType)
        }
      }
      return nil
    }
    for identifier in identifiers {
      guard let candidate = UTType(identifier), !candidate.isDynamic,
        candidate.conforms(to: type)
      else {
        continue
      }
      return (identifier, candidate.preferredMIMEType)
    }
    return nil
  }
}

enum ClipboardReader {
  static func fileItem(_ url: URL) -> NativeClipboardItem? {
    guard url.isFileURL else {
      return nil
    }
    var isDirectory: ObjCBool = false
    let path = url.path
    guard FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory),
      !isDirectory.boolValue,
      FileManager.default.isReadableFile(atPath: path)
    else {
      return nil
    }
    let mimeType = UTType(filenameExtension: url.pathExtension)?.preferredMIMEType
    return NativeClipboardItem(
      mimeType: mimeType,
      name: url.lastPathComponent,
      data: nil,
      path: path
    )
  }

  static let textIdentifiers: Set<String> = [
    UTType.utf8PlainText.identifier,
    UTType.plainText.identifier,
    UTType.html.identifier,
  ]

  static func isTextLike(_ mimeType: String?) -> Bool {
    guard let mimeType else {
      return false
    }
    return mimeType.hasPrefix("text/") || mimeType == "application/json"
      || mimeType == "application/rtf"
  }

  static func firstMatch(
    _ identifiers: [String],
    matchers: [ClipboardTypeMatcher]
  ) -> (identifier: String, mimeType: String?)? {
    let hasText = identifiers.contains(where: textIdentifiers.contains)
    for matcher in matchers {
      guard let match = matcher.match(identifiers) else {
        continue
      }
      if hasText && isTextLike(match.mimeType) {
        continue
      }
      return match
    }
    return nil
  }

  #if os(macOS)
    static func readItems(matchers: [ClipboardTypeMatcher], limit: Int) -> [NativeClipboardItem] {
      var result: [NativeClipboardItem] = []
      for item in NSPasteboard.general.pasteboardItems ?? [] {
        if result.count >= limit {
          break
        }
        if item.types.contains(.fileURL),
          let raw = item.string(forType: .fileURL),
          let url = URL(string: raw)
        {
          if let file = fileItem(url) {
            result.append(file)
          }
          continue
        }
        guard let match = firstMatch(item.types.map(\.rawValue), matchers: matchers),
          let data = item.data(forType: NSPasteboard.PasteboardType(match.identifier)),
          !data.isEmpty
        else {
          continue
        }
        result.append(
          NativeClipboardItem(
            mimeType: match.mimeType,
            name: nil,
            data: FlutterStandardTypedData(bytes: data),
            path: nil
          ))
      }
      return result
    }

    static func readText() -> String? {
      NSPasteboard.general.string(forType: .string)
    }
  #else
    static func readItems(matchers: [ClipboardTypeMatcher], limit: Int) -> [NativeClipboardItem] {
      let pasteboard = UIPasteboard.general
      let providers = pasteboard.itemProviders
      var result: [NativeClipboardItem] = []
      for index in 0..<pasteboard.numberOfItems {
        if result.count >= limit {
          break
        }
        let itemSet = IndexSet(integer: index)
        guard let identifiers = pasteboard.types(forItemSet: itemSet)?.first else {
          continue
        }
        if identifiers.contains(UTType.fileURL.identifier),
          let raw = pasteboard.data(
            forPasteboardType: UTType.fileURL.identifier, inItemSet: itemSet)?.first,
          let url = URL(dataRepresentation: raw, relativeTo: nil),
          let file = fileItem(url)
        {
          result.append(file)
          continue
        }
        guard let match = firstMatch(identifiers, matchers: matchers),
          let data = pasteboard.data(forPasteboardType: match.identifier, inItemSet: itemSet)?.first,
          !data.isEmpty
        else {
          continue
        }
        let name = index < providers.count ? providers[index].suggestedName : nil
        result.append(
          NativeClipboardItem(
            mimeType: match.mimeType,
            name: name,
            data: FlutterStandardTypedData(bytes: data),
            path: nil
          ))
      }
      return result
    }

    static func readText() -> String? {
      let pasteboard = UIPasteboard.general
      return pasteboard.hasStrings ? pasteboard.string : nil
    }
  #endif
}
