import 'package:drift/drift.dart';

import 'package:fluxer_app/core/database/fluxer_database.dart' as db;

enum ChannelType { text, voice, announcement, stage, category, link }

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
}

/// Groups a flat list of [Channel]s into [ChannelCategory]s.
///
/// Channels with type 4 (category) become group headers. Child channels
/// reference their category via [parentId]. Channels without a parent
/// are placed in a synthetic "Channels" category.
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
        id: '_uncategorized',
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
