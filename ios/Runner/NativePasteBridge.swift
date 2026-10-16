import Flutter
import ObjectiveC
import UIKit
import UniformTypeIdentifiers

final class NativePasteBridge: NSObject {
  static let shared = NativePasteBridge()

  private static let fileTypes: [UTType] = [
    .png, .jpeg, .gif, .webP, .heic, .heif, .tiff, .bmp, .svg, .ico,
    .mpeg4Movie, .quickTimeMovie, .pdf,
  ]

  private var channel: FlutterMethodChannel?

  func register(engineBridge: FlutterImplicitEngineBridge) {
    if channel != nil {
      return
    }
    channel = FlutterMethodChannel(
      name: "fluxer_app/native_paste",
      binaryMessenger: engineBridge.applicationRegistrar.messenger()
    )
    guard let viewClass = NSClassFromString("FlutterTextInputView") else {
      return
    }
    hookPaste(viewClass)
    hookCanPerformAction(viewClass)
  }

  private func hookPaste(_ viewClass: AnyClass) {
    let selector = #selector(UIResponderStandardEditActions.paste(_:))
    guard let method = class_getInstanceMethod(viewClass, selector) else {
      return
    }
    let replacement: @convention(block) (UIResponder, Any?) -> Void = { view, _ in
      NativePasteBridge.shared.paste(into: view)
    }
    method_setImplementation(method, imp_implementationWithBlock(replacement))
  }

  private func hookCanPerformAction(_ viewClass: AnyClass) {
    let selector = #selector(UIResponder.canPerformAction(_:withSender:))
    guard let method = class_getInstanceMethod(viewClass, selector) else {
      return
    }
    typealias CanPerformAction = @convention(c) (AnyObject, Selector, Selector, Any?) -> Bool
    let original = unsafeBitCast(method_getImplementation(method), to: CanPerformAction.self)
    let pasteSelector = #selector(UIResponderStandardEditActions.paste(_:))
    let replacement: @convention(block) (AnyObject, Selector, Any?) -> Bool = {
      view, action, sender in
      if action == pasteSelector {
        let pasteboard = UIPasteboard.general
        return pasteboard.hasStrings || pasteboard.hasURLs || pasteboard.hasImages
      }
      return original(view, selector, action, sender)
    }
    method_setImplementation(method, imp_implementationWithBlock(replacement))
  }

  private func paste(into view: UIResponder) {
    let pasteboard = UIPasteboard.general
    let string = pasteboard.hasStrings ? pasteboard.string : nil
    let plainText = string ?? pasteboard.url?.absoluteString
    let prefersFiles = string.map { pasteboard.hasImages && isLink($0) } ?? true
    let files = prefersFiles ? readFiles(pasteboard) : []
    if plainText == nil && files.isEmpty {
      return
    }
    guard let channel else {
      insert(plainText, into: view)
      return
    }
    var arguments: [String: Any] = ["files": files]
    if files.isEmpty, let plainText {
      arguments["text"] = plainText
    }
    channel.invokeMethod("paste", arguments: arguments) { [weak view] result in
      guard let view, (result as? Bool) != true else {
        return
      }
      NativePasteBridge.shared.insert(plainText, into: view)
    }
  }

  private func isLink(_ string: String) -> Bool {
    let trimmed = string.trimmingCharacters(in: .whitespacesAndNewlines)
    guard trimmed.rangeOfCharacter(from: .whitespacesAndNewlines) == nil,
      let url = URL(string: trimmed)
    else {
      return false
    }
    return url.scheme != nil
  }

  private func insert(_ text: String?, into view: UIResponder) {
    guard let text, let input = view as? UIKeyInput else {
      return
    }
    input.insertText(text)
  }

  private func readFiles(_ pasteboard: UIPasteboard) -> [[String: Any]] {
    let providers = pasteboard.itemProviders
    var files: [[String: Any]] = []
    for index in 0..<pasteboard.numberOfItems {
      let itemSet = IndexSet(integer: index)
      guard
        let identifiers = pasteboard.types(forItemSet: itemSet)?.first,
        let type = preferredFileType(identifiers.compactMap { UTType($0) }),
        let data = pasteboard.data(forPasteboardType: type.identifier, inItemSet: itemSet)?.first,
        !data.isEmpty
      else {
        continue
      }
      let suggestedName = index < providers.count ? providers[index].suggestedName : nil
      var file: [String: Any] = [
        "data": FlutterStandardTypedData(bytes: data),
        "name": filename(suggestedName, type: type),
      ]
      if let mimeType = type.preferredMIMEType {
        file["mimeType"] = mimeType
      }
      files.append(file)
    }
    return files
  }

  private func preferredFileType(_ types: [UTType]) -> UTType? {
    for candidate in Self.fileTypes where types.contains(candidate) {
      return candidate
    }
    return types.first { type in
      type.conforms(to: .image) || type.conforms(to: .audiovisualContent)
    }
  }

  private func filename(_ suggestedName: String?, type: UTType) -> String {
    let stem = suggestedName?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
    let base = stem.isEmpty ? "clipboard" : stem
    guard let ext = type.preferredFilenameExtension, (base as NSString).pathExtension.isEmpty
    else {
      return base
    }
    return "\(base).\(ext)"
  }
}
