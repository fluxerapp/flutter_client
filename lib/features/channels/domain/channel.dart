import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;

enum ChannelType {
  guildText(0),
  dm(1),
  guildVoice(2),
  groupDm(3),
  guildCategory(4),
  guildLink(998),
  dmPersonalNotes(999);

  const ChannelType(this.wireValue);

  final int wireValue;

  static ChannelType fromWire(int value) {
    for (final ChannelType type in values) {
      if (type.wireValue == value) {
        return type;
      }
    }
    return ChannelType.guildText;
  }
}

/// Guild channels that support text based unread tracking (text + voice).
const Set<ChannelType> guildTextBasedChannelTypes = <ChannelType>{
  ChannelType.guildText,
  ChannelType.guildVoice,
};

bool isGuildTextBasedChannel(int type) =>
    type == ChannelType.guildText.wireValue ||
    type == ChannelType.guildVoice.wireValue;

bool isGuildTextBasedChannelType(ChannelType type) =>
    guildTextBasedChannelTypes.contains(type);

bool isGuildVoiceChannelType(int type) =>
    type == ChannelType.guildVoice.wireValue;

bool isGuildCategoryChannelType(int type) =>
    type == ChannelType.guildCategory.wireValue;

bool isGuildLinkChannelType(int type) =>
    type == ChannelType.guildLink.wireValue;

@immutable
class Channel {
  final String id;
  final String guildId;
  final String name;
  final String? url;
  final ChannelType type;
  final String? topic;
  final String? parentId;
  final int position;
  final int rateLimitPerUser;
  final bool nsfw;
  final bool? nsfwOverride;
  final int contentWarningLevel;
  final String? contentWarningText;
  final String? permissionOverwritesJson;
  final int? userLimit;
  final int? bitrate;
  final String? rtcRegion;
  final int? voiceConnectionLimit;

  const Channel({
    required this.id,
    required this.guildId,
    required this.name,
    this.url,
    this.type = ChannelType.guildText,
    this.topic,
    this.parentId,
    this.position = 0,
    this.rateLimitPerUser = 0,
    this.nsfw = false,
    this.nsfwOverride,
    this.contentWarningLevel = 0,
    this.contentWarningText,
    this.permissionOverwritesJson,
    this.userLimit,
    this.bitrate,
    this.rtcRegion,
    this.voiceConnectionLimit,
  });

  Channel copyWith({
    String? id,
    String? guildId,
    String? name,
    String? url,
    ChannelType? type,
    String? topic,
    String? parentId,
    int? position,
    int? rateLimitPerUser,
    bool? nsfw,
    bool? nsfwOverride,
    int? contentWarningLevel,
    String? contentWarningText,
    String? permissionOverwritesJson,
    int? userLimit,
    int? bitrate,
    String? rtcRegion,
    int? voiceConnectionLimit,
  }) {
    return Channel(
      id: id ?? this.id,
      guildId: guildId ?? this.guildId,
      name: name ?? this.name,
      url: url ?? this.url,
      type: type ?? this.type,
      topic: topic ?? this.topic,
      parentId: parentId ?? this.parentId,
      position: position ?? this.position,
      rateLimitPerUser: rateLimitPerUser ?? this.rateLimitPerUser,
      nsfw: nsfw ?? this.nsfw,
      nsfwOverride: nsfwOverride ?? this.nsfwOverride,
      contentWarningLevel: contentWarningLevel ?? this.contentWarningLevel,
      contentWarningText: contentWarningText ?? this.contentWarningText,
      permissionOverwritesJson:
          permissionOverwritesJson ?? this.permissionOverwritesJson,
      userLimit: userLimit ?? this.userLimit,
      bitrate: bitrate ?? this.bitrate,
      rtcRegion: rtcRegion ?? this.rtcRegion,
      voiceConnectionLimit: voiceConnectionLimit ?? this.voiceConnectionLimit,
    );
  }

  factory Channel.fromRow(db.Channel row) {
    return Channel(
      id: row.id,
      guildId: row.guildId,
      name: row.name,
      url: row.url,
      type: ChannelType.fromWire(row.type),
      topic: row.topic,
      parentId: row.parentId,
      position: row.position,
      rateLimitPerUser: row.rateLimitPerUser,
      nsfw: row.nsfw,
      nsfwOverride: row.nsfwOverride,
      contentWarningLevel: row.contentWarningLevel,
      contentWarningText: row.contentWarningText,
      permissionOverwritesJson: row.permissionOverwritesJson,
      userLimit: row.userLimit,
      bitrate: row.bitrate,
      rtcRegion: row.rtcRegion,
      voiceConnectionLimit: row.voiceConnectionLimit,
    );
  }

