//
//  NotificationService.swift
//  NotificationService
//
//  Created by Elias Deuss on 15/05/2026.
//
//

import Foundation
import Intents
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
        let resolved = WebPushRecordDecryptor.resolvedUserInfo(request.content.userInfo)
        applyDecryptedFields(to: mutableContent, userInfo: resolved)
        Self.applyReplyCategory(to: mutableContent, userInfo: resolved)
        Self.applyThreadIdentifier(to: mutableContent, userInfo: resolved)
        Self.applyNotificationSound(to: mutableContent, userInfo: resolved)
        let emojiResult = NotificationEmojiDecoder.decode(body: mutableContent.body)
        mutableContent.body = emojiResult.body
        bestAttemptContent = mutableContent
        let messageImageUrl = NotificationPayloadMedia.resolveImageUrl(from: resolved)
        let avatarUrl = NotificationPayloadMedia.resolveAvatarUrl(from: resolved)
        let emojiImageUrl = emojiResult.imageUrls.first
        guard messageImageUrl != nil || emojiImageUrl != nil || avatarUrl != nil else {
            deliver(content: Self.communicationContent(mutableContent, avatarData: nil))
            return
        }
        downloadMedia(
            messageImageUrl: messageImageUrl ?? emojiImageUrl,
            imageIdentifier: messageImageUrl == nil
                ? NotificationImageAttachment.emojiImageIdentifier
                : NotificationImageAttachment.messageImageIdentifier,
            avatarUrl: avatarUrl
        )
    }

    override func serviceExtensionTimeWillExpire() {
        let content: UNNotificationContent = bestAttemptContent ?? fallbackContent ?? UNNotificationContent()
        deliver(content: content)
    }

    private func applyDecryptedFields(
        to content: UNMutableNotificationContent,
        userInfo: [AnyHashable: Any]
    ) {
        content.userInfo = userInfo
        if let title = userInfo["title"] as? String, !title.isEmpty {
            content.title = title
        }
        if let body = userInfo["body"] as? String, !body.isEmpty {
            content.body = body
        }
    }

    private func downloadMedia(messageImageUrl: URL?, imageIdentifier: String, avatarUrl: URL?) {
        let group = DispatchGroup()
        var imageFile: URL?
        var avatarData: Data?
        if let messageImageUrl {
            group.enter()
            NotificationImageAttachment.downloadImage(from: messageImageUrl) { file in
                imageFile = file
                group.leave()
            }
        }
        if let avatarUrl {
            group.enter()
            NotificationImageAttachment.downloadImage(from: avatarUrl) { file in
                if let file {
                    avatarData = try? Data(contentsOf: file)
                    try? FileManager.default.removeItem(at: file)
                }
                group.leave()
            }
        }
        group.notify(queue: .main) {
            self.finishDownload(
                imageFile: imageFile,
                imageIdentifier: imageIdentifier,
                avatarData: avatarData
            )
        }
    }

    private func finishDownload(imageFile: URL?, imageIdentifier: String, avatarData: Data?) {
        deliverLock.lock()
        let alreadyDelivered = didDeliver
        deliverLock.unlock()
        if alreadyDelivered {
            if let imageFile {
                try? FileManager.default.removeItem(at: imageFile)
            }
            return
        }
        var tempFiles: [URL] = []
        if let mutableContent = bestAttemptContent {
            if let imageFile {
                let attachmentResult = NotificationImageAttachment.makeImageAttachment(
                    fileURL: imageFile,
                    identifier: imageIdentifier
                )
                tempFiles = attachmentResult.filesToRemove
                if let attachment = attachmentResult.attachment {
                    mutableContent.attachments = [attachment]
                }
            }
            let content = Self.communicationContent(mutableContent, avatarData: avatarData)
            deliver(content: content)
        } else if let fallback = fallbackContent {
            deliver(content: fallback)
        }
        for tempURL in tempFiles {
            try? FileManager.default.removeItem(at: tempURL)
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

    static func communicationContent(
        _ content: UNMutableNotificationContent,
        avatarData: Data?
    ) -> UNNotificationContent {
        let userInfo = content.userInfo
        let title = content.title.isEmpty ? "Fluxer" : content.title
        let avatar = avatarData.map { INImage(imageData: $0) }
        let sender = INPerson(
            personHandle: INPersonHandle(value: title, type: .unknown),
            nameComponents: nil,
            displayName: title,
            image: avatar,
            contactIdentifier: nil,
            customIdentifier: nil,
            isMe: false,
            suggestionType: .none
        )
        let intent = INSendMessageIntent(
            recipients: nil,
            outgoingMessageType: .outgoingMessageText,
            content: content.body,
            speakableGroupName: nil,
            conversationIdentifier: content.threadIdentifier.isEmpty ? nil : content.threadIdentifier,
            serviceName: nil,
            sender: sender,
            attachments: nil
        )
        if let avatar {
            intent.setImage(avatar, forParameterNamed: \.sender)
        }
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.direction = .incoming
        if let sentDate = PushNotificationPayload.resolveMessageSentDate(from: userInfo) {
            interaction.dateInterval = DateInterval(start: sentDate, duration: 0)
        }
        interaction.donate(completion: nil)
        guard let updated = try? content.updating(from: intent).mutableCopy()
          as? UNMutableNotificationContent
        else {
            return content
        }
        updated.userInfo = content.userInfo
        updated.sound = content.sound
        updated.categoryIdentifier = content.categoryIdentifier
        if !content.attachments.isEmpty {
            updated.attachments = content.attachments
        }
        return updated
    }

    static func applyReplyCategory(
        to content: UNMutableNotificationContent,
        userInfo: [AnyHashable: Any]
    ) {
        guard PushNotificationPayload.canReply(from: userInfo) else {
            return
        }
        content.categoryIdentifier = PushNotificationPayload.messageReplyCategoryId
    }
}
