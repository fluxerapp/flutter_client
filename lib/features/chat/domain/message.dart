import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/features/chat/domain/message_translation.dart';
import 'package:fluxer_app/features/chat/utils/attachment_display_utils.dart';
import 'package:fluxer_app/features/chat/utils/url_sanitization_utils.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart';

enum EmbedType { rich, image, gifv, link, video }

enum MessageDeliveryState { sending, sent, failed }

const int messageFlagSuppressEmbeds = 1 << 2;
const int messageFlagSuppressNotifications = 1 << 12;
const int messageFlagCompactAttachments = 1 << 17;
const int attachmentFlagIsSpoiler = 1 << 3;
const int attachmentFlagContainsExplicitMedia = 1 << 4;

/// Message wire-type constants (mirrors the server's
/// `MessageTypes` enum). Use these everywhere instead of
/// hardcoding the int value.
const int messageTypeDefault = 0;
const int messageTypeRecipientAdd = 1;
const int messageTypeRecipientRemove = 2;
const int messageTypeCall = 3;
const int messageTypeChannelNameChange = 4;
const int messageTypeChannelIconChange = 5;
const int messageTypeChannelPinnedMessage = 6;
const int messageTypeUserJoin = 7;
const int messageTypeReply = 19;
const int messageTypeClientSystem = 99;

class EmbedAuthor {
  final String name;
  final String? url;
  final String? iconUrl;
  final String? proxyIconUrl;

  const EmbedAuthor({
    required this.name,
    this.url,
    this.iconUrl,
    this.proxyIconUrl,
  });

  factory EmbedAuthor.fromSdk(EmbedAuthorResponse sdk) => EmbedAuthor(
    name: sdk.name,
    url: sdk.url,
    iconUrl: sdk.iconUrl,
    proxyIconUrl: sdk.proxyIconUrl,
  );

  factory EmbedAuthor.fromJson(Map<String, dynamic> json) => EmbedAuthor(
    name: json['name'] as String? ?? '',
    url: json['url'] as String?,
    iconUrl: (json['iconUrl'] ?? json['icon_url']) as String?,
    proxyIconUrl: (json['proxyIconUrl'] ?? json['proxy_icon_url']) as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
    'iconUrl': iconUrl,
    'proxyIconUrl': proxyIconUrl,
  };
}

class EmbedFooter {
  final String text;
  final String? iconUrl;
  final String? proxyIconUrl;

  const EmbedFooter({required this.text, this.iconUrl, this.proxyIconUrl});

  factory EmbedFooter.fromSdk(EmbedFooterResponse sdk) => EmbedFooter(
    text: sdk.text,
    iconUrl: sdk.iconUrl,
    proxyIconUrl: sdk.proxyIconUrl,
  );

  factory EmbedFooter.fromJson(Map<String, dynamic> json) => EmbedFooter(
    text: json['text'] as String? ?? '',
    iconUrl: (json['iconUrl'] ?? json['icon_url']) as String?,
    proxyIconUrl: (json['proxyIconUrl'] ?? json['proxy_icon_url']) as String?,
  );

  Map<String, dynamic> toJson() => {
    'text': text,
    'iconUrl': iconUrl,
    'proxyIconUrl': proxyIconUrl,
  };
}

const int kEmbedMediaAnimatedFlag = 1 << 5;

class EmbedMedia {
  final String url;
  final String? proxyUrl;
  final int? width;
  final int? height;
  final String? contentType;
  final String? placeholder;
  final int flags;
  final String? contentHash;

  const EmbedMedia({
    required this.url,
    this.proxyUrl,
    this.width,
    this.height,
    this.contentType,
    this.placeholder,
    this.flags = 0,
    this.contentHash,
  });

  bool get isAnimated =>
      (flags & kEmbedMediaAnimatedFlag) != 0 ||
      contentType?.toLowerCase() == 'image/gif';

  factory EmbedMedia.fromSdk(EmbedMediaResponse sdk) => EmbedMedia(
    url: sdk.url,
    proxyUrl: sdk.proxyUrl,
    width: sdk.width,
    height: sdk.height,
    contentType: sdk.contentType,
    placeholder: sdk.placeholder,
    flags: sdk.flags,
    contentHash: sdk.contentHash,
  );

  factory EmbedMedia.fromJson(Map<String, dynamic> json) => EmbedMedia(
    url: json['url'] as String? ?? '',
    proxyUrl: (json['proxyUrl'] ?? json['proxy_url']) as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
    contentType: (json['contentType'] ?? json['content_type']) as String?,
    placeholder: json['placeholder'] as String?,
    flags: json['flags'] as int? ?? 0,
    contentHash:
        (json['content_hash'] as String?) ?? (json['contentHash'] as String?),
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'proxyUrl': proxyUrl,
    'width': width,
    'height': height,
    'contentType': contentType,
    'placeholder': placeholder,
    'flags': flags,
    if (contentHash != null) 'content_hash': contentHash,
  };
}

class EmbedField {
  final String name;
  final String value;
  final bool isInline;

  const EmbedField({
    required this.name,
    required this.value,
    this.isInline = false,
  });

  factory EmbedField.fromSdk(EmbedFieldResponse sdk) =>
      EmbedField(name: sdk.name, value: sdk.value, isInline: sdk.inline);

  factory EmbedField.fromJson(Map<String, dynamic> json) => EmbedField(
    name: json['name'] as String? ?? '',
    value: json['value'] as String? ?? '',
    isInline: json['inline'] as bool? ?? false,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'value': value,
    'inline': isInline,
  };
}

class Embed {
  final EmbedType type;
  final String? title;
  final String? description;
  final String? url;
  final int? color;
  final String? timestamp;
  final EmbedAuthor? author;
  final EmbedFooter? footer;
  final EmbedMedia? thumbnail;
  final EmbedMedia? image;
  final EmbedMedia? video;
  final List<EmbedField> fields;
  final String? providerName;
  final String? providerUrl;
  final bool? nsfw;

  const Embed({
    required this.type,
    this.title,
    this.description,
    this.url,
    this.color,
    this.timestamp,
    this.author,
    this.footer,
    this.thumbnail,
    this.image,
    this.video,
    this.fields = const [],
    this.providerName,
    this.providerUrl,
    this.nsfw,
  });

  bool get isMatureMedia => nsfw ?? false;

  factory Embed.fromSdk(MessageEmbedResponse sdk) => Embed(
    type: _parseEmbedType(sdk.type),
    title: sdk.title,
    description: sdk.description,
    url: sdk.url,
    color: sdk.color,
    timestamp: sdk.timestamp?.toIso8601String(),
    author: sdk.author != null ? EmbedAuthor.fromSdk(sdk.author!) : null,
    footer: sdk.footer != null ? EmbedFooter.fromSdk(sdk.footer!) : null,
    thumbnail: sdk.thumbnail != null
        ? EmbedMedia.fromSdk(sdk.thumbnail!)
        : null,
    image: sdk.image != null ? EmbedMedia.fromSdk(sdk.image!) : null,
    video: sdk.video != null ? EmbedMedia.fromSdk(sdk.video!) : null,
    fields: sdk.fields?.map(EmbedField.fromSdk).toList() ?? const [],
    providerName: sdk.provider?.name,
    providerUrl: sdk.provider?.url,
    nsfw: sdk.nsfw,
  );

