//
//  NotificationImageAttachment.swift
//  NotificationImageAttachment
//
//  Created by Elias Deuss on 09/06/2026.
//
//

import Foundation
import UIKit
import UserNotifications

enum NotificationImageAttachment {
  static let maxDownloadBytes: Int64 = 5 * 1024 * 1024
  static let messageImageIdentifier = "fluxer.message.image"
  static let emojiImageIdentifier = "fluxer.message.emoji"

  static func downloadImage(
    from url: URL,
    timeout: TimeInterval = 20,
    completion: @escaping (URL?) -> Void
  ) {
    var request = URLRequest(url: url)
    request.timeoutInterval = timeout
    let configuration = URLSessionConfiguration.ephemeral
    configuration.timeoutIntervalForRequest = timeout
    configuration.timeoutIntervalForResource = timeout + 5
    let session = URLSession(configuration: configuration)
    let task = session.dataTask(with: request) { data, response, error in
      session.invalidateAndCancel()
      if error != nil {
        completion(nil)
        return
      }
      guard let data, !data.isEmpty else {
        completion(nil)
        return
      }
      if Int64(data.count) > maxDownloadBytes {
        completion(nil)
        return
      }
      if let http = response as? HTTPURLResponse,
        let lengthHeader = http.value(forHTTPHeaderField: "Content-Length"),
        let declared = Int64(lengthHeader),
        declared > maxDownloadBytes
      {
        completion(nil)
        return
      }
      let mime = (response as? HTTPURLResponse)?.value(forHTTPHeaderField: "Content-Type")?
        .lowercased()
      let ext = fileExtension(from: url, mimeType: mime, data: data)
      let destination = FileManager.default.temporaryDirectory
        .appendingPathComponent(UUID().uuidString + ext)
      do {
        try data.write(to: destination, options: .atomic)
        completion(destination)
      } catch {
        completion(nil)
      }
    }
    task.resume()
  }

  static func makeImageAttachment(
    fileURL: URL,
    identifier: String
  ) -> (attachment: UNNotificationAttachment?, filesToRemove: [URL]) {
    var filesToRemove: [URL] = [fileURL]
    let attachmentURL: URL
    if let convertedURL = normalizedAttachmentFileURL(fileURL) {
      attachmentURL = convertedURL
      filesToRemove.append(convertedURL)
    } else {
      attachmentURL = fileURL
    }
    let typeHint = typeHintIdentifier(for: attachmentURL)
    var options: [String: Any] = [:]
    if let typeHint {
      options[UNNotificationAttachmentOptionsTypeHintKey] = typeHint
    }
    let attachment = try? UNNotificationAttachment(
      identifier: identifier,
      url: attachmentURL,
      options: options.isEmpty ? nil : options
    )
    return (attachment, filesToRemove)
  }

  static func normalizedAttachmentFileURL(_ fileURL: URL) -> URL? {
    let ext = fileURL.pathExtension.lowercased()
    if ext != "webp" && ext != "heic" && ext != "heif" {
      return nil
    }
    guard let data = try? Data(contentsOf: fileURL), let image = UIImage(data: data) else {
      return nil
    }
    guard let pngData = image.pngData() else {
      return nil
    }
    let destination = FileManager.default.temporaryDirectory
      .appendingPathComponent(UUID().uuidString + ".png")
    do {
      try pngData.write(to: destination, options: .atomic)
      return destination
    } catch {
      return nil
    }
  }

  private static func typeHintIdentifier(for fileURL: URL) -> String? {
    switch fileURL.pathExtension.lowercased() {
    case "png":
      return "public.png"
    case "gif":
      return "public.gif"
    case "jpg", "jpeg":
      return "public.jpeg"
    default:
      return "public.png"
    }
  }

  private static func fileExtension(from url: URL, mimeType: String?, data: Data) -> String {
    if let mime = mimeType {
      if mime.contains("jpeg") || mime.contains("jpg") {
        return ".jpg"
      }
      if mime.contains("png") {
        return ".png"
      }
      if mime.contains("gif") {
        return ".gif"
      }
      if mime.contains("webp") {
        return ".webp"
      }
      if mime.contains("heic") || mime.contains("heif") {
        return ".heic"
      }
    }
    let pathExt = url.pathExtension.lowercased()
    let allowed = ["png", "jpg", "jpeg", "gif", "webp", "heic", "heif"]
    if allowed.contains(pathExt) {
      if pathExt == "jpeg" || pathExt == "jpg" {
        return ".jpg"
      }
      return ".\(pathExt)"
    }
    return sniffExtension(from: data) ?? ".jpg"
  }

  private static func sniffExtension(from data: Data) -> String? {
    guard !data.isEmpty else {
      return nil
    }
    let prefix = [UInt8](data.prefix(min(16, data.count)))
    if prefix.count >= 3, prefix[0] == 0xFF, prefix[1] == 0xD8, prefix[2] == 0xFF {
      return ".jpg"
    }
    if prefix.count >= 8, prefix[0] == 0x89, prefix[1] == 0x50, prefix[2] == 0x4E, prefix[3] == 0x47 {
      return ".png"
    }
    if prefix.count >= 6, prefix[0] == 0x47, prefix[1] == 0x49, prefix[2] == 0x46 {
      return ".gif"
    }
    if prefix.count >= 12 {
      let start = Data(prefix[0..<4])
      let webp = Data(prefix[8..<12])
      if String(data: start, encoding: .ascii) == "RIFF",
        String(data: webp, encoding: .ascii) == "WEBP"
      {
        return ".webp"
      }
    }
    return nil
  }
}
