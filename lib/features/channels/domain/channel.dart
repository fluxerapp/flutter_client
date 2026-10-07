import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;

enum ChannelType {
  guildText(0),
  dm(1),
  guildVoice(2),
  groupDm(3),
  guildCategory(4),
  guildAnnouncement(5),
  announcementThread(10),
  publicThread(11),
  privateThread(12),
  guildForum(15),
  guildMedia(16),
  guildLink(998),
  dmPersonalNotes(999),
  unknown(-1);

  const ChannelType(this.wireValue);

  final int wireValue;

  static ChannelType fromWire(int value) {
    for (final ChannelType type in values) {
      if (type == ChannelType.unknown) {
        continue;
      }
      if (type.wireValue == value) {
        return type;
      }
    }
    return ChannelType.unknown;
  }
}

int persistedChannelTypeWire(int? json) =>
    json ?? ChannelType.unknown.wireValue;

/// Guild channels that support text based unread tracking (text + voice).
const Set<ChannelType> guildTextBasedChannelTypes = <ChannelType>{
  ChannelType.guildText,
  ChannelType.guildVoice,
  ChannelType.guildAnnouncement,
};

const Set<int> threadChannelTypeValues = <int>{10, 11, 12};

const Set<int> threadOnlyChannelTypeValues = <int>{15, 16};

const Set<int> threadFeatureChannelTypeValues = <int>{10, 11, 12, 15, 16};

bool isThreadChannelType(int type) => threadChannelTypeValues.contains(type);

bool isPublicThreadChannelType(ChannelType type) =>
    type == ChannelType.publicThread || type == ChannelType.announcementThread;

bool isTextThreadParentType(ChannelType type) =>
    type == ChannelType.guildText || type == ChannelType.guildAnnouncement;

ChannelType publicThreadTypeFor(ChannelType parentType) =>
    parentType == ChannelType.guildAnnouncement
    ? ChannelType.announcementThread
    : ChannelType.publicThread;

bool isThreadOnlyChannelType(int type) =>
    threadOnlyChannelTypeValues.contains(type);

bool isThreadFeatureChannelType(int type) =>
    threadFeatureChannelTypeValues.contains(type);

bool isGuildTextBasedChannel(int type) =>
    type == ChannelType.guildText.wireValue ||
    type == ChannelType.guildVoice.wireValue ||
    type == ChannelType.guildAnnouncement.wireValue;

bool isGuildTextBasedChannelType(ChannelType type) =>
    guildTextBasedChannelTypes.contains(type);

bool isGuildVoiceChannelType(int type) =>
    type == ChannelType.guildVoice.wireValue;

bool isGuildCategoryChannelType(int type) =>
    type == ChannelType.guildCategory.wireValue;

bool isGuildLinkChannelType(int type) =>
    type == ChannelType.guildLink.wireValue;

bool isGuildAnnouncementChannelType(ChannelType type) =>
    type == ChannelType.guildAnnouncement;

bool isAnnouncementConvertibleChannel(ChannelType type) =>
    type == ChannelType.guildText || type == ChannelType.guildAnnouncement;