  factory Embed.fromJson(Map<String, dynamic> json) => Embed(
    type: _parseEmbedType(json['type'] as String? ?? 'rich'),
    title: json['title'] as String?,
    description: json['description'] as String?,
    url: json['url'] as String?,
    color: json['color'] as int?,
    timestamp: json['timestamp'] as String?,
    author: json['author'] != null
        ? EmbedAuthor.fromJson(json['author'] as Map<String, dynamic>)
        : null,
    footer: json['footer'] != null
        ? EmbedFooter.fromJson(json['footer'] as Map<String, dynamic>)
        : null,
    thumbnail: json['thumbnail'] != null
        ? EmbedMedia.fromJson(json['thumbnail'] as Map<String, dynamic>)
        : null,
    image: json['image'] != null
        ? EmbedMedia.fromJson(json['image'] as Map<String, dynamic>)
        : null,
    video: json['video'] != null
        ? EmbedMedia.fromJson(json['video'] as Map<String, dynamic>)
        : null,
    fields:
        (json['fields'] as List<dynamic>?)
            ?.map((e) => EmbedField.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [],
    providerName:
        (json['providerName'] as String?) ??
        ((json['provider'] as Map<String, dynamic>?)?['name'] as String?),
    providerUrl:
        (json['providerUrl'] as String?) ??
        ((json['provider'] as Map<String, dynamic>?)?['url'] as String?),
    nsfw: json['nsfw'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'type': type.name,
    'title': title,
    'description': description,
    'url': url,
    'color': color,
    'timestamp': timestamp,
    'author': author?.toJson(),
    'footer': footer?.toJson(),
    'thumbnail': thumbnail?.toJson(),
    'image': image?.toJson(),
    'video': video?.toJson(),
    'fields': fields.map((f) => f.toJson()).toList(),
    'providerName': providerName,
    'providerUrl': providerUrl,
    'nsfw': nsfw,
  };

  static EmbedType _parseEmbedType(String type) => switch (type) {
    'image' => EmbedType.image,
    'gifv' => EmbedType.gifv,
    'link' => EmbedType.link,
    'video' => EmbedType.video,
    _ => EmbedType.rich,
  };
}

class Attachment {
  final String id;
  final String filename;
  final String? title;
  final String? description;
  final String url;
  final String? proxyUrl;
  final String? contentType;
  final String? placeholder;
  final int? size;
  final int? width;
  final int? height;
  final int flags;
  final bool? nsfw;
  final bool? expired;
  final DateTime? expiresAt;
  final int? duration;
  final String? waveform;
  final String? contentHash;

  const Attachment({
    required this.id,
    required this.filename,
    required this.url,
    this.title,
    this.description,
    this.proxyUrl,
    this.contentType,
    this.placeholder,
    this.nsfw,
    this.expired,
    this.expiresAt,
    this.size,
    this.width,
    this.height,
    this.flags = 0,
    this.duration,
    this.waveform,
    this.contentHash,
  });

  factory Attachment.fromSdk(MessageAttachmentResponse sdk) {
    return Attachment(
      id: sdk.id,
      filename: sdk.filename,
      title: sdk.title,
      description: sdk.description,
      url: sdk.url ?? '',
      proxyUrl: sdk.proxyUrl,
      size: sdk.size,
      width: sdk.width,
      height: sdk.height,
      contentType: sdk.contentType,
      placeholder: sdk.placeholder,
      flags: sdk.flags,
      nsfw: sdk.nsfw,
      expired: sdk.expired,
      expiresAt: DateTime.tryParse(sdk.expiresAt ?? ''),
      duration: sdk.duration,
      waveform: sdk.waveform,
      contentHash: sdk.contentHash,
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
      title: json['title'] as String?,
      description: json['description'] as String?,
      url: json['url'] as String? ?? '',
      proxyUrl: (json['proxy_url'] as String?) ?? (json['proxyUrl'] as String?),
      size: json['size'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      contentType: json['content_type'] as String?,
      placeholder: json['placeholder'] as String?,
      flags: json['flags'] as int? ?? 0,
      nsfw: json['nsfw'] as bool?,
      expired: json['expired'] as bool?,
      expiresAt: DateTime.tryParse((json['expires_at'] as String?) ?? ''),
      duration: json['duration'] as int?,
      waveform: json['waveform'] as String?,
      contentHash:
          (json['content_hash'] as String?) ?? (json['contentHash'] as String?),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'filename': filename,
    'title': title,
    'description': description,
    'url': url,
    'proxy_url': proxyUrl,
    'size': size,
    'width': width,
    'height': height,
    'content_type': contentType,
    'placeholder': placeholder,
    'flags': flags,
    'nsfw': nsfw,
    'expired': expired,
    'expires_at': expiresAt?.toIso8601String(),
    if (duration != null) 'duration': duration,
    if (waveform != null) 'waveform': waveform,
    if (contentHash != null) 'content_hash': contentHash,
  };

  Attachment copyWithDescription(String? description) {
    return Attachment(
      id: id,
      filename: filename,
      title: title,
      description: description,
      url: url,
      proxyUrl: proxyUrl,
      contentType: contentType,
      placeholder: placeholder,
      size: size,
      width: width,
      height: height,
      flags: flags,
      nsfw: nsfw,
      expired: expired,
      expiresAt: expiresAt,
      duration: duration,
      waveform: waveform,
      contentHash: contentHash,
    );
  }

  bool get isAudio {
    final String normalizedType = contentType?.toLowerCase() ?? '';
    if (normalizedType.startsWith('audio/')) {
      return true;
    }
    final String lowerFilename = filename.toLowerCase();
    return lowerFilename.endsWith('.mp3') ||
        lowerFilename.endsWith('.wav') ||
        lowerFilename.endsWith('.ogg') ||
        lowerFilename.endsWith('.m4a') ||
        lowerFilename.endsWith('.flac') ||
        lowerFilename.endsWith('.aac');
  }

  bool get isImage =>
      isImageAttachment(filename: filename, contentType: contentType);

  bool get isAnimated =>
      contentType?.toLowerCase() == 'image/gif' ||
      filename.toLowerCase().endsWith('.gif');

  bool get isVideo {
    if (contentType?.startsWith('video/') ?? false) {
      return true;
    }
    final ext = filename.split('.').last.toLowerCase();
    return ['mp4', 'webm', 'mov', 'm4v', 'mkv'].contains(ext);
  }

  bool get isPreviewMedia => isImage || isVideo;
  bool get isSavableMedia => isImage || isVideo || isAudio;
  bool get isSpoiler => (flags & attachmentFlagIsSpoiler) != 0;
  bool get isMatureMedia =>
      (nsfw ?? false) || (flags & attachmentFlagContainsExplicitMedia) != 0;
}

class MessageSticker {
  const MessageSticker({
    required this.id,
    required this.name,
    required this.animated,
  });

  factory MessageSticker.fromSdk(MessageStickerResponse sdk) =>
      MessageSticker(id: sdk.id, name: sdk.name, animated: sdk.animated);

  factory MessageSticker.fromJson(Map<String, dynamic> json) => MessageSticker(
    id: json['id'] as String? ?? '',
    name: json['name'] as String? ?? '',
    animated: json['animated'] as bool? ?? false,
  );

  final String id;
  final String name;
  final bool animated;

  String get url => urlForSize(320);

  String urlForSize(int size) =>
      FluxerMediaUrl.sticker(id: id, animated: animated, size: size);

  String cacheKeyForSize(int size) =>
      'message_sticker_${id}_${animated ? 'a' : 's'}_$size';

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'animated': animated,
  };
}

class Reaction {
  final String emoji;
  final String? emojiId;
  final bool animated;
  final int count;
  final bool hasReacted;

  const Reaction({
    required this.emoji,
    required this.count,
    this.emojiId,
    this.animated = false,
    this.hasReacted = false,
  });

  factory Reaction.fromSdk(MessageReactionResponse sdk) {
    return Reaction(
      emoji: sdk.emoji.name,
      emojiId: sdk.emoji.id,
      animated: sdk.emoji.animated ?? false,
      count: sdk.count,
      hasReacted: sdk.me ?? false,
    );
  }

  factory Reaction.fromJson(Map<String, dynamic> json) {
    return Reaction(
      emoji: json['emoji'] as String? ?? '',
      emojiId: json['emojiId'] as String?,
      animated: json['animated'] as bool? ?? false,
      count: json['count'] as int? ?? 0,
      hasReacted: json['hasReacted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'emoji': emoji,
    'emojiId': emojiId,
    'animated': animated,
    'count': count,
    'hasReacted': hasReacted,
  };

  bool get isCustom => emojiId != null;

  /// Encoded emoji param for the reaction API.
  String get apiParam => isCustom ? '$emoji:$emojiId' : emoji;

  /// Key for frecency tracking.
  String get frecencyKey => isCustom ? 'custom:$emojiId' : 'unicode:$emoji';
}

class MessageReference {
  final String channelId;
  final String messageId;
  final String? guildId;
  final MessageReferenceType type;

  const MessageReference({
    required this.channelId,
    required this.messageId,
    required this.type,
    this.guildId,
  });

  // The regenerated SDK emits a distinct message-reference type per parent
  // schema (message, pinned message, search result). Their shapes are
  // identical, so each call site uses its own thin adapter.
  factory MessageReference.fromSdk(MessageResponseSchemaMessageReference sdk) {
    return MessageReference(
      channelId: sdk.channelId,
      messageId: sdk.messageId,
      guildId: sdk.guildId,
      type: sdk.type,
    );
  }

  factory MessageReference.fromPinSdk(
    ChannelPinResponseMessageMessageReference sdk,
  ) {
    return MessageReference(
      channelId: sdk.channelId,
      messageId: sdk.messageId,
      guildId: sdk.guildId,
      type: sdk.type,
    );
  }

  factory MessageReference.fromSearchSdk(
    MessageSearchResultsResponseMessagesMessageReference sdk,
  ) {
    return MessageReference(
      channelId: sdk.channelId,
      messageId: sdk.messageId,
      guildId: sdk.guildId,
      type: sdk.type,
    );
  }

  factory MessageReference.fromJson(Map<String, dynamic> json) {
    return MessageReference(
      channelId: json['channel_id'] as String? ?? '',
      messageId: json['message_id'] as String? ?? '',
      guildId: json['guild_id'] as String?,
      type: MessageReferenceType.fromJson(json['type'] as int? ?? 0),
    );
  }

  Map<String, dynamic> toJson() => {
    'channel_id': channelId,
    'message_id': messageId,
    'guild_id': guildId,
    'type': type.toJson(),
  };

  bool get isForward => type == MessageReferenceType.forward;
}

class MessageChannelMention {
  const MessageChannelMention({
    required this.id,
    required this.name,
    required this.type,
  });

  final String id;
  final String name;
  final int type;

  factory MessageChannelMention.fromSdk(MessageChannelMentionResponse sdk) {
    return MessageChannelMention(id: sdk.id, name: sdk.name, type: sdk.type);
  }

  factory MessageChannelMention.fromJson(Map<String, dynamic> json) {
    return MessageChannelMention(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as int,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'type': type,
  };
}

List<MessageChannelMention> parseMessageChannelMentions(
  List<MessageChannelMentionResponse>? mentions,
) {
  if (mentions == null || mentions.isEmpty) {
    return const <MessageChannelMention>[];
  }
  return mentions.map(MessageChannelMention.fromSdk).toList(growable: false);
}

({
  bool mentionEveryone,
  List<String> mentionedUserIds,
  List<String> mentionRoles,
})
messageMentionMetadataFromSdk({
  required bool mentionEveryone,
  required Iterable<String> mentionedUserIds,
  required List<String> mentionRoles,
}) {
  return (
    mentionEveryone: mentionEveryone,
    mentionedUserIds: mentionedUserIds.toList(growable: false),
    mentionRoles: List<String>.from(mentionRoles),
  );
}

class MessageSnapshot {
  final String content;
  final DateTime timestamp;
  final DateTime? editedTimestamp;
  final List<String> mentions;
  final List<String> mentionRoles;
  final List<MessageChannelMention> mentionChannels;
  final List<Embed> embeds;
  final List<Attachment> attachments;
  final List<MessageSticker> stickers;
  final int flags;

  const MessageSnapshot({
    required this.timestamp,
    this.content = '',
    this.editedTimestamp,
    this.mentions = const [],
    this.mentionRoles = const [],
    this.mentionChannels = const [],
    this.embeds = const [],
    this.attachments = const [],
    this.stickers = const [],
    this.flags = 0,
  });

  factory MessageSnapshot.fromSdk(MessageSnapshotResponse sdk) {
    return MessageSnapshot(
      content: sdk.content ?? '',
      timestamp: sdk.timestamp,
      editedTimestamp: sdk.editedTimestamp,
      mentions: sdk.mentions ?? const [],
      mentionRoles: sdk.mentionRoles ?? const [],
      mentionChannels: parseMessageChannelMentions(sdk.mentionChannels),
      embeds: sdk.embeds?.map(Embed.fromSdk).toList() ?? const [],
      attachments:
          sdk.attachments?.map(Attachment.fromSdk).toList() ?? const [],
      stickers: sdk.stickers?.map(MessageSticker.fromSdk).toList() ?? const [],
      flags: sdk.flags,
    );
  }

  factory MessageSnapshot.fromJson(Map<String, dynamic> json) {
    return MessageSnapshot(
      content: json['content'] as String? ?? '',
      timestamp:
          DateTime.tryParse(json['timestamp'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      editedTimestamp: DateTime.tryParse(
        json['edited_timestamp'] as String? ?? '',
      ),
      mentions:
          (json['mentions'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      mentionRoles:
          (json['mention_roles'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          const [],
      mentionChannels:
          (json['mention_channels'] as List<dynamic>?)
              ?.map(
                (dynamic e) =>
                    MessageChannelMention.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
      embeds:
          (json['embeds'] as List<dynamic>?)
              ?.map((e) => Embed.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stickers:
          (json['stickers'] as List<dynamic>?)
              ?.map((e) => MessageSticker.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      flags: json['flags'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content,
    'timestamp': timestamp.toIso8601String(),
    'edited_timestamp': editedTimestamp?.toIso8601String(),
    'mentions': mentions,
    'mention_roles': mentionRoles,
    'mention_channels': mentionChannels.map((e) => e.toJson()).toList(),
    'embeds': embeds.map((e) => e.toJson()).toList(),
    'attachments': attachments.map((a) => a.toJson()).toList(),
    'stickers': stickers.map((s) => s.toJson()).toList(),
    'flags': flags,
  };

  bool get hasCompactAttachments =>
      (flags & messageFlagCompactAttachments) != 0;
}

class MessageCall {
  final List<String> participants;
  final DateTime? endedTimestamp;

  const MessageCall({required this.participants, this.endedTimestamp});

  factory MessageCall.fromSdk({
    required List<String> participants,
    DateTime? endedTimestamp,
  }) {
    return MessageCall(
      participants: participants,
      endedTimestamp: endedTimestamp,
    );
  }

  factory MessageCall.fromJson(Map<String, dynamic> json) {
    return MessageCall(
      participants:
          (json['participants'] as List<dynamic>?)
              ?.map((dynamic value) => value as String)
              .toList() ??
          const <String>[],
      endedTimestamp: json['ended_timestamp'] == null
          ? null
          : DateTime.parse(json['ended_timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'participants': participants,
    if (endedTimestamp != null)
      'ended_timestamp': endedTimestamp!.toIso8601String(),
  };

  bool get isEnded => endedTimestamp != null;
}

MessageCall? messageCallFromSdk(MessageResponseSchemaCall? call) {
  if (call == null) {
    return null;
  }
  return MessageCall.fromSdk(
    participants: call.participants,
    endedTimestamp: call.endedTimestamp,
  );
}

MessageCall? messageCallFromPinSdk(ChannelPinResponseMessageCall? call) {
  if (call == null) {
    return null;
  }
  return MessageCall.fromSdk(
    participants: call.participants,
    endedTimestamp: call.endedTimestamp,
  );
}

MessageCall? messageCallFromReferencedSdk(
  MessageResponseSchemaReferencedMessageCall? call,
) {
  if (call == null) {
    return null;
  }
  return MessageCall.fromSdk(
    participants: call.participants,
    endedTimestamp: call.endedTimestamp,
  );
}

MessageCall? messageCallFromSearchSdk(
  MessageSearchResultsResponseMessagesCall? call,
) {
  if (call == null) {
    return null;
  }
  return MessageCall.fromSdk(
    participants: call.participants,
    endedTimestamp: call.endedTimestamp,
  );
}

bool isKnownSystemMessageType(int type) {
  return switch (type) {
    messageTypeRecipientAdd ||
    messageTypeRecipientRemove ||
    messageTypeCall ||
    messageTypeChannelNameChange ||
    messageTypeChannelIconChange ||
    messageTypeChannelPinnedMessage ||
    messageTypeUserJoin => true,
    _ => false,
  };
}

class Message {
  final String id;
  final String channelId;
  final String authorId;
  final String authorName;
  final String? authorAvatar;
  final int? authorAvatarColor;
  final bool authorIsBot;
  final bool authorIsSystem;
  final int authorPublicFlags;
  final String? webhookId;
  final String content;
  final DateTime timestamp;
  final DateTime? editedTimestamp;
  final List<Embed> embeds;
  final List<Attachment> attachments;
  final List<MessageSticker> stickers;
  final List<Reaction> reactions;
  final String? replyToId;
  final String? forwardedFrom;
  final MessageReference? messageReference;
  final List<MessageSnapshot> messageSnapshots;
  final bool isPinned;
  final bool isMentioned;
  final bool mentionEveryone;
  final List<String> mentionedUserIds;
  final List<String> mentionRoles;
  final List<String> supplementalUserIds;
  final List<MessageChannelMention> mentionChannels;
  final int type;
  final int flags;
  final MessageDeliveryState deliveryState;
  final String? clientNonce;
  final String? sendError;
  final MessageCall? call;
  final bool tts;
  final MessageTranslation? translation;

  const Message({
    required this.id,
    required this.channelId,
    required this.authorId,
    required this.authorName,
    required this.content,
    required this.timestamp,
    this.authorAvatar,
    this.authorAvatarColor,
    this.authorIsBot = false,
    this.authorIsSystem = false,
    this.authorPublicFlags = 0,
    this.webhookId,
    this.editedTimestamp,
    this.embeds = const [],
    this.attachments = const [],
    this.stickers = const [],
    this.reactions = const [],
    this.replyToId,
    this.forwardedFrom,
    this.messageReference,
    this.messageSnapshots = const [],
    this.isPinned = false,
    this.isMentioned = false,
    this.mentionEveryone = false,
    this.mentionedUserIds = const [],
    this.mentionRoles = const [],
    this.supplementalUserIds = const [],
    this.mentionChannels = const [],
    this.type = 0,
    this.flags = 0,
    this.deliveryState = MessageDeliveryState.sent,
    this.clientNonce,
    this.sendError,
    this.call,
    this.tts = false,
    this.translation,
  });

  factory Message.fromSdk(MessageResponseSchema sdk, {String? currentUserId}) {
    final isMentioned =
        sdk.mentionEveryone ||
        (currentUserId != null &&
            (sdk.mentions.any((u) => u.id == currentUserId)));
    final ({
      bool mentionEveryone,
      List<String> mentionedUserIds,
      List<String> mentionRoles,
    })
    mentionMetadata = messageMentionMetadataFromSdk(
      mentionEveryone: sdk.mentionEveryone,
      mentionedUserIds: sdk.mentions.map((user) => user.id),
      mentionRoles: sdk.mentionRoles,
    );

    return Message(
      id: sdk.id,
      channelId: sdk.channelId,
      authorId: sdk.author.id,
      authorName: resolveMessageAuthorName(sdk.author),
      authorAvatar: sdk.author.avatar,
      authorAvatarColor: sdk.author.avatarColor,
      authorIsBot: sdk.author.bot ?? false,
      authorIsSystem: sdk.author.system ?? false,
      authorPublicFlags: sdk.author.flags,
      webhookId: sdk.webhookId,
      content: sdk.content,
      timestamp: sdk.timestamp,
      editedTimestamp: sdk.editedTimestamp,
      embeds: sdk.embeds?.map(Embed.fromSdk).toList() ?? const [],
      attachments:
          sdk.attachments?.map(Attachment.fromSdk).toList() ?? const [],
      stickers: sdk.stickers?.map(MessageSticker.fromSdk).toList() ?? const [],
      reactions: sdk.reactions?.map(Reaction.fromSdk).toList() ?? const [],
      replyToId: sdk.messageReference?.messageId ?? sdk.referencedMessage?.id,
      messageReference: sdk.messageReference != null
          ? MessageReference.fromSdk(sdk.messageReference!)
          : null,
      messageSnapshots:
          sdk.messageSnapshots?.map(MessageSnapshot.fromSdk).toList() ??
          const [],
      isPinned: sdk.pinned,
      isMentioned: isMentioned,
      mentionEveryone: mentionMetadata.mentionEveryone,
      mentionedUserIds: mentionMetadata.mentionedUserIds,
      mentionRoles: mentionMetadata.mentionRoles,
      supplementalUserIds: supplementalUserIdsFromSdk(sdk.users),
      mentionChannels: parseMessageChannelMentions(sdk.mentionChannels),
      type: sdk.type.json ?? 0,
      flags: sdk.flags,
      clientNonce: sdk.nonce,
      call: messageCallFromSdk(sdk.call),
      tts: sdk.tts,
    );
  }

  factory Message.fromReferencedSdk(
    MessageResponseSchemaReferencedMessage sdk, {
    String? currentUserId,
  }) {
    final isMentioned =
        sdk.mentionEveryone ||
        (currentUserId != null &&
            (sdk.mentions.any((u) => u.id == currentUserId)));
    final ({
      bool mentionEveryone,
      List<String> mentionedUserIds,
      List<String> mentionRoles,
    })
    mentionMetadata = messageMentionMetadataFromSdk(
      mentionEveryone: sdk.mentionEveryone,
      mentionedUserIds: sdk.mentions.map((user) => user.id),
      mentionRoles: sdk.mentionRoles,
    );

    return Message(
      id: sdk.id,
      channelId: sdk.channelId,
      authorId: sdk.author.id,
      authorName: resolveMessageAuthorName(sdk.author),
      authorAvatar: sdk.author.avatar,
      authorAvatarColor: sdk.author.avatarColor,
      authorIsBot: sdk.author.bot ?? false,
      authorIsSystem: sdk.author.system ?? false,
      authorPublicFlags: sdk.author.flags,
      webhookId: sdk.webhookId,
      content: sdk.content,
      timestamp: sdk.timestamp,
      editedTimestamp: sdk.editedTimestamp,
      embeds: sdk.embeds?.map(Embed.fromSdk).toList() ?? const [],
      attachments:
          sdk.attachments?.map(Attachment.fromSdk).toList() ?? const [],
      stickers: sdk.stickers?.map(MessageSticker.fromSdk).toList() ?? const [],
      reactions: sdk.reactions?.map(Reaction.fromSdk).toList() ?? const [],
      isPinned: sdk.pinned,
      isMentioned: isMentioned,
      mentionEveryone: mentionMetadata.mentionEveryone,
      mentionedUserIds: mentionMetadata.mentionedUserIds,
      mentionRoles: mentionMetadata.mentionRoles,
      supplementalUserIds: supplementalUserIdsFromSdk(sdk.users),
      mentionChannels: parseMessageChannelMentions(sdk.mentionChannels),
      type: sdk.type.json ?? 0,
      flags: sdk.flags,
      call: messageCallFromReferencedSdk(sdk.call),
    );
  }

  factory Message.fromPinnedMessage(
    ChannelPinResponseMessage sdk, {
    String? currentUserId,
  }) {
    final isMentioned =
        sdk.mentionEveryone ||
        (currentUserId != null &&
            (sdk.mentions.any((u) => u.id == currentUserId)));
    final ({
      bool mentionEveryone,
      List<String> mentionedUserIds,
      List<String> mentionRoles,
    })
    mentionMetadata = messageMentionMetadataFromSdk(
      mentionEveryone: sdk.mentionEveryone,
      mentionedUserIds: sdk.mentions.map((user) => user.id),
      mentionRoles: sdk.mentionRoles,
    );

    return Message(
      id: sdk.id,
      channelId: sdk.channelId,
      authorId: sdk.author.id,
      authorName: resolveMessageAuthorName(sdk.author),
      authorAvatar: sdk.author.avatar,
      authorAvatarColor: sdk.author.avatarColor,
      authorIsBot: sdk.author.bot ?? false,
      authorIsSystem: sdk.author.system ?? false,
      authorPublicFlags: sdk.author.flags,
      webhookId: sdk.webhookId,
      content: sdk.content,
      timestamp: sdk.timestamp,
      editedTimestamp: sdk.editedTimestamp,
      embeds: sdk.embeds?.map(Embed.fromSdk).toList() ?? const [],
      attachments:
          sdk.attachments?.map(Attachment.fromSdk).toList() ?? const [],
      stickers: sdk.stickers?.map(MessageSticker.fromSdk).toList() ?? const [],
      replyToId: sdk.messageReference?.messageId,
      messageReference: sdk.messageReference != null
          ? MessageReference.fromPinSdk(sdk.messageReference!)
          : null,
      messageSnapshots:
          sdk.messageSnapshots?.map(MessageSnapshot.fromSdk).toList() ??
          const [],
      isPinned: sdk.pinned,
      isMentioned: isMentioned,
      mentionEveryone: mentionMetadata.mentionEveryone,
      mentionedUserIds: mentionMetadata.mentionedUserIds,
      mentionRoles: mentionMetadata.mentionRoles,
      supplementalUserIds: supplementalUserIdsFromSdk(sdk.users),
      mentionChannels: parseMessageChannelMentions(sdk.mentionChannels),
      type: sdk.type.json ?? 0,
      flags: sdk.flags,
      clientNonce: sdk.nonce,
      call: messageCallFromPinSdk(sdk.call),
    );
  }

  factory Message.fromSearchResult(
    MessageSearchResultsResponseMessages sdk, {
    String? currentUserId,
  }) {
    final isMentioned =
        sdk.mentionEveryone ||
        (currentUserId != null &&
            (sdk.mentions.any((u) => u.id == currentUserId)));
    final ({
      bool mentionEveryone,
      List<String> mentionedUserIds,
      List<String> mentionRoles,
    })
    mentionMetadata = messageMentionMetadataFromSdk(
      mentionEveryone: sdk.mentionEveryone,
      mentionedUserIds: sdk.mentions.map((user) => user.id),
      mentionRoles: sdk.mentionRoles,
    );

    return Message(
      id: sdk.id,
      channelId: sdk.channelId,
      authorId: sdk.author.id,
      authorName: resolveMessageAuthorName(sdk.author),
      authorAvatar: sdk.author.avatar,
      authorAvatarColor: sdk.author.avatarColor,
      authorIsBot: sdk.author.bot ?? false,
      authorIsSystem: sdk.author.system ?? false,
      authorPublicFlags: sdk.author.flags,
      webhookId: sdk.webhookId,
      content: sdk.content,
      timestamp: sdk.timestamp,
      editedTimestamp: sdk.editedTimestamp,
      embeds: sdk.embeds?.map(Embed.fromSdk).toList() ?? const [],
      attachments:
          sdk.attachments?.map(Attachment.fromSdk).toList() ?? const [],
      stickers: sdk.stickers?.map(MessageSticker.fromSdk).toList() ?? const [],
      reactions: sdk.reactions?.map(Reaction.fromSdk).toList() ?? const [],
      replyToId: sdk.messageReference?.messageId,
      messageReference: sdk.messageReference != null
          ? MessageReference.fromSearchSdk(sdk.messageReference!)
          : null,
      messageSnapshots:
          sdk.messageSnapshots?.map(MessageSnapshot.fromSdk).toList() ??
          const [],
      isPinned: sdk.pinned,
      isMentioned: isMentioned,
      mentionEveryone: mentionMetadata.mentionEveryone,
      mentionedUserIds: mentionMetadata.mentionedUserIds,
      mentionRoles: mentionMetadata.mentionRoles,
      supplementalUserIds: supplementalUserIdsFromSdk(sdk.users),
      mentionChannels: parseMessageChannelMentions(sdk.mentionChannels),
      type: sdk.type.json ?? 0,
      flags: sdk.flags,
      clientNonce: sdk.nonce,
      call: messageCallFromSearchSdk(sdk.call),
    );
  }

  factory Message.fromRow(db.Message row) {
    return Message(
      id: row.id,
      channelId: row.channelId,
      authorId: row.authorId,
      authorName: row.authorName.isNotEmpty ? row.authorName : row.authorId,
      authorAvatar: row.authorAvatar,
      authorAvatarColor: row.authorAvatarColor,
      authorIsBot: row.authorIsBot,
      authorIsSystem: row.authorIsSystem,
      authorPublicFlags: row.authorPublicFlags,
      webhookId: row.webhookId,
      content: row.content,
      timestamp: row.timestamp,
      editedTimestamp: row.editedTimestamp,
      embeds: _decodeList(row.embedsJson, Embed.fromJson),
      attachments: _decodeList(row.attachmentsJson, Attachment.fromJson),
      stickers: _decodeList(row.stickersJson, MessageSticker.fromJson),
      reactions: _decodeList(row.reactionsJson, Reaction.fromJson),
      replyToId: row.replyToId,
      forwardedFrom: row.forwardedFrom,
      messageReference: row.messageReferenceJson == null
          ? null
          : MessageReference.fromJson(
              jsonDecode(row.messageReferenceJson!) as Map<String, dynamic>,
            ),
      messageSnapshots: _decodeList(
        row.messageSnapshotsJson,
        MessageSnapshot.fromJson,
      ),
      isPinned: row.pinned,
      isMentioned: row.isMentioned,
      mentionedUserIds: _decodeStringList(row.mentionedUserIdsJson),
      mentionChannels: _decodeList(
        row.mentionChannelsJson,
        MessageChannelMention.fromJson,
      ),
      type: row.type,
      flags: row.flags,
      deliveryState: MessageDeliveryState.values[row.deliveryState],
      clientNonce: row.clientNonce,
      sendError: row.sendError,
      call: row.callJson == null
          ? null
          : MessageCall.fromJson(
              jsonDecode(row.callJson!) as Map<String, dynamic>,
            ),
      translation: translationFromRow(row),
    );
  }

  static MessageTranslation? translationFromRow(db.Message row) {
    return MessageTranslation.tryParse(
      translatedContent: row.translatedContent,
      sourceLanguage: row.translationSourceLanguage,
      sourceContent: row.translatedSourceContent,
      targetLanguage: row.translationTargetLanguage,
      showOriginal: row.translationShowOriginal,
    );
  }

  Message withStoredTranslation(MessageTranslationSnapshot? snapshot) {
    if (snapshot == null || snapshot.content != content) {
      return translation == null ? this : copyWith(translation: null);
    }
    return copyWith(translation: snapshot.translation);
  }

  /// Whether [other] renders identically, so the merge can reuse this instance
  /// and preserve the row's tile cache.
  bool isRenderEquivalent(Message other) {
    if (identical(this, other)) {
      return true;
    }
    return id == other.id &&
        channelId == other.channelId &&
        authorId == other.authorId &&
        authorName == other.authorName &&
        authorAvatar == other.authorAvatar &&
        authorAvatarColor == other.authorAvatarColor &&
        authorIsBot == other.authorIsBot &&
        authorIsSystem == other.authorIsSystem &&
        authorPublicFlags == other.authorPublicFlags &&
        webhookId == other.webhookId &&
        content == other.content &&
        timestamp == other.timestamp &&
        editedTimestamp == other.editedTimestamp &&
        replyToId == other.replyToId &&
        forwardedFrom == other.forwardedFrom &&
        isPinned == other.isPinned &&
        isMentioned == other.isMentioned &&
        mentionEveryone == other.mentionEveryone &&
        type == other.type &&
        flags == other.flags &&
        deliveryState == other.deliveryState &&
        clientNonce == other.clientNonce &&
        sendError == other.sendError &&
        _callEquals(call, other.call) &&
        _encodedListEquals<Embed>(embeds, other.embeds, (e) => e.toJson()) &&
        _encodedListEquals<Attachment>(
          attachments,
          other.attachments,
          (a) => a.toJson(),
        ) &&
        _encodedListEquals<MessageSticker>(
          stickers,
          other.stickers,
          (s) => s.toJson(),
        ) &&
        _encodedListEquals<Reaction>(
          reactions,
          other.reactions,
          (r) => r.toJson(),
        ) &&
        _encodedListEquals<MessageSnapshot>(
          messageSnapshots,
          other.messageSnapshots,
          (s) => s.toJson(),
        ) &&
        _referenceEquals(messageReference, other.messageReference) &&
        _stringListEquals(mentionedUserIds, other.mentionedUserIds) &&
        _stringListEquals(mentionRoles, other.mentionRoles) &&
        _encodedListEquals<MessageChannelMention>(
          mentionChannels,
          other.mentionChannels,
          (mention) => mention.toJson(),
        ) &&
        _translationEquals(translation, other.translation);
  }

  static bool _translationEquals(MessageTranslation? a, MessageTranslation? b) {
    if (identical(a, b)) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }
    return a.translatedContent == b.translatedContent &&
        a.sourceLanguageCode == b.sourceLanguageCode &&
        a.sourceContent == b.sourceContent &&
        a.targetLanguageCode == b.targetLanguageCode &&
        a.showOriginal == b.showOriginal;
  }

  static bool _encodedListEquals<T>(
    List<T> a,
    List<T> b,
    Map<String, dynamic> Function(T) toJson,
  ) {
    if (identical(a, b)) {
      return true;
    }
    if (a.length != b.length) {
      return false;
    }
    if (a.isEmpty) {
      return true;
    }
    return jsonEncode(a.map(toJson).toList()) ==
        jsonEncode(b.map(toJson).toList());
  }

  static bool _referenceEquals(MessageReference? a, MessageReference? b) {
    if (identical(a, b)) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }
    return jsonEncode(a.toJson()) == jsonEncode(b.toJson());
  }

  static bool _callEquals(MessageCall? a, MessageCall? b) {
    if (identical(a, b)) {
      return true;
    }
    if (a == null || b == null) {
      return false;
    }
    return jsonEncode(a.toJson()) == jsonEncode(b.toJson());
  }

  static bool _stringListEquals(List<String> a, List<String> b) {
    if (identical(a, b)) {
      return true;
    }
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }

  db.MessagesCompanion toCompanion() {
    return db.MessagesCompanion.insert(
      id: id,
      channelId: channelId,
      authorId: authorId,
      authorName: Value(authorName),
      authorAvatar: Value(authorAvatar),
      authorAvatarColor: Value(authorAvatarColor),
      authorIsBot: Value(authorIsBot),
      authorIsSystem: Value(authorIsSystem),
      authorPublicFlags: Value(authorPublicFlags),
      webhookId: Value(webhookId),
      content: content,
      timestamp: timestamp,
      editedTimestamp: Value(editedTimestamp),
      embedsJson: Value(jsonEncode(embeds.map((e) => e.toJson()).toList())),
      attachmentsJson: Value(
        jsonEncode(attachments.map((a) => a.toJson()).toList()),
      ),
      stickersJson: Value(jsonEncode(stickers.map((s) => s.toJson()).toList())),
      reactionsJson: Value(
        jsonEncode(reactions.map((r) => r.toJson()).toList()),
      ),
      replyToId: Value(replyToId),
      forwardedFrom: Value(forwardedFrom),
      messageReferenceJson: Value(
        messageReference == null
            ? null
            : jsonEncode(messageReference!.toJson()),
      ),
      messageSnapshotsJson: Value(
        jsonEncode(messageSnapshots.map((s) => s.toJson()).toList()),
      ),
      pinned: Value(isPinned),
      isMentioned: Value(isMentioned),
      mentionedUserIdsJson: Value(jsonEncode(mentionedUserIds)),
      mentionChannelsJson: Value(
        jsonEncode(mentionChannels.map((mention) => mention.toJson()).toList()),
      ),
      type: Value(type),
      flags: Value(flags),
      deliveryState: Value(deliveryState.index),
      clientNonce: Value(clientNonce),
      sendError: Value(sendError),
      callJson: Value(call == null ? null : jsonEncode(call!.toJson())),
    );
  }

  Message copyWith({
    String? id,
    String? channelId,
    String? authorId,
    String? authorName,
    String? authorAvatar,
    int? authorAvatarColor,
    bool? authorIsBot,
    bool? authorIsSystem,
    int? authorPublicFlags,
    Object? webhookId = _unset,
    String? content,
    DateTime? timestamp,
    DateTime? editedTimestamp,
    List<Embed>? embeds,
    List<Attachment>? attachments,
    List<MessageSticker>? stickers,
    List<Reaction>? reactions,
    String? replyToId,
    String? forwardedFrom,
    MessageReference? messageReference,
    List<MessageSnapshot>? messageSnapshots,
    bool? isPinned,
    bool? isMentioned,
    bool? mentionEveryone,
    List<String>? mentionedUserIds,
    List<String>? mentionRoles,
    List<String>? supplementalUserIds,
    List<MessageChannelMention>? mentionChannels,
    int? type,
    int? flags,
    MessageDeliveryState? deliveryState,
    Object? clientNonce = _unset,
    Object? sendError = _unset,
    Object? call = _unset,
    bool? tts,
    Object? translation = _unset,
  }) {
    return Message(
      id: id ?? this.id,
      channelId: channelId ?? this.channelId,
      authorId: authorId ?? this.authorId,
      authorName: authorName ?? this.authorName,
      authorAvatar: authorAvatar ?? this.authorAvatar,
      authorAvatarColor: authorAvatarColor ?? this.authorAvatarColor,
      authorIsBot: authorIsBot ?? this.authorIsBot,
      authorIsSystem: authorIsSystem ?? this.authorIsSystem,
      authorPublicFlags: authorPublicFlags ?? this.authorPublicFlags,
      webhookId: webhookId == _unset ? this.webhookId : webhookId as String?,
      content: content ?? this.content,
      timestamp: timestamp ?? this.timestamp,
      editedTimestamp: editedTimestamp ?? this.editedTimestamp,
      embeds: embeds ?? this.embeds,
      attachments: attachments ?? this.attachments,
      stickers: stickers ?? this.stickers,
      reactions: reactions ?? this.reactions,
      replyToId: replyToId ?? this.replyToId,
      forwardedFrom: forwardedFrom ?? this.forwardedFrom,
      messageReference: messageReference ?? this.messageReference,
      messageSnapshots: messageSnapshots ?? this.messageSnapshots,
      isPinned: isPinned ?? this.isPinned,
      isMentioned: isMentioned ?? this.isMentioned,
      mentionEveryone: mentionEveryone ?? this.mentionEveryone,
      mentionedUserIds: mentionedUserIds ?? this.mentionedUserIds,
      mentionRoles: mentionRoles ?? this.mentionRoles,
      supplementalUserIds: supplementalUserIds ?? this.supplementalUserIds,
      mentionChannels: mentionChannels ?? this.mentionChannels,
      type: type ?? this.type,
      flags: flags ?? this.flags,
      deliveryState: deliveryState ?? this.deliveryState,
      clientNonce: clientNonce == _unset
          ? this.clientNonce
          : clientNonce as String?,
      sendError: sendError == _unset ? this.sendError : sendError as String?,
      call: call == _unset ? this.call : call as MessageCall?,
      tts: tts ?? this.tts,
      translation: translation == _unset
          ? this.translation
          : translation as MessageTranslation?,
    );
  }

  /// Merges a gateway `MESSAGE_UPDATE` payload into this message.
  Message applyGatewayUpdate(
    MessageResponseSchema sdk, {
    String? currentUserId,
  }) {
    final Message incoming = Message.fromSdk(sdk, currentUserId: currentUserId);
    final bool contentChanged = incoming.content != content;
    return copyWith(
      authorId: incoming.authorId,
      authorName: incoming.authorName,
      authorAvatar: incoming.authorAvatar,
      authorAvatarColor: incoming.authorAvatarColor,
      authorIsBot: incoming.authorIsBot,
      authorIsSystem: incoming.authorIsSystem,
      authorPublicFlags: incoming.authorPublicFlags,
      webhookId: incoming.webhookId,
      content: incoming.content,
      editedTimestamp: incoming.editedTimestamp ?? editedTimestamp,
      embeds: incoming.embeds.isNotEmpty ? incoming.embeds : embeds,
      attachments: incoming.attachments.isNotEmpty
          ? incoming.attachments
          : attachments,
      stickers: incoming.stickers.isNotEmpty ? incoming.stickers : stickers,
      reactions: incoming.reactions.isNotEmpty ? incoming.reactions : reactions,
      replyToId: incoming.replyToId ?? replyToId,
      messageReference: incoming.messageReference ?? messageReference,
      messageSnapshots: incoming.messageSnapshots.isNotEmpty
          ? incoming.messageSnapshots
          : messageSnapshots,
      isPinned: incoming.isPinned,
      isMentioned: incoming.isMentioned,
      mentionEveryone: incoming.mentionEveryone,
      mentionedUserIds: incoming.mentionedUserIds,
      mentionRoles: incoming.mentionRoles,
      supplementalUserIds: incoming.supplementalUserIds.isNotEmpty
          ? incoming.supplementalUserIds
          : supplementalUserIds,
      mentionChannels: incoming.mentionChannels.isNotEmpty
          ? incoming.mentionChannels
          : mentionChannels,
      type: incoming.type,
      flags: incoming.flags,
      call: incoming.call ?? call,
      translation: contentChanged ? null : _unset,
    );
  }

  bool get hasEmbeds => embeds.isNotEmpty;
  bool get hasAttachments => attachments.isNotEmpty;
  bool get hasStickers => stickers.isNotEmpty;
  bool get isReply =>
      replyToId != null && !(messageReference?.isForward ?? false);

  String get displayedContent {
    final MessageTranslation? current = translation;
    if (current != null &&
        current.isValidFor(content) &&
        !current.showOriginal) {
      return current.translatedContent;
    }
    return content;
  }

  bool get hasValidTranslation {
    final MessageTranslation? current = translation;
    return current != null && current.isValidFor(content);
  }

  bool get hasMentionsForGrouping =>
      mentionEveryone || mentionRoles.isNotEmpty || mentionedUserIds.isNotEmpty;

  String? get replyParentMessageId => replyToId ?? messageReference?.messageId;

  String get replyParentChannelId {
    final String? refChannelId = messageReference?.channelId;
    if (refChannelId != null && refChannelId.isNotEmpty) {
      return refChannelId;
    }
    return channelId;
  }

  bool get hasForwardSnapshots => messageSnapshots.isNotEmpty;
  bool get suppressEmbeds => (flags & messageFlagSuppressEmbeds) != 0;
  bool get hasCompactAttachments =>
      (flags & messageFlagCompactAttachments) != 0;
  bool get isVoiceMessage => (flags & kMessageFlagVoiceMessage) != 0;

  bool shouldHideContent({required bool renderEmbeds}) {
    if (!renderEmbeds || suppressEmbeds || embeds.isEmpty) {
      return false;
    }
    final allMedia = embeds.every(
      (e) => e.type == EmbedType.image || e.type == EmbedType.gifv,
    );
    if (!allMedia) {
      return false;
    }
    final trimmed = content.trim();
    if (trimmed.contains(RegExp(r'\s'))) {
      return false;
    }
    return Uri.tryParse(trimmed)?.hasAbsolutePath ?? false;
  }

  static final RegExp _invitesRegExp = RegExp(
    r'(?:https?://)?(?:fluxer\.gg/(?!invite/)([a-zA-Z0-9\-]{2,32})|(?:web\.)?fluxer\.app/invite/([a-zA-Z0-9\-]{2,32}))(?![a-zA-Z0-9\-])', // .com (soon)
  );

  List<String> get invites {
    final seen = <String>{};
    final result = <String>[];
    for (final m in _invitesRegExp.allMatches(content)) {
      if (matchOverlapsMarkdownCodeSpan(content, m)) {
        continue;
      }
      final code = m.group(1) ?? m.group(2);
      if (code != null && seen.add(code)) {
        result.add(code);
        if (result.length == 10) {
          break;
        }
      }
    }
    return result;
  }

  static final RegExp _themesRegExp = RegExp(
    r'https?://web\.fluxer\.app/theme/([a-zA-Z0-9\-]{2,32})(?![a-zA-Z0-9\-])',
  );

  List<String> get themes {
    final seen = <String>{};
    final result = <String>[];
    for (final m in _themesRegExp.allMatches(content)) {
      if (matchOverlapsMarkdownCodeSpan(content, m)) {
        continue;
      }
      final id = m.group(1);
      if (id != null && seen.add(id)) {
        result.add(id);
        if (result.length == 10) {
          break;
        }
      }
    }
    return result;
  }

  List<String> get gifts => findGiftCodes(content);

  bool get isForwarded =>
      (messageReference?.isForward ?? false) && messageSnapshots.isNotEmpty ||
      forwardedFrom != null;
  bool get isEdited => editedTimestamp != null;
  bool get isSystemMessage => !isUserMessage;

  /// Whether this message is a generic user-authored message
  /// (default text, reply, or client-system marker). Mirrors the
  /// web app's `isUserMessage()` predicate.
  bool get isUserMessage =>
      type == messageTypeDefault ||
      type == messageTypeReply ||
      type == messageTypeClientSystem;

  /// `type == 99` is the client-side-only system marker used for
  /// inline call/system status entries — interactive message
  /// actions (reply, forward, etc.) are not applicable.
  bool get isClientSystemMessage => type == messageTypeClientSystem;

  /// Whether interactive message actions (reply, forward, add reaction,
  /// bookmark, suppress embeds) should be offered for this message.
  bool get supportsInteractiveActions => !isClientSystemMessage;

  bool get isMemberJoin => type == messageTypeUserJoin;
  bool get isPin => type == messageTypeChannelPinnedMessage;
  bool get isSending => deliveryState == MessageDeliveryState.sending;
  bool get hasFailed => deliveryState == MessageDeliveryState.failed;

  String get speakableContent {
    if (content.trim().isNotEmpty) {
      return content;
    }
    if (messageSnapshots.isNotEmpty) {
      return messageSnapshots.first.content;
    }
    return content;
  }

  bool get shouldCacheAuthorUser => webhookId == null || webhookId!.isEmpty;

  bool get isWebhookMessage => webhookId != null && webhookId!.isNotEmpty;

  /// Wire-shaped snapshot of this message suitable for the developer
  /// debug viewer. Mirrors the field set the web client surfaces via
  /// `message.toJSON()`; not stable across versions.
  Map<String, dynamic> toJson() => {
    'id': id,
    'channel_id': channelId,
    'author': {
      'id': authorId,
      'name': authorName,
      'avatar': authorAvatar,
      'avatar_color': authorAvatarColor,
      'bot': authorIsBot,
      'system': authorIsSystem,
    },
    'webhook_id': webhookId,
    'content': content,
    'timestamp': timestamp.toIso8601String(),
    'edited_timestamp': editedTimestamp?.toIso8601String(),
    'type': type,
    'flags': flags,
    'pinned': isPinned,
    'mentioned': isMentioned,
    'mentions': mentionedUserIds,
    'reply_to_id': replyToId,
    'forwarded_from': forwardedFrom,
    'message_reference': messageReference?.toJson(),
    'message_snapshots': messageSnapshots.map((s) => s.toJson()).toList(),
    'embeds': embeds.map((e) => e.toJson()).toList(),
    'attachments': attachments.map((a) => a.toJson()).toList(),
    'stickers': stickers.map((s) => s.toJson()).toList(),
    'reactions': reactions.map((r) => r.toJson()).toList(),
    'delivery_state': deliveryState.name,
    'client_nonce': clientNonce,
    'send_error': sendError,
  };

  static List<T> _decodeList<T>(
    String json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (json.isEmpty || json == '[]') {
      return const [];
    }
    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((e) => fromJson(e as Map<String, dynamic>)).toList();
    } on Object {
      return [];
    }
  }

  static List<String> _decodeStringList(String json) {
    if (json.isEmpty || json == '[]') {
      return const [];
    }
    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((e) => e.toString()).toList();
    } on Object {
      return [];
    }
  }

  static const Object _unset = Object();
}