  db.ChannelsCompanion toCompanion() {
    return db.ChannelsCompanion.insert(
      id: id,
      guildId: guildId,
      name: name,
      url: Value(url),
      type: Value(type.wireValue),
      topic: Value(topic),
      parentId: Value(parentId),
      position: Value(position),
      rateLimitPerUser: Value(rateLimitPerUser),
      nsfw: Value(nsfw),
      nsfwOverride: Value(nsfwOverride),
      contentWarningLevel: Value(contentWarningLevel),
      contentWarningText: Value(contentWarningText),
      permissionOverwritesJson: Value(permissionOverwritesJson),
      userLimit: Value(userLimit),
      bitrate: Value(bitrate),
      rtcRegion: Value(rtcRegion),
      voiceConnectionLimit: Value(voiceConnectionLimit),
    );
  }

  bool get isCategory => type == ChannelType.guildCategory;

  @override
  bool operator ==(Object other) {
    return other is Channel &&
        other.id == id &&
        other.guildId == guildId &&
        other.name == name &&
        other.url == url &&
        other.type == type &&
        other.topic == topic &&
        other.parentId == parentId &&
        other.position == position &&
        other.rateLimitPerUser == rateLimitPerUser &&
        other.nsfw == nsfw &&
        other.nsfwOverride == nsfwOverride &&
        other.contentWarningLevel == contentWarningLevel &&
        other.contentWarningText == contentWarningText &&
        other.permissionOverwritesJson == permissionOverwritesJson &&
        other.userLimit == userLimit &&
        other.bitrate == bitrate &&
        other.rtcRegion == rtcRegion &&
        other.voiceConnectionLimit == voiceConnectionLimit;
  }

  @override
  int get hashCode => Object.hash(
    id,
    guildId,
    name,
    url,
    type,
    topic,
    parentId,
    position,
    rateLimitPerUser,
    nsfw,
    nsfwOverride,
    contentWarningLevel,
    contentWarningText,
    permissionOverwritesJson,
    userLimit,
    bitrate,
    rtcRegion,
    voiceConnectionLimit,
  );
}

@immutable
class ChannelCategory {
  final String id;
  final String name;
  final List<Channel> channels;

  const ChannelCategory({
    required this.id,
    required this.name,
    required this.channels,
  });

  bool get isUncategorized => id == kUncategorizedCategoryId;

  @override
  bool operator ==(Object other) {
    return other is ChannelCategory &&
        id == other.id &&
        name == other.name &&
        listEquals(channels, other.channels);
  }

  @override
  int get hashCode => Object.hash(id, name, Object.hashAll(channels));
}

/// Internal group id for channels that have no parent category.
const String kUncategorizedCategoryId = '_uncategorized';

/// Groups a flat list of channels into channel categories.
///
/// Channels with type 4 (category) become group headers. Child channels
/// reference their category via parentId. Channels without a parent
/// are placed in an internal uncategorized group.
List<ChannelCategory> groupChannelsIntoCategories(List<Channel> channels) {
  final categories = <Channel>[];
  final uncategorized = <Channel>[];
  final parentMap = <String, List<Channel>>{};

  for (final ch in channels) {
    if (ch.isCategory) {
      categories.add(ch);
    } else if (ch.parentId != null) {
      parentMap.putIfAbsent(ch.parentId!, () => <Channel>[]).add(ch);
    } else {
      uncategorized.add(ch);
    }
  }

  uncategorized.sort(_compareChannelForDisplay);
  categories.sort(_compareChannelOrdering);

  final result = <ChannelCategory>[];

  if (uncategorized.isNotEmpty) {
    result.add(
      ChannelCategory(
        id: kUncategorizedCategoryId,
        name: 'Channels',
        channels: uncategorized,
      ),
    );
  }

  for (final cat in categories) {
    final children = (parentMap[cat.id] ?? <Channel>[])
      ..sort(_compareChannelForDisplay);
    result.add(ChannelCategory(id: cat.id, name: cat.name, channels: children));
  }

  return result;
}

int _compareChannelOrdering(Channel a, Channel b) {
  final positionComparison = a.position.compareTo(b.position);
  return positionComparison != 0 ? positionComparison : a.id.compareTo(b.id);
}

int _compareChannelForDisplay(Channel a, Channel b) {
  final aBucket = _channelDisplayBucket(a);
  final bBucket = _channelDisplayBucket(b);
  final bucketComparison = aBucket.compareTo(bBucket);
  return bucketComparison != 0
      ? bucketComparison
      : _compareChannelOrdering(a, b);
}

int _channelDisplayBucket(Channel channel) {
  switch (channel.type) {
    case ChannelType.guildVoice:
      return 1;
    case ChannelType.guildText:
    case ChannelType.guildLink:
    case ChannelType.guildCategory:
    case ChannelType.dm:
    case ChannelType.groupDm:
    case ChannelType.dmPersonalNotes:
      return 0;
  }
}
