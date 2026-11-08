import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/push/android/channels.dart';
import 'package:fluxer_app/core/push/android/conversation/history.dart';
import 'package:fluxer_app/core/push/notification/localization.dart';
import 'package:fluxer_app/core/push/notification/payload.dart';
import 'package:fluxer_app/core/push/notification/sound.dart';

String resolvePushSenderName(String? title) {
  final String? messageTitle = _nonEmpty(title);
  if (messageTitle == null) {
    return pushNotificationLocalizations().notificationUnknownSender;
  }
  if (isPushGroupDmTitle(messageTitle)) {
    return messageTitle.substring(
      0,
      messageTitle.length - kPushGroupDmTitleSuffix.length,
    );
  }
  final int open = messageTitle.indexOf(' (#');
  if (open >= 0) {
    return messageTitle.substring(0, open);
  }
  return messageTitle;
}

String resolvePushSenderKey(
  Map<String, String> payload, {
  required String senderName,
}) {
  return _nonEmpty(payload['author_id']) ?? senderName;
}

List<PushConversationLine> pushConversationLinesWithoutMedia(
  List<PushConversationLine> lines,
) {
  return lines
      .map(
        (PushConversationLine line) => PushConversationLine(
          messageId: line.messageId,
          senderName: line.senderName,
          senderKey: line.senderKey,
          body: line.body,
          timestampMs: line.timestampMs,
        ),
      )
      .toList(growable: false);
}

List<PushConversationLine> pushConversationLinesWithExistingMedia(
  List<PushConversationLine> lines, {
  bool Function(String path)? fileExists,
}) {
  final bool Function(String path) exists =
      fileExists ?? (String path) => File(path).existsSync();
  String? existing(String? path) => path != null && exists(path) ? path : null;
  return lines
      .map(
        (PushConversationLine line) => PushConversationLine(
          messageId: line.messageId,
          senderName: line.senderName,
          senderKey: line.senderKey,
          body: line.body,
          timestampMs: line.timestampMs,
          avatarPath: existing(line.avatarPath),
          imagePath: existing(line.imagePath),
        ),
      )
      .toList(growable: false);
}

bool resolvePushGroupConversation(
  Map<String, String> payload, {
  String? title,
}) {
  final String? messageTitle = _nonEmpty(title) ?? _nonEmpty(payload['title']);
  return isPushGroupDmTitle(messageTitle) ||
      !isDmPushPayload(enrichPushPayload(payload));
}

String? resolvePushMessagingConversationTitle(
  Map<String, String> payload, {
  String? title,
}) {
  if (!resolvePushGroupConversation(payload, title: title)) {
    return null;
  }
  final String? name = resolvePushConversationName(
    payload,
    title: title,
    groupDmLabel: pushNotificationLocalizations().notificationGroupDmTitle,
  );
  if (name == null || isDmPushPayload(enrichPushPayload(payload))) {
    return name;
  }
  final String? community = resolvePushCommunityName(payload, title: title);
  return community == null ? '#$name' : '$community #$name';
}

String resolvePushNotificationDisplayTitle(
  Map<String, String> payload, {
  required String? title,
}) {
  final String? conversationTitle = resolvePushMessagingConversationTitle(
    payload,
    title: title,
  );
  if (conversationTitle != null) {
    return conversationTitle;
  }
  return resolvePushSenderName(title ?? payload['title']);
}

List<Message> pushConversationMessages(
  List<PushConversationLine> lines, {
  Map<String, String> imageUris = const <String, String>{},
}) {
  return lines
      .map((PushConversationLine line) {
        final String? imageUri = imageUris[line.imagePath];
        return Message(
          line.body,
          DateTime.fromMillisecondsSinceEpoch(line.timestampMs),
          _personForLine(line),
          dataMimeType: imageUri == null ? null : 'image/jpeg',
          dataUri: imageUri,
        );
      })
      .toList(growable: false);
}

Person _personForLine(PushConversationLine line) {
  final AndroidIcon<String>? icon = line.avatarPath == null
      ? null
      : BitmapFilePathAndroidIcon(line.avatarPath!);
  return Person(name: line.senderName, key: line.senderKey, icon: icon);
}

MessagingStyleInformation buildPushMessagingStyle({
  required Map<String, String> payload,
  required List<PushConversationLine> lines,
  String? title,
  Map<String, String> imageUris = const <String, String>{},
}) {
  return MessagingStyleInformation(
    Person(name: pushNotificationLocalizations().notificationLocalUserName),
    conversationTitle: resolvePushMessagingConversationTitle(
      payload,
      title: title,
    ),
    groupConversation: resolvePushGroupConversation(payload, title: title),
    messages: pushConversationMessages(lines, imageUris: imageUris),
  );
}

AndroidNotificationDetails buildAndroidConversationNotificationDetails({
  required Map<String, String> payload,
  required List<PushConversationLine> lines,
  required String conversationTag,
  required bool alert,
  bool soundEnabled = true,
  String? title,
  int? badgeCount,
  int? whenMillis,
  String? shortcutId,
  String? conversationIconPath,
  Map<String, String> imageUris = const <String, String>{},
}) {
  final PushConversationLine? latest = lines.isEmpty ? null : lines.last;
  final AndroidNotificationSound? androidSound = alert && soundEnabled
      ? resolvePushNotificationAndroidSound(payload)
      : null;
  final String? largeIconPath =
      resolvePushGroupConversation(payload, title: title)
      ? conversationIconPath
      : latest?.avatarPath;
  final FilePathAndroidBitmap? largeIcon = largeIconPath == null
      ? null
      : FilePathAndroidBitmap(largeIconPath);
  return AndroidNotificationDetails(
    androidPushChannelId(payload, soundEnabled: soundEnabled),
    androidPushChannelName(payload, soundEnabled: soundEnabled),
    channelDescription:
        pushNotificationLocalizations().notificationChannelDescription,
    importance: Importance.high,
    priority: Priority.high,
    category: AndroidNotificationCategory.message,
    icon: kAndroidPushNotificationIcon,
    color: kAndroidPushAccentColor,
    largeIcon: largeIcon,
    shortcutId: shortcutId,
    styleInformation: buildPushMessagingStyle(
      payload: payload,
      lines: lines,
      title: title,
      imageUris: imageUris,
    ),
    number: badgeCount,
    tag: conversationTag,
    sound: androidSound,
    playSound: androidSound != null,
    enableVibration: alert,
    onlyAlertOnce: !alert,
    when: whenMillis ?? latest?.timestampMs,
    showWhen: (whenMillis ?? latest?.timestampMs) != null,
  );
}

String? _nonEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }
  return value;
}
