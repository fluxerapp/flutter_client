import 'dart:convert';

import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_dart/export.dart';

class MessageMentionContextCache {
  MessageMentionContextCache({
    required this._database,
    Set<String>? blockedUserIds,
  }) : blockedUserIds = blockedUserIds ?? <String>{};

  final FluxerDatabase _database;
  Set<String> blockedUserIds;
  final Map<String, _GuildMentionCacheEntry> _guildEntries =
      <String, _GuildMentionCacheEntry>{};
  final Map<String, String?> _channelGuildIds = <String, String?>{};
  final Map<String, Channel?> _guildChannels = <String, Channel?>{};
  final Map<String, DmChannel?> _dmChannels = <String, DmChannel?>{};

  void invalidateGuild(String guildId) {
    _guildEntries.remove(guildId);
  }

  void invalidateChannel(String channelId) {
    _channelGuildIds.remove(channelId);
    _guildChannels.remove(channelId);
    _dmChannels.remove(channelId);
  }

  void clearAll() {
    _guildEntries.clear();
    _channelGuildIds.clear();
    _guildChannels.clear();
    _dmChannels.clear();
  }

  /// Per-channel context for resolving one or many messages without repeated
  /// database reads. Backed by the same guild and channel entries the gateway
  /// invalidates, so page fetches stay in parity with the live-create path.
  Future<MessageMentionContext> contextFor({
    required String? currentUserId,
    required String channelId,
  }) async {
    final ChannelResolution resolution = await _resolveChannel(channelId);
    final bool channelExists = resolution.isGuild
        ? resolution.guildChannel != null
        : resolution.dmChannel != null;
    if (currentUserId == null || !channelExists) {
      return MessageMentionContext(
        currentUserId: currentUserId,
        blockedUserIds: blockedUserIds,
        channelExists: channelExists,
        suppressEveryone: false,
        suppressRoles: false,
        currentUserRoleIds: const <String>{},
      );
    }
    if (resolution.isGuild) {
      final String guildId = resolution.guildChannel!.guildId;
      final _GuildMentionCacheEntry entry = await _guildEntry(
        guildId: guildId,
        currentUserId: currentUserId,
      );
      return MessageMentionContext(
        currentUserId: currentUserId,
        blockedUserIds: blockedUserIds,
        channelExists: true,
        suppressEveryone: entry.suppressEveryone,
        suppressRoles: entry.suppressRoles,
        currentUserRoleIds: entry.roleIds,
      );
    }
    return MessageMentionContext(
      currentUserId: currentUserId,
      blockedUserIds: blockedUserIds,
      channelExists: true,
      suppressEveryone: false,
      suppressRoles: false,
      currentUserRoleIds: const <String>{},
    );
  }

  Future<ChannelResolution> resolveChannel(String channelId) {
    return _resolveChannel(channelId);
  }

  Future<ChannelResolution> _resolveChannel(String channelId) async {
    if (_guildChannels.containsKey(channelId)) {
      final Channel? channel = _guildChannels[channelId];
      if (channel != null) {
        return ChannelResolution.guild(
          channelId: channelId,
          guildStorageId: channel.guildId,
          guildChannel: channel,
        );
      }
    }
    if (_dmChannels.containsKey(channelId)) {
      final DmChannel? dm = _dmChannels[channelId];
      if (dm != null) {
        return ChannelResolution.private(
          channelId: channelId,
          guildStorageId: '@me',
        );
      }
    }
    final Channel? guildChannel = await _database.channelDao.getChannelById(
      channelId,
    );
    if (guildChannel != null) {
      _guildChannels[channelId] = guildChannel;
      _channelGuildIds[channelId] = guildChannel.guildId;
      return ChannelResolution.guild(
        channelId: channelId,
        guildStorageId: guildChannel.guildId,
        guildChannel: guildChannel,
      );
    }
    final DmChannel? dm = await _database.dmChannelDao.getDmChannelById(
      channelId,
    );
    _dmChannels[channelId] = dm;
    if (dm != null) {
      return ChannelResolution.private(
        channelId: channelId,
        guildStorageId: '@me',
      );
    }
    _guildChannels[channelId] = null;
    return ChannelResolution.private(
      channelId: channelId,
      guildStorageId: '@me',
    );
  }

  Future<_GuildMentionCacheEntry> _guildEntry({
    required String guildId,
    required String currentUserId,
  }) async {
    final _GuildMentionCacheEntry? cached = _guildEntries[guildId];
    if (cached != null) {
      return cached;
    }
    final settingsRow = await _database.userGuildSettingsDao.getByGuildId(
      guildId,
    );
    final UserGuildSettingsResponse? settings = settingsRow == null
        ? null
        : UserGuildSettingsResponse.fromJson(
            jsonDecode(settingsRow.data) as Map<String, dynamic>,
          );
    final member = await _database.memberDao.getMemberByUserId(
      currentUserId,
      guildId,
    );
    final Set<String> roleIds = member == null
        ? <String>{}
        : (jsonDecode(member.roleIdsJson) as List<dynamic>)
              .map((dynamic roleId) => roleId.toString())
              .toSet();
    final _GuildMentionCacheEntry entry = _GuildMentionCacheEntry(
      suppressEveryone: settings?.suppressEveryone ?? false,
      suppressRoles: settings?.suppressRoles ?? false,
      roleIds: roleIds,
    );
    _guildEntries[guildId] = entry;
    return entry;
  }
}

class _GuildMentionCacheEntry {
  const _GuildMentionCacheEntry({
    required this.suppressEveryone,
    required this.suppressRoles,
    required this.roleIds,
  });

  final bool suppressEveryone;
  final bool suppressRoles;
  final Set<String> roleIds;
}

class ChannelResolution {
  const ChannelResolution._({
    required this.channelId,
    required this.guildStorageId,
    required this.isGuild,
    required this.guildChannel,
    required this.dmChannel,
  });

  factory ChannelResolution.guild({
    required String channelId,
    required String guildStorageId,
    required Channel guildChannel,
  }) {
    return ChannelResolution._(
      channelId: channelId,
      guildStorageId: guildStorageId,
      isGuild: true,
      guildChannel: guildChannel,
      dmChannel: null,
    );
  }

  factory ChannelResolution.private({
    required String channelId,
    required String guildStorageId,
    DmChannel? dmChannel,
  }) {
    return ChannelResolution._(
      channelId: channelId,
      guildStorageId: guildStorageId,
      isGuild: false,
      guildChannel: null,
      dmChannel: dmChannel,
    );
  }

  final String channelId;
  final String guildStorageId;
  final bool isGuild;
  final Channel? guildChannel;
  final DmChannel? dmChannel;
}
