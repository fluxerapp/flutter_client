import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;

enum ChannelType { text, voice, announcement, stage, category, link }

/// Guild channels that support text based unread tracking (text + voice).
bool isGuildTextBasedChannel(int type) => type == 0 || type == 2;

bool isGuildTextBasedChannelType(ChannelType type) =>
    type == ChannelType.text || type == ChannelType.voice;

ChannelType channelTypeFromInt(int type) {
  switch (type) {
    case 0:
      return ChannelType.text;
    case 2:
      return ChannelType.voice;
    case 4:
      return ChannelType.category;
    case 5:
      return ChannelType.announcement;
    case 13:
      return ChannelType.stage;
    case 998:
      return ChannelType.link;
    default:
      return ChannelType.text;
  }
}

int channelTypeToInt(ChannelType type) {
  switch (type) {
    case ChannelType.text:
      return 0;
    case ChannelType.voice:
      return 2;
    case ChannelType.category:
      return 4;
    case ChannelType.announcement:
      return 5;
    case ChannelType.stage:
      return 13;
    case ChannelType.link:
      return 998;
  }
}

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

  const Channel({
    required this.id,
    required this.guildId,
    required this.name,
    this.url,
    this.type = ChannelType.text,
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
  });

  factory Channel.fromRow(db.Channel row) {
    return Channel(
      id: row.id,
      guildId: row.guildId,
      name: row.name,
      url: row.url,
      type: channelTypeFromInt(row.type),
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
    );
  }

  db.ChannelsCompanion toCompanion() {
    return db.ChannelsCompanion.insert(
      id: id,
      guildId: guildId,
      name: name,
      url: Value(url),
      type: Value(channelTypeToInt(type)),
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
    );
  }

  bool get isCategory => type == ChannelType.category;
}

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

  uncategorized.sort((a, b) => a.position.compareTo(b.position));
  categories.sort((a, b) => a.position.compareTo(b.position));

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
      ..sort((a, b) => a.position.compareTo(b.position));
    result.add(ChannelCategory(id: cat.id, name: cat.name, channels: children));
  }

  return result;
}
