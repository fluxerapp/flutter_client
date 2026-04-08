import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_dart/export.dart';

enum EmbedType { rich, image, gifv, link, video }

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

class EmbedMedia {
  final String url;
  final String? proxyUrl;
  final int? width;
  final int? height;

  const EmbedMedia({required this.url, this.proxyUrl, this.width, this.height});

  factory EmbedMedia.fromSdk(EmbedMediaResponse sdk) => EmbedMedia(
    url: sdk.url,
    proxyUrl: sdk.proxyUrl,
    width: sdk.width,
    height: sdk.height,
  );

  factory EmbedMedia.fromJson(Map<String, dynamic> json) => EmbedMedia(
    url: json['url'] as String? ?? '',
    proxyUrl: (json['proxyUrl'] ?? json['proxy_url']) as String?,
    width: json['width'] as int?,
    height: json['height'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'proxyUrl': proxyUrl,
    'width': width,
    'height': height,
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
  });

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
  final String url;
  final String? contentType;
  final String? placeholder;
  final int? size;
  final int? width;
  final int? height;
  final bool? nsfw;
  final bool? expired;
  final DateTime? expiresAt;

  const Attachment({
    required this.id,
    required this.filename,
    required this.url,
    this.contentType,
    this.placeholder,
    this.nsfw,
    this.expired,
    this.expiresAt,
    this.size,
    this.width,
    this.height,
  });

