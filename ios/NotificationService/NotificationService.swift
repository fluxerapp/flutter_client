//
//  NotificationService.swift
//  NotificationService
//
//  Created by Elias Deuss on 15/05/2026.
//
//

import Foundation
import UIKit
import UserNotifications

final class NotificationService: UNNotificationServiceExtension {
    private var contentHandler: ((UNNotificationContent) -> Void)?
    private var bestAttemptContent: UNMutableNotificationContent?
    private var fallbackContent: UNNotificationContent?
    private var didDeliver: Bool = false
    private let deliverLock = NSLock()

    override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
        self.contentHandler = contentHandler
        fallbackContent = request.content
        guard let mutableContent = request.content.mutableCopy() as? UNMutableNotificationContent else {
            deliver(content: request.content)
            return
        }
        Self.applyThreadIdentifier(to: mutableContent, userInfo: request.content.userInfo)
        Self.applyNotificationSound(to: mutableContent, userInfo: request.content.userInfo)
        let emojiResult = NotificationEmojiDecoder.decode(body: mutableContent.body)
        mutableContent.body = emojiResult.body
        bestAttemptContent = mutableContent
        let messageImageUrl = NotificationPayloadMedia.resolveImageUrl(from: request.content.userInfo)
        let emojiImageUrl = emojiResult.imageUrls.first
        guard messageImageUrl != nil || emojiImageUrl != nil else {
            deliver(content: mutableContent)
            return
        }
        if let messageImageUrl {
            downloadAndAttach(
                url: messageImageUrl,
                identifier: NotificationImageAttachment.messageImageIdentifier
            )
        } else if let emojiImageUrl {
            downloadAndAttach(
                url: emojiImageUrl,
                identifier: NotificationImageAttachment.emojiImageIdentifier
            )
        }
    }

    override func serviceExtensionTimeWillExpire() {
        let content: UNNotificationContent = bestAttemptContent ?? fallbackContent ?? UNNotificationContent()
        deliver(content: content)
    }

    private func downloadAndAttach(url: URL, identifier: String) {
        NotificationImageAttachment.downloadImage(from: url) { localFileUrl in
            self.deliverLock.lock()
            let alreadyDelivered = self.didDeliver
            self.deliverLock.unlock()
            if alreadyDelivered {
                if let fileURL = localFileUrl {
                    try? FileManager.default.removeItem(at: fileURL)
                }
                return
            }
            var tempFilesToRemove: [URL] = []
            if let mutableContent = self.bestAttemptContent, let fileURL = localFileUrl {
                let attachmentResult = NotificationImageAttachment.makeImageAttachment(
                    fileURL: fileURL,
                    identifier: identifier
                )
                tempFilesToRemove = attachmentResult.filesToRemove
                if let attachment = attachmentResult.attachment {
                    mutableContent.attachments = [attachment]
                }
            }
            if let mutable = self.bestAttemptContent {
                self.deliver(content: mutable)
            } else if let fallback = self.fallbackContent {
                self.deliver(content: fallback)
            }
            for tempURL in tempFilesToRemove {
                try? FileManager.default.removeItem(at: tempURL)
            }
        }
    }

    private func deliver(content: UNNotificationContent) {
        deliverLock.lock()
        defer { deliverLock.unlock() }
        guard !didDeliver else {
            return
        }
        didDeliver = true
        let handler = contentHandler
        contentHandler = nil
        handler?(content)
    }
}

private extension NotificationService {
    static func applyThreadIdentifier(
        to content: UNMutableNotificationContent,
        userInfo: [AnyHashable: Any]
    ) {
        if let threadId = PushNotificationPayload.resolveChannelThreadIdentifier(from: userInfo) {
            content.threadIdentifier = threadId
        }
    }

    static func applyNotificationSound(
        to content: UNMutableNotificationContent,
        userInfo: [AnyHashable: Any]
    ) {
        guard let sound = PushNotificationPayload.resolveNotificationSound(from: userInfo) else {
            return
        }
        content.sound = sound
    }
}
