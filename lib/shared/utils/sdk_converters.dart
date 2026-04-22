import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

/// Converts SDK [GuildResponse] to a Drift companion for upserting.
db.ServersCompanion guildFromSdk(
  GuildResponse sdk, {
  int position = 0,
  bool unavailable = false,
}) {
  return db.ServersCompanion.insert(
    id: sdk.id,
    name: sdk.name,
    icon: Value(sdk.icon),
    banner: Value(sdk.banner),
    ownerId: Value(sdk.ownerId),
    featuresJson: Value(jsonEncode(sdk.features)),
    position: Value(position),
    unavailable: Value(unavailable),
  );
}

/// Converts SDK [ChannelResponse] to a Drift companion for upserting.
db.ChannelsCompanion channelFromSdk(ChannelResponse sdk, String guildId) {
  return db.ChannelsCompanion.insert(
    id: sdk.id,
    guildId: guildId,
    name: sdk.name ?? '',
    url: Value(sdk.url),
    type: Value(sdk.type),
    topic: Value(sdk.topic),
    parentId: Value(sdk.parentId),
    position: Value(sdk.position ?? 0),
    lastMessageId: Value(sdk.lastMessageId),
    rateLimitPerUser: Value(sdk.rateLimitPerUser ?? 0),
  );
}

/// Converts SDK [GuildRoleResponse] to a Drift companion.
db.RolesCompanion roleFromSdk(GuildRoleResponse sdk, String guildId) {
  return db.RolesCompanion.insert(
    id: sdk.id,
    guildId: guildId,
    name: sdk.name,
    color: Value(sdk.color),
    position: Value(sdk.position),
    hoist: Value(sdk.hoist),
    permissions: Value(sdk.permissions),
  );
}

/// Converts SDK [UserPartialResponse] to a Drift companion.
db.UsersCompanion userFromPartialSdk(UserPartialResponse sdk) {
  return db.UsersCompanion.insert(
    id: sdk.id,
    username: sdk.username,
    discriminator: Value(sdk.discriminator),
    globalName: Value(sdk.globalName),
    avatar: Value(sdk.avatar),
    avatarColor: Value(sdk.avatarColor),
    bot: Value(sdk.bot ?? false),
    system: Value(sdk.system ?? false),
    memberSince: Value(dateTimeFromUserSnowflakeOrNull(sdk.id)),
  );
}