bool isChannelFollowTargetType(ChannelType type) =>
    type == ChannelType.guildText;

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
  final int? storedTypeWire;
  final String? ownerId;
  final int? flags;
  final bool? threadArchived;
  final bool? threadLocked;
  final bool? threadInvitable;
  final int? threadAutoArchiveDuration;
  final String? threadArchiveTimestamp;
  final String? threadCreateTimestamp;
  final int? messageCount;
  final int? totalMessageSent;
  final int? memberCount;
  final String? appliedTagsJson;
  final int? defaultAutoArchiveDuration;
  final int? defaultThreadRateLimitPerUser;
  final String? availableTagsJson;
  final String? defaultReactionEmojiJson;
  final int? defaultSortOrder;
  final int? defaultForumLayout;
  final String? defaultTagSetting;

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
    this.storedTypeWire,
    this.ownerId,
    this.flags,
    this.threadArchived,
    this.threadLocked,
    this.threadInvitable,
    this.threadAutoArchiveDuration,
    this.threadArchiveTimestamp,
    this.threadCreateTimestamp,
    this.messageCount,
    this.totalMessageSent,
    this.memberCount,
    this.appliedTagsJson,
    this.defaultAutoArchiveDuration,
    this.defaultThreadRateLimitPerUser,
    this.availableTagsJson,
    this.defaultReactionEmojiJson,
    this.defaultSortOrder,
    this.defaultForumLayout,
    this.defaultTagSetting,
  });

  int get typeWire => storedTypeWire ?? type.wireValue;

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
    int? typeWire,
    String? ownerId,
    int? flags,
    bool? threadArchived,
    bool? threadLocked,
    bool? threadInvitable,
    int? threadAutoArchiveDuration,
    String? threadArchiveTimestamp,
    String? threadCreateTimestamp,
    int? messageCount,
    int? totalMessageSent,
    int? memberCount,
    String? appliedTagsJson,
    int? defaultAutoArchiveDuration,
    int? defaultThreadRateLimitPerUser,
    String? availableTagsJson,
    String? defaultReactionEmojiJson,
    int? defaultSortOrder,
    int? defaultForumLayout,
    String? defaultTagSetting,
  }) {
    final ChannelType nextType = type ?? this.type;
    final int nextWire =
        typeWire ??
        (type != null && type != this.type
            ? nextType.wireValue
            : this.typeWire);
    return Channel(
      id: id ?? this.id,
      guildId: guildId ?? this.guildId,
      name: name ?? this.name,
      url: url ?? this.url,
      type: nextType,
      storedTypeWire: nextWire,
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
      ownerId: ownerId ?? this.ownerId,
      flags: flags ?? this.flags,
      threadArchived: threadArchived ?? this.threadArchived,
      threadLocked: threadLocked ?? this.threadLocked,
      threadInvitable: threadInvitable ?? this.threadInvitable,
      threadAutoArchiveDuration:
          threadAutoArchiveDuration ?? this.threadAutoArchiveDuration,
      threadArchiveTimestamp:
          threadArchiveTimestamp ?? this.threadArchiveTimestamp,
      threadCreateTimestamp:
          threadCreateTimestamp ?? this.threadCreateTimestamp,
      messageCount: messageCount ?? this.messageCount,
      totalMessageSent: totalMessageSent ?? this.totalMessageSent,
      memberCount: memberCount ?? this.memberCount,
      appliedTagsJson: appliedTagsJson ?? this.appliedTagsJson,
      defaultAutoArchiveDuration:
          defaultAutoArchiveDuration ?? this.defaultAutoArchiveDuration,
      defaultThreadRateLimitPerUser:
          defaultThreadRateLimitPerUser ?? this.defaultThreadRateLimitPerUser,
      availableTagsJson: availableTagsJson ?? this.availableTagsJson,
      defaultReactionEmojiJson:
          defaultReactionEmojiJson ?? this.defaultReactionEmojiJson,
      defaultSortOrder: defaultSortOrder ?? this.defaultSortOrder,
      defaultForumLayout: defaultForumLayout ?? this.defaultForumLayout,
      defaultTagSetting: defaultTagSetting ?? this.defaultTagSetting,
    );
  }

  factory Channel.fromRow(db.Channel row) {
    return Channel(
      id: row.id,
      guildId: row.guildId,
      name: row.name,
      url: row.url,
      type: ChannelType.fromWire(row.type),
      storedTypeWire: row.type,
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
      ownerId: row.ownerId,
      flags: row.flags,
      threadArchived: row.threadArchived,
      threadLocked: row.threadLocked,
      threadInvitable: row.threadInvitable,
      threadAutoArchiveDuration: row.threadAutoArchiveDuration,
      threadArchiveTimestamp: row.threadArchiveTimestamp,
      threadCreateTimestamp: row.threadCreateTimestamp,
      messageCount: row.messageCount,
      totalMessageSent: row.totalMessageSent,
      memberCount: row.memberCount,
      appliedTagsJson: row.appliedTagsJson,
      defaultAutoArchiveDuration: row.defaultAutoArchiveDuration,
      defaultThreadRateLimitPerUser: row.defaultThreadRateLimitPerUser,
      availableTagsJson: row.availableTagsJson,
      defaultReactionEmojiJson: row.defaultReactionEmojiJson,
      defaultSortOrder: row.defaultSortOrder,
      defaultForumLayout: row.defaultForumLayout,
      defaultTagSetting: row.defaultTagSetting,
    );
  }

  db.ChannelsCompanion toCompanion() {
    return db.ChannelsCompanion.insert(
      id: id,
      guildId: guildId,
      name: name,
      url: Value(url),
      type: Value(typeWire),
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
      ownerId: Value(ownerId),
      flags: Value(flags),
      threadArchived: Value(threadArchived),
      threadLocked: Value(threadLocked),
      threadInvitable: Value(threadInvitable),
      threadAutoArchiveDuration: Value(threadAutoArchiveDuration),
      threadArchiveTimestamp: Value(threadArchiveTimestamp),
      threadCreateTimestamp: Value(threadCreateTimestamp),
      messageCount: Value(messageCount),
      totalMessageSent: Value(totalMessageSent),
      memberCount: Value(memberCount),
      appliedTagsJson: Value(appliedTagsJson),
      defaultAutoArchiveDuration: Value(defaultAutoArchiveDuration),
      defaultThreadRateLimitPerUser: Value(defaultThreadRateLimitPerUser),
      availableTagsJson: Value(availableTagsJson),
      defaultReactionEmojiJson: Value(defaultReactionEmojiJson),
      defaultSortOrder: Value(defaultSortOrder),
      defaultForumLayout: Value(defaultForumLayout),
      defaultTagSetting: Value(defaultTagSetting),
    );
  }

  bool get isCategory => type == ChannelType.guildCategory;

  bool get isThread =>
      type == ChannelType.announcementThread ||
      type == ChannelType.publicThread ||
      type == ChannelType.privateThread;

  bool get isThreadOnly =>
      type == ChannelType.guildForum || type == ChannelType.guildMedia;

  @override
  bool operator ==(Object other) {
    return other is Channel &&
        other.id == id &&
        other.guildId == guildId &&
        other.name == name &&
        other.url == url &&
        other.type == type &&
        other.typeWire == typeWire &&
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
        other.voiceConnectionLimit == voiceConnectionLimit &&
        other.ownerId == ownerId &&
        other.flags == flags &&
        other.threadArchived == threadArchived &&
        other.threadLocked == threadLocked &&
        other.threadInvitable == threadInvitable &&
        other.threadAutoArchiveDuration == threadAutoArchiveDuration &&
        other.threadArchiveTimestamp == threadArchiveTimestamp &&
        other.threadCreateTimestamp == threadCreateTimestamp &&
        other.messageCount == messageCount &&
        other.totalMessageSent == totalMessageSent &&
        other.memberCount == memberCount &&
        other.appliedTagsJson == appliedTagsJson &&
        other.defaultAutoArchiveDuration == defaultAutoArchiveDuration &&
        other.defaultThreadRateLimitPerUser == defaultThreadRateLimitPerUser &&
        other.availableTagsJson == availableTagsJson &&
        other.defaultReactionEmojiJson == defaultReactionEmojiJson &&
        other.defaultSortOrder == defaultSortOrder &&
        other.defaultForumLayout == defaultForumLayout &&
        other.defaultTagSetting == defaultTagSetting;
  }

  @override
  int get hashCode => Object.hashAll(<Object?>[
    id,
    guildId,
    name,
    url,
    type,
    typeWire,
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
    ownerId,
    flags,
    threadArchived,
    threadLocked,
    threadInvitable,
    threadAutoArchiveDuration,
    threadArchiveTimestamp,
    threadCreateTimestamp,
    messageCount,
    totalMessageSent,
    memberCount,
    appliedTagsJson,
    defaultAutoArchiveDuration,
    defaultThreadRateLimitPerUser,
    availableTagsJson,
    defaultReactionEmojiJson,
    defaultSortOrder,
    defaultForumLayout,
    defaultTagSetting,
  ]);
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
    case ChannelType.guildAnnouncement:
    case ChannelType.guildLink:
    case ChannelType.guildCategory:
    case ChannelType.unknown:
    case ChannelType.announcementThread:
    case ChannelType.publicThread:
    case ChannelType.privateThread:
    case ChannelType.guildForum:
    case ChannelType.guildMedia:
    case ChannelType.dm:
    case ChannelType.groupDm:
    case ChannelType.dmPersonalNotes:
      return 0;
  }
}
