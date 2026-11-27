import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/daos/thread_dao.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/features/channels/domain/channel.dart'
    show isThreadChannelType;
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;
import 'package:fluxer_dart/gateway.dart';

class ReadyGuildRows {
  const ReadyGuildRows({
    required this.cachedUsers,
    required this.servers,
    required this.channels,
    required this.roles,
    required this.memberUsers,
    required this.members,
    required this.joinedThreads,
    required this.emojis,
    required this.stickers,
    required this.channelIdsByGuildId,
    required this.roleIdsByGuildId,
    required this.voiceStates,
  });

  final List<db.UsersCompanion> cachedUsers;
  final List<db.ServersCompanion> servers;
  final List<db.ChannelsCompanion> channels;
  final List<db.RolesCompanion> roles;
  final List<db.UsersCompanion> memberUsers;
  final List<db.MembersCompanion> members;
  final Map<String, JoinedThreadsSnapshot> joinedThreads;
  final Map<String, List<db.GuildEmojisCompanion>> emojis;
  final Map<String, List<db.GuildStickersCompanion>> stickers;
  final Map<String, Set<String>> channelIdsByGuildId;
  final Map<String, Set<String>> roleIdsByGuildId;
  final List<VoiceState> voiceStates;
}

ReadyGuildRows readyGuildRowsFor(ReadyEvent event) => switch (event.prepared) {
  final ReadyGuildRows rows => rows,
  _ => buildReadyGuildRows(event),
};

ReadyGuildRows buildReadyGuildRows(ReadyEvent event) {
  final Map<String, int> guildPositions = _guildPositions(event.userSettings);
  var fallbackPosition = guildPositions.length;

  final List<db.UsersCompanion> cachedUsers = <db.UsersCompanion>[
    for (final Map<String, dynamic> user
        in event.users ?? const <Map<String, dynamic>>[])
      userFromPartialSdk(
        UserPartialResponse.fromJson(user.cast<String, Object?>()),
      ),
  ];
  final List<db.ServersCompanion> servers = <db.ServersCompanion>[];
  final List<db.ChannelsCompanion> channels = <db.ChannelsCompanion>[];
  final List<db.RolesCompanion> roles = <db.RolesCompanion>[];
  final List<db.UsersCompanion> memberUsers = <db.UsersCompanion>[];
  final List<db.MembersCompanion> members = <db.MembersCompanion>[];
  final Map<String, JoinedThreadsSnapshot> joinedThreads =
      <String, JoinedThreadsSnapshot>{};
  final Map<String, List<db.GuildEmojisCompanion>> emojis =
      <String, List<db.GuildEmojisCompanion>>{};
  final Map<String, List<db.GuildStickersCompanion>> stickers =
      <String, List<db.GuildStickersCompanion>>{};
  final Map<String, Set<String>> channelIdsByGuildId = <String, Set<String>>{};
  final Map<String, Set<String>> roleIdsByGuildId = <String, Set<String>>{};
  final List<VoiceState> voiceStates = <VoiceState>[];

  for (final GuildCreateData guildData in event.guilds) {
    final String guildId = guildData.guild.id;
    servers.add(
      guildFromSdk(
        guildData.guild,
        position: guildPositions[guildId] ?? fallbackPosition++,
        memberCount: guildData.memberCount,
        onlineCount: guildData.onlineCount,
      ),
    );

    final Set<String> channelIds = <String>{};
    for (final ChannelResponse channel in guildData.channels) {
      channels.add(channelFromSdk(channel, guildId));
      channelIds.add(channel.id);
    }
    if (channelIds.isNotEmpty) {
      channelIdsByGuildId[guildId] = channelIds;
    }

    final List<db.ThreadMembersCompanion> joined =
        <db.ThreadMembersCompanion>[];
    final Set<String> listed = <String>{};
    for (final ChannelResponse thread
        in guildData.threads ?? const <ChannelResponse>[]) {
      if (!isThreadChannelType(thread.type.json ?? -1)) {
        continue;
      }
      channels.add(channelFromSdk(thread, guildId));
      listed.add(thread.id);
      final ThreadMemberResponse? member = thread.member;
      if (member != null) {
        joined.add(
          threadMemberFromSdk(member, threadId: thread.id, guildId: guildId),
        );
      }
    }
    joinedThreads[guildId] = (joined: joined, listedIds: listed);

    if (guildData.roles.isNotEmpty) {
      roleIdsByGuildId[guildId] = <String>{
        for (final GuildRoleResponse role in guildData.roles) role.id,
      };
      for (final GuildRoleResponse role in guildData.roles) {
        roles.add(roleFromSdk(role, guildId));
      }
    }

    for (final GuildMemberResponse member in guildMembersWithVoiceStates(
      guildData.members,
      guildData.voiceStates,
    )) {
      memberUsers.add(userFromPartialSdk(member.user));
      members.add(memberCompanionFromSdk(member, guildId: guildId));
    }
    voiceStates.addAll(guildData.voiceStates);

    emojis[guildId] = <db.GuildEmojisCompanion>[
      for (final GuildEmojiResponse emoji in guildData.emojis)
        db.GuildEmojisCompanion.insert(
          id: emoji.id,
          guildId: guildId,
          name: emoji.name,
          animated: Value(emoji.animated),
        ),
    ];
    stickers[guildId] = <db.GuildStickersCompanion>[
      for (final GuildStickerResponse sticker in guildData.stickers)
        db.GuildStickersCompanion.insert(
          id: sticker.id,
          guildId: guildId,
          name: sticker.name,
          description: Value(sticker.description),
          tagsJson: Value(jsonEncode(sticker.tags)),
          animated: Value(sticker.animated),
        ),
    ];
  }

  return ReadyGuildRows(
    cachedUsers: cachedUsers,
    servers: servers,
    channels: channels,
    roles: roles,
    memberUsers: memberUsers,
    members: members,
    joinedThreads: joinedThreads,
    emojis: emojis,
    stickers: stickers,
    channelIdsByGuildId: channelIdsByGuildId,
    roleIdsByGuildId: roleIdsByGuildId,
    voiceStates: voiceStates,
  );
}

List<GuildMemberResponse> guildMembersWithVoiceStates(
  List<GuildMemberResponse> members,
  List<VoiceState> voiceStates,
) {
  if (voiceStates.isEmpty) {
    return members;
  }
  final Map<String, GuildMemberResponse> byUserId =
      <String, GuildMemberResponse>{
        for (final GuildMemberResponse member in members)
          member.user.id: member,
      };
  for (final VoiceState voiceState in voiceStates) {
    final GuildMemberResponse? member = voiceState.member;
    if (member != null) {
      byUserId[member.user.id] = member;
    }
  }
  return byUserId.values.toList();
}

Map<String, int> _guildPositions(UserSettingsResponse? settings) {
  final Map<String, int> positions = <String, int>{};
  if (settings == null) {
    return positions;
  }
  var position = 0;
  for (final folder in settings.guildFolders) {
    for (final String guildId in folder.guildIds) {
      positions[guildId] = position++;
    }
  }
  return positions;
}