  factory Attachment.fromSdk(MessageAttachmentResponse sdk) {
    return Attachment(
      id: sdk.id,
      filename: sdk.filename,
      url: sdk.url ?? '',
      size: sdk.size,
      width: sdk.width,
      height: sdk.height,
      contentType: sdk.contentType,
      placeholder: sdk.placeholder,
      nsfw: sdk.nsfw,
      expired: sdk.expired,
      expiresAt: DateTime.tryParse(sdk.expiresAt ?? ''),
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      id: json['id'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
      url: json['url'] as String? ?? '',
      size: json['size'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      contentType: json['content_type'] as String?,
      placeholder: json['placeholder'] as String?,
      nsfw: json['nsfw'] as bool?,
      expired: json['expired'] as bool?,
      expiresAt: DateTime.tryParse((json['expires_at'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'filename': filename,
    'url': url,
    'size': size,
    'width': width,
    'height': height,
    'content_type': contentType,
    'placeholder': placeholder,
    'nsfw': nsfw,
    'expired': expired,
    'expires_at': expiresAt?.toIso8601String(),
  };

  bool get isImage {
    final ext = filename.split('.').last.toLowerCase();
    return ['png', 'jpg', 'jpeg', 'gif', 'webp'].contains(ext);
  }
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
      hasReacted: sdk.me != null,
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

  factory MessageReference.fromSdk(MessageReferenceResponse sdk) {
    return MessageReference(
      channelId: sdk.channelId,
      messageId: sdk.messageId,
      guildId: sdk.guildId?.toString(),
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

class MessageSnapshot {
  final String content;
  final DateTime timestamp;
  final DateTime? editedTimestamp;
  final List<String> mentions;
  final List<String> mentionRoles;
  final List<Embed> embeds;
  final List<Attachment> attachments;

  const MessageSnapshot({
    required this.timestamp,
    this.content = '',
    this.editedTimestamp,
    this.mentions = const [],
    this.mentionRoles = const [],
    this.embeds = const [],
    this.attachments = const [],
  });

  factory MessageSnapshot.fromSdk(MessageSnapshotResponse sdk) {
    return MessageSnapshot(
      content: sdk.content ?? '',
      timestamp: sdk.timestamp,
      editedTimestamp: sdk.editedTimestamp,
      mentions: sdk.mentions ?? const [],
      mentionRoles: sdk.mentionRoles ?? const [],
      embeds: sdk.embeds?.map(Embed.fromSdk).toList() ?? const [],
      attachments:
          sdk.attachments?.map(Attachment.fromSdk).toList() ?? const [],
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
    );
  }

  Map<String, dynamic> toJson() => {
    'content': content,
    'timestamp': timestamp.toIso8601String(),
    'edited_timestamp': editedTimestamp?.toIso8601String(),
    'mentions': mentions,
    'mention_roles': mentionRoles,
    'embeds': embeds.map((e) => e.toJson()).toList(),
    'attachments': attachments.map((a) => a.toJson()).toList(),
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
  final String content;
  final DateTime timestamp;
  final DateTime? editedTimestamp;
  final List<Embed> embeds;
  final List<Attachment> attachments;
  final List<Reaction> reactions;
  final String? replyToId;
  final String? forwardedFrom;
  final MessageReference? messageReference;
  final List<MessageSnapshot> messageSnapshots;
  final bool isPinned;
  final bool isMentioned;
  final int type;

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
    this.editedTimestamp,
    this.embeds = const [],
    this.attachments = const [],
    this.reactions = const [],
    this.replyToId,
    this.forwardedFrom,
    this.messageReference,
    this.messageSnapshots = const [],
    this.isPinned = false,
    this.isMentioned = false,
    this.type = 0,
  });

  factory Message.fromSdk(
    MessageResponseSchema sdk, {
    String? currentUserId,
  }) {
    final isMentioned = sdk.mentionEveryone ||
        (currentUserId != null &&
            (sdk.mentions?.any((u) => u.id == currentUserId) ?? false));

    return Message(
      id: sdk.id,
      channelId: sdk.channelId,
      authorId: sdk.author.id,
      authorName: sdk.author.globalName ?? sdk.author.username,
      authorAvatar: sdk.author.avatar,
      authorAvatarColor: sdk.author.avatarColor,
      authorIsBot: sdk.author.bot ?? false,
      content: sdk.content,
      timestamp: sdk.timestamp,
      editedTimestamp: sdk.editedTimestamp,
      embeds: sdk.embeds?.map(Embed.fromSdk).toList() ?? const [],
      attachments:
          sdk.attachments?.map(Attachment.fromSdk).toList() ?? const [],
      reactions: sdk.reactions?.map(Reaction.fromSdk).toList() ?? const [],
      replyToId: sdk.referencedMessage?.id,
      messageReference: sdk.messageReference != null
          ? MessageReference.fromSdk(sdk.messageReference!)
          : null,
      messageSnapshots:
          sdk.messageSnapshots?.map(MessageSnapshot.fromSdk).toList() ??
          const [],
      isPinned: sdk.pinned,
      isMentioned: isMentioned,
      type: sdk.type.json ?? 0,
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
      authorIsBot: false,
      content: row.content,
      timestamp: row.timestamp,
      editedTimestamp: row.editedTimestamp,
      embeds: _decodeList(row.embedsJson, Embed.fromJson),
      attachments: _decodeList(row.attachmentsJson, Attachment.fromJson),
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
      type: row.type,
    );
  }

  db.MessagesCompanion toCompanion() {
    return db.MessagesCompanion.insert(
      id: id,
      channelId: channelId,
      authorId: authorId,
      authorName: Value(authorName),
      authorAvatar: Value(authorAvatar),
      authorAvatarColor: Value(authorAvatarColor),
      content: content,
      timestamp: timestamp,
      embedsJson: Value(jsonEncode(embeds.map((e) => e.toJson()).toList())),
      attachmentsJson: Value(
        jsonEncode(attachments.map((a) => a.toJson()).toList()),
      ),
      reactionsJson: Value(
        jsonEncode(reactions.map((r) => r.toJson()).toList()),
      ),
      replyToId: Value(replyToId),
      forwardedFrom: Value(forwardedFrom),
      messageReferenceJson: Value(messageReference == null
          ? null
          : jsonEncode(messageReference!.toJson())),
      messageSnapshotsJson: Value(
        jsonEncode(messageSnapshots.map((s) => s.toJson()).toList()),
      ),
      isMentioned: Value(isMentioned),
      type: Value(type),
    );
  }

  String? get authorAvatarUrl {
    if (authorAvatar == null) {
      return null;
    }
    return '$fluxerMediaCdn/avatars/$authorId/$authorAvatar.png';
  }

  bool get hasEmbeds => embeds.isNotEmpty;
  bool get hasAttachments => attachments.isNotEmpty;
  bool get isReply => replyToId != null;
  bool get hasForwardSnapshots => messageSnapshots.isNotEmpty;
  bool get shouldHideContent {
    if (embeds.isEmpty) {
      return false;
    }
    final allMedia = embeds.every(
      (e) => e.type == EmbedType.image || e.type == EmbedType.gifv,
    );
    if (!allMedia) {
      return false;
    }
    final trimmed = content.trim();
    return Uri.tryParse(trimmed)?.hasAbsolutePath ?? false;
  }

  List<String> get invites {
    final re = RegExp(
      r'(?:https?://)?(?:fluxer\.gg/(?!invite/)([a-zA-Z0-9\-]{2,32})|(?:web\.)?fluxer\.app/invite/([a-zA-Z0-9\-]{2,32}))(?![a-zA-Z0-9\-])', // .com (soon)
    );
    final seen = <String>{};
    final result = <String>[];
    for (final m in re.allMatches(content)) {
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

  List<String> get themes {
    final re = RegExp(
      r'https?://web\.fluxer\.app/theme/([a-zA-Z0-9\-]{2,32})(?![a-zA-Z0-9\-])',
    );
    final seen = <String>{};
    final result = <String>[];
    for (final m in re.allMatches(content)) {
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

  bool get isForwarded =>
      (messageReference?.isForward ?? false) && messageSnapshots.isNotEmpty ||
      forwardedFrom != null;
  bool get isEdited => editedTimestamp != null;
  bool get isSystemMessage => type != 0 && type != 1 && type != 19;
  bool get isMemberJoin => type == 7;
  bool get isPin => type == 6;

  static List<T> _decodeList<T>(
    String json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    try {
      final list = jsonDecode(json) as List<dynamic>;
      return list.map((e) => fromJson(e as Map<String, dynamic>)).toList();
    } on Object {
      return [];
    }
  }
}
