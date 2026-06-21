import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';

String? encodePermissionOverwritesJson(List<ChannelOverwriteResponse>? list) {
  if (list == null || list.isEmpty) {
    return null;
  }
  return jsonEncode(<Map<String, Object?>>[
    for (final ChannelOverwriteResponse o in list)
      <String, Object?>{
        'id': o.id,
        'type': o.type.json ?? 0,
        'allow': o.allow,
        'deny': o.deny,
      },
  ]);
}

/// Converts SDK [GuildResponse] to a Drift companion for upserting.
db.ServersCompanion guildFromSdk(
  GuildResponse sdk, {
  int position = 0,
  bool unavailable = false,
  int? memberCount,
  int? onlineCount,
}) {
  return db.ServersCompanion.insert(
    id: sdk.id,
    name: sdk.name,
    icon: Value(sdk.icon),
    banner: Value(sdk.banner),
    ownerId: Value(sdk.ownerId),
    memberCount: memberCount == null
        ? const Value.absent()
        : Value(memberCount),
    onlineCount: onlineCount == null
        ? const Value.absent()
        : Value(onlineCount),
    featuresJson: Value(jsonEncode(sdk.features)),
    position: Value(position),
    unavailable: Value(unavailable),
    disabledOperations: Value(sdk.disabledOperations),
    verificationLevel: Value(sdk.verificationLevel.json ?? 0),
    nsfw: Value(sdk.nsfw),
    contentWarningLevel: Value(sdk.contentWarningLevel.json ?? 0),
    contentWarningText: Value(sdk.contentWarningText),
  );
}

/// Converts SDK [GuildMemberResponse] to a Drift companion for upserting.
db.MembersCompanion memberCompanionFromSdk(
  GuildMemberResponse sdk, {
  required String guildId,
}) {
  return db.MembersCompanion.insert(
    userId: sdk.user.id,
    guildId: guildId,
    nick: Value(sdk.nick),
    serverAvatar: Value(sdk.avatar),
    roleIdsJson: Value(jsonEncode(sdk.roles)),
    joinedAt: Value(sdk.joinedAt),
    communicationDisabledUntil: Value(sdk.communicationDisabledUntil),
    mentionFlags: sdk.mentionFlags == null
        ? const Value.absent()
        : Value(sdk.mentionFlags!.json),
    profileFlags: sdk.profileFlags == null
        ? const Value.absent()
        : Value(sdk.profileFlags),
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
    lastPinTimestamp: Value(sdk.lastPinTimestamp?.toIso8601String()),
    rateLimitPerUser: Value(sdk.rateLimitPerUser ?? 0),
    nsfw: Value(sdk.nsfw ?? false),
    nsfwOverride: Value(sdk.nsfwOverride),
    contentWarningLevel: Value(sdk.contentWarningLevel?.json ?? 0),
    contentWarningText: Value(sdk.contentWarningText),
    permissionOverwritesJson: Value(
      encodePermissionOverwritesJson(sdk.permissionOverwrites),
    ),
    userLimit: Value(sdk.userLimit),
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
    mentionable: Value(sdk.mentionable),
    permissions: Value(sdk.permissions),
  );
}

/// Converts SDK [UserPartialResponse] to a Drift companion.
///
/// Null source fields are written as [Value.absent] so a partial payload
/// (e.g. the author embedded in `MESSAGE_CREATE`) cannot overwrite a
/// previously-stored avatar/global name when upserted via
/// `insertOnConflictUpdate`. Use the full `UserResponse` mapping in
/// `USER_UPDATE` to intentionally clear fields.
db.UsersCompanion userFromPartialSdk(UserPartialResponse sdk) {
  final globalName = sdk.globalName;
  final avatar = sdk.avatar;
  final avatarColor = sdk.avatarColor;
  final bot = sdk.bot;
  final system = sdk.system;
  final mentionFlags = sdk.mentionFlags;
  return db.UsersCompanion.insert(
    id: sdk.id,
    username: sdk.username,
    discriminator: Value(sdk.discriminator),
    globalName: globalName == null ? const Value.absent() : Value(globalName),
    avatar: avatar == null ? const Value.absent() : Value(avatar),
    avatarColor: avatarColor == null
        ? const Value.absent()
        : Value(avatarColor),
    bot: bot == null ? const Value.absent() : Value(bot),
    system: system == null ? const Value.absent() : Value(system),
    memberSince: Value(dateTimeFromUserSnowflakeOrNull(sdk.id)),
    mentionFlags: mentionFlags == null
        ? const Value.absent()
        : Value(mentionFlags.json),
  );
}

Future<void> upsertMentionUsersFromSdk(
  db.FluxerDatabase database,
  Iterable<UserPartialResponse>? mentions,
) async {
  if (mentions == null) {
    return;
  }
  final List<db.UsersCompanion> users = mentions
      .map(userFromPartialSdk)
      .toList(growable: false);
  if (users.isEmpty) {
    return;
  }
  await database.userDao.upsertUsers(users);
}

Future<void> upsertMentionUsersFromJson(
  db.FluxerDatabase database,
  List<dynamic>? mentions,
) async {
  if (mentions == null || mentions.isEmpty) {
    return;
  }
  final List<db.UsersCompanion> users = <db.UsersCompanion>[];
  for (final dynamic item in mentions) {
    if (item is! Map<String, dynamic>) {
      continue;
    }
    users.add(
      userFromPartialSdk(
        UserPartialResponse.fromJson(item.cast<String, Object?>()),
      ),
    );
  }
  if (users.isEmpty) {
    return;
  }
  await database.userDao.upsertUsers(users);
}
