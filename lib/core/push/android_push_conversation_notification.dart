import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluxer_app/core/push/android_push_channels.dart';
import 'package:fluxer_app/core/push/android_push_conversation_history.dart';
import 'package:fluxer_app/core/push/push_notification_payload.dart';
import 'package:fluxer_app/core/push/push_notification_sound.dart';

const String kPushLocalUserPersonName = 'Me';

const Person kPushLocalUserPerson = Person(name: kPushLocalUserPersonName);

String resolvePushSenderName(String? title) {
  final String? messageTitle = _nonEmpty(title);
  if (messageTitle == null) {
    return 'Unknown';
  }
  if (messageTitle.endsWith(' (Group DM)')) {
    return messageTitle.substring(
      0,
      messageTitle.length - ' (Group DM)'.length,
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
  if (messageTitle != null && messageTitle.endsWith(' (Group DM)')) {
    return true;
  }
  return !isDmPushPayload(enrichPushPayload(payload));
}

String? resolvePushMessagingConversationTitle(
  Map<String, String> payload, {
  String? title,
}) {
  if (!resolvePushGroupConversation(payload, title: title)) {
    return null;
  }
  final String? fromPayload = resolvePushConversationName(
    payload,
    title: title,
  );
  if (fromPayload != null) {
    return fromPayload;
  }
  final String? messageTitle = _nonEmpty(title) ?? _nonEmpty(payload['title']);
  if (messageTitle != null && messageTitle.endsWith(' (Group DM)')) {
    return 'Group DM';
  }
  return null;
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

List<Message> pushConversationMessages(List<PushConversationLine> lines) {
  return lines
      .map(
        (PushConversationLine line) => Message(
          line.body,
          DateTime.fromMillisecondsSinceEpoch(line.timestampMs),
          _personForLine(line),
          dataMimeType: line.imagePath == null ? null : 'image/jpeg',
          dataUri: line.imagePath == null
              ? null
              : Uri.file(line.imagePath!).toString(),
        ),
      )
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
}) {
  return MessagingStyleInformation(
    kPushLocalUserPerson,
    conversationTitle: resolvePushMessagingConversationTitle(
      payload,
      title: title,
    ),
    groupConversation: resolvePushGroupConversation(payload, title: title),
    messages: pushConversationMessages(lines),
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
}) {
  final PushConversationLine? latest = lines.isEmpty ? null : lines.last;
  final AndroidNotificationSound? androidSound = alert && soundEnabled
      ? resolvePushNotificationAndroidSound(payload)
      : null;
  final FilePathAndroidBitmap? largeIcon = latest?.avatarPath == null
      ? null
      : FilePathAndroidBitmap(latest!.avatarPath!);
  return AndroidNotificationDetails(
    androidPushChannelId(payload, soundEnabled: soundEnabled),
    androidPushChannelName(payload, soundEnabled: soundEnabled),
    channelDescription: kAndroidPushChannelDescription,
    importance: Importance.high,
    priority: Priority.high,
    category: AndroidNotificationCategory.message,
    icon: kAndroidPushNotificationIcon,
    largeIcon: largeIcon,
    styleInformation: buildPushMessagingStyle(
      payload: payload,
      lines: lines,
      title: title,
    ),
    number: badgeCount,
    tag: conversationTag,
    sound: androidSound,
    playSound: androidSound != null,
    enableVibration: alert,
    silent: !alert,
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
