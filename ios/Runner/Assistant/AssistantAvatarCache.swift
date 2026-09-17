import CryptoKit
import Foundation
import UIKit

enum AssistantAvatarCache {
  private static let prefetchTimeout: TimeInterval = 4

  static func fileURLIfPresent(for urlString: String) -> URL? {
    let trimmed = urlString.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !trimmed.isEmpty else {
      return nil
    }
    let url = fileURL(for: trimmed)
    return FileManager.default.fileExists(atPath: url.path) ? url : nil
  }

  static func imageDataIfPresent(for urlString: String) -> Data? {
    guard let url = fileURLIfPresent(for: urlString) else {
      return nil
    }
    return try? Data(contentsOf: url)
  }

  static func prefetch(_ urlStrings: [String]) {
    Task.detached(priority: .utility) {
      await withTaskGroup(of: Void.self) { group in
        var seen = Set<String>()
        for raw in urlStrings {
          let urlString = raw.trimmingCharacters(in: .whitespacesAndNewlines)
          if urlString.isEmpty || seen.contains(urlString) {
            continue
          }
          seen.insert(urlString)
          if fileURLIfPresent(for: urlString) != nil {
            continue
          }
          group.addTask {
            _ = await loadData(urlString: urlString, timeout: prefetchTimeout)
          }
        }
      }
    }
  }

  private static func loadData(urlString: String, timeout: TimeInterval) async -> Data? {
    if let cached = try? Data(contentsOf: fileURL(for: urlString)), !cached.isEmpty {
      return cached
    }
    guard let url = URL(string: urlString) else {
      return nil
    }
    var request = URLRequest(url: url)
    request.timeoutInterval = timeout
    do {
      let (data, response) = try await URLSession.shared.data(for: request)
      guard let http = response as? HTTPURLResponse,
            (200 ..< 300).contains(http.statusCode),
            !data.isEmpty
      else {
        return nil
      }
      let stored = jpegData(from: data) ?? data
      try? stored.write(to: fileURL(for: urlString), options: .atomic)
      return stored
    } catch {
      return nil
    }
  }

  private static func jpegData(from data: Data) -> Data? {
    guard let image = UIImage(data: data) else {
      return nil
    }
    return image.jpegData(compressionQuality: 0.84)
  }

  private static func fileURL(for urlString: String) -> URL {
    let digest = SHA256.hash(data: Data(urlString.utf8))
    let name = digest.map { String(format: "%02x", $0) }.joined() + ".jpg"
    return directory().appendingPathComponent(name)
  }

  private static func directory() -> URL {
    let base = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first
      ?? FileManager.default.temporaryDirectory
    let folder = base.appendingPathComponent("AssistantAvatars", isDirectory: true)
    try? FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
    return folder
  }
}
