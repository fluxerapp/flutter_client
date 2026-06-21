import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/gateway/gateway_ready_guild_parser.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/guilds/data/guild_local_cleanup.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

typedef TypingCallback = void Function(String channelId, String userId);
typedef VoiceStateCallback = void Function(VoiceState state);
typedef VoiceBulkCallback = void Function(List<VoiceState> states);
typedef CallCreateCallback = void Function(CallCreateEvent event);
typedef CallUpdateCallback = void Function(CallUpdateEvent event);
typedef ChannelCallback = void Function(String channelId);
typedef InviteCreateCallback = void Function(Map<String, dynamic> data);
typedef InviteDeleteCallback = void Function(String code);
typedef ReadyCallback = void Function();
typedef GuildCallback = void Function(String guildId);
typedef MessageCreateCallback = void Function(MessageCreateEvent event);
typedef MessageUpdateCallback = void Function(MessageUpdateEvent event);
typedef MessageDeleteCallback = void Function(MessageDeleteEvent event);
typedef MessageDeleteBulkCallback = void Function(MessageDeleteBulkEvent event);
typedef MessageReactionChangeCallback =
    void Function(String channelId, String messageId);
typedef ConnectionsUpdateCallback =
    void Function(List<ConnectionResponse> connections);
typedef WebauthnCredentialsUpdateCallback =
    void Function(List<WebAuthnCredentialResponse> credentials);
typedef UserSettingsHydrateCallback =
    void Function(UserSettingsResponse settings);
typedef SessionChangingCallback = void Function();
typedef UnavailableGuildsReadyCallback =
    void Function(List<Map<String, dynamic>> rawGuilds);
typedef GuildAvailabilityChangedCallback =
    void Function(
      String guildId, {
      required bool unavailable,
      bool unavailableHidden,
    });
typedef GuildAvailableCallback = void Function(String guildId);
typedef GuildMembersChunkCallback =
    void Function(String guildId, List<String> userIds);
typedef GuildMembersChunkProgressCallback =
    void Function(
      String guildId,
      int chunkIndex,
      int chunkCount,
      List<String> userIds,
    );
typedef GuildMemberListUpdateCallback =
    void Function(GuildMemberListUpdateEvent event);
typedef VoiceServerUpdateCallback = void Function(VoiceServerUpdateEvent event);
typedef GatewayErrorCallback = void Function(GatewayErrorEvent event);

String? _presenceCustomStatusFromMap(Map<String, dynamic> presence) {
  final Map<String, dynamic>? customStatusMap =
      presence['custom_status'] as Map<String, dynamic>?;
  return serializeCustomStatusMap(customStatusMap);
}

class GatewayEventHandler {
  GatewayEventHandler({
    required this.database,
    this.readStateRepository,
    this.currentUserId,
    this.onReady,
    this.onTypingStart,
    this.onTypingClear,
    this.onVoiceStateUpdate,
    this.onVoiceStatesBulk,
    this.onVoiceServerUpdate,
    this.onGatewayError,
    this.onCallCreate,
    this.onCallUpdate,
    this.onCallDelete,
    this.onInviteCreate,
    this.onInviteDelete,
    this.onGuildPermissionsChanged,
    this.onGuildPermissionsEvict,
    this.onChannelPermissionChanged,
    this.onPermissionsClearAll,
    this.onMessageCreate,
    this.onMessageUpdate,
    this.onMessageDelete,
    this.onMessageDeleteBulk,
    this.onMessageReactionChange,
    this.onOwnMessageCreated,
    this.onMessageAcked,
    this.onAuthSessionIdHashChanged,
    this.onConnectionsUpdate,
    this.onWebauthnCredentialsUpdate,
    this.onUserSettingsHydrate,
    this.onSessionChanging,
    this.onUnavailableGuildsReady,
    this.onGuildAvailabilityChanged,
    this.onGuildAvailable,
    this.onMembersChunk,
    this.onMembersChunkProgress,
    this.onMemberListUpdate,
  });

  final db.FluxerDatabase database;
  final ReadStateRepository? readStateRepository;
  final String? currentUserId;
  final ReadyCallback? onReady;
  final TypingCallback? onTypingStart;
  final TypingCallback? onTypingClear;
  final VoiceStateCallback? onVoiceStateUpdate;
  final VoiceBulkCallback? onVoiceStatesBulk;
  final VoiceServerUpdateCallback? onVoiceServerUpdate;
  final GatewayErrorCallback? onGatewayError;
  final CallCreateCallback? onCallCreate;
  final CallUpdateCallback? onCallUpdate;
  final ChannelCallback? onCallDelete;
  final InviteCreateCallback? onInviteCreate;
  final InviteDeleteCallback? onInviteDelete;
  final GuildCallback? onGuildPermissionsChanged;
  final GuildCallback? onGuildPermissionsEvict;
  final ChannelCallback? onChannelPermissionChanged;
  final void Function()? onPermissionsClearAll;
  final MessageCreateCallback? onMessageCreate;
  final MessageUpdateCallback? onMessageUpdate;
  final MessageDeleteCallback? onMessageDelete;
  final MessageDeleteBulkCallback? onMessageDeleteBulk;
  final MessageReactionChangeCallback? onMessageReactionChange;
  final void Function(String channelId)? onOwnMessageCreated;
  final void Function(String channelId, {required bool manual})? onMessageAcked;
  final void Function(String? idHash)? onAuthSessionIdHashChanged;
  final ConnectionsUpdateCallback? onConnectionsUpdate;
  final WebauthnCredentialsUpdateCallback? onWebauthnCredentialsUpdate;
  final UserSettingsHydrateCallback? onUserSettingsHydrate;
  final SessionChangingCallback? onSessionChanging;
  final UnavailableGuildsReadyCallback? onUnavailableGuildsReady;
  final GuildAvailabilityChangedCallback? onGuildAvailabilityChanged;
  final GuildAvailableCallback? onGuildAvailable;
  final GuildMembersChunkCallback? onMembersChunk;
  final GuildMembersChunkProgressCallback? onMembersChunkProgress;
  final GuildMemberListUpdateCallback? onMemberListUpdate;

  String? _currentUserId;
  String? _lastReadyUserId;
  bool _hasCommittedReady = false;

  Future<void> handle(GatewayEvent event) async {
    switch (event) {
      case ReadyEvent():
        await _handleReady(event);
      case ResumedEvent():
        talker.info('[Gateway] RESUMED');
        onReady?.call();
      case MessageCreateEvent():
        talker.debug('[Gateway] MESSAGE_CREATE: ${event.message.channelId}');
        await _handleMessageCreate(event);
      case MessageUpdateEvent():
        talker.debug('[Gateway] MESSAGE_UPDATE: ${event.message.id}');
        await _handleMessageUpdate(event);
      case MessageDeleteEvent():
        talker.debug('[Gateway] MESSAGE_DELETE: ${event.messageId}');
        await _handleMessageDelete(event);
      case TypingStartEvent():
        _handleTypingStart(event);
      case PresenceUpdateEvent():
        _handlePresenceUpdate(event);
      case GuildMemberAddEvent():
        talker.debug(
          '[Gateway] GUILD_MEMBER_ADD: ${event.member.user.id}'
          ' → ${event.guildId}',
        );
        _handleMemberUpsert(event.guildId, event.member);
        if (event.member.user.id == currentUserId) {
          onGuildPermissionsChanged?.call(event.guildId);
        }
      case GuildMemberUpdateEvent():
        talker.debug(
          '[Gateway] GUILD_MEMBER_UPDATE: ${event.member.user.id}'
          ' → ${event.guildId}',
        );
        _handleMemberUpsert(event.guildId, event.member);
        if (event.member.user.id == currentUserId) {
          onGuildPermissionsChanged?.call(event.guildId);
        }
      case GuildMemberRemoveEvent():
        talker.debug(
          '[Gateway] GUILD_MEMBER_REMOVE: ${event.userId}'
          ' → ${event.guildId}',
        );
        _handleMemberRemove(event);
      case ChannelCreateEvent():
        talker.debug('[Gateway] CHANNEL_CREATE: ${event.channel.id}');
        _handleChannelUpsert(event.channel);
      case ChannelUpdateEvent():
        talker.debug('[Gateway] CHANNEL_UPDATE: ${event.channel.id}');
        _handleChannelUpsert(event.channel);
      case ChannelDeleteEvent():
        talker.debug('[Gateway] CHANNEL_DELETE: ${event.channel.id}');
        _handleChannelDelete(event);
      case MessageReactionAddEvent():
        talker.debug('[Gateway] MESSAGE_REACTION_ADD: ${event.messageId}');
        await _handleReactionAdd(event);
      case MessageReactionRemoveEvent():
        talker.debug('[Gateway] MESSAGE_REACTION_REMOVE: ${event.messageId}');
        await _handleReactionRemove(event);
      case MessageReactionRemoveAllEvent():
        talker.debug(
          '[Gateway] MESSAGE_REACTION_REMOVE_ALL: ${event.messageId}',
        );
        _handleReactionRemoveAll(event);
      case MessageReactionRemoveEmojiEvent():
        talker.debug(
          '[Gateway] MESSAGE_REACTION_REMOVE_EMOJI: ${event.messageId}',
        );
        _handleReactionRemoveEmoji(event);
      case GuildCreateEvent():
        talker.debug('[Gateway] GUILD_CREATE: ${event.guild.guild.id}');
        _handleGuildCreate(event);
      case GuildUpdateEvent():
        talker.debug('[Gateway] GUILD_UPDATE: ${event.guild.guild.id}');
        _handleGuildUpdate(event);
      case GuildDeleteEvent():
        talker.debug('[Gateway] GUILD_DELETE: ${event.guildId}');
        unawaited(_handleGuildDelete(event));
      case RelationshipAddEvent():
        talker.debug(
          '[Gateway] RELATIONSHIP_ADD: ${event.relationship.user.id}',
        );
        _handleRelationshipUpsert(event.relationship);
      case RelationshipUpdateEvent():
        talker.debug(
          '[Gateway] RELATIONSHIP_UPDATE: ${event.relationship.user.id}',
        );
        _handleRelationshipUpsert(event.relationship);
      case RelationshipRemoveEvent():
        talker.debug('[Gateway] RELATIONSHIP_REMOVE: ${event.userId}');
        _handleRelationshipRemove(event);
      case UserUpdateEvent():
        talker.debug('[Gateway] USER_UPDATE: ${event.user.id}');
        _handleUserUpdate(event);
      case MessageDeleteBulkEvent():
        talker.debug(
          '[Gateway] MESSAGE_DELETE_BULK: ${event.ids.length} messages',
        );
        await _handleMessageDeleteBulk(event);
      case MessageAckEvent():
        talker.debug('[Gateway] MESSAGE_ACK: ${event.channelId}');
        await _handleMessageAck(event);
      case MessageReactionAddManyEvent():
        talker.debug('[Gateway] MESSAGE_REACTION_ADD_MANY: ${event.messageId}');
        _handleReactionAddMany(event);
      case ChannelUpdateBulkEvent():
        talker.debug(
          '[Gateway] CHANNEL_UPDATE_BULK: ${event.channels.length} channels',
        );
        for (final channel in event.channels) {
          _handleChannelUpsert(channel);
        }
      case ChannelPinsUpdateEvent():
        talker.debug('[Gateway] CHANNEL_PINS_UPDATE: ${event.channelId}');
        await database.channelDao.updateLastPinTimestamp(
          event.channelId,
          event.lastPinTimestamp,
        );
      case ChannelPinsAckEvent():
        talker.debug('[Gateway] CHANNEL_PINS_ACK: ${event.channelId}');
        final channel = await database.channelDao.getChannelById(
          event.channelId,
        );
        await database.readStateDao.updatePinTimestamp(
          event.channelId,
          event.lastPinTimestamp ?? channel?.lastPinTimestamp,
        );
      case ChannelRecipientAddEvent():
        talker.debug('[Gateway] CHANNEL_RECIPIENT_ADD: ${event.channelId}');
        unawaited(database.userDao.upsertUser(userFromPartialSdk(event.user)));
        unawaited(
          database.dmChannelDao.addRecipientId(event.channelId, event.user.id),
        );
      case ChannelRecipientRemoveEvent():
        talker.debug('[Gateway] CHANNEL_RECIPIENT_REMOVE: ${event.channelId}');
        if (event.user.id == currentUserId) {
          unawaited(database.dmChannelDao.deleteDmChannel(event.channelId));
        } else {
          unawaited(
            database.dmChannelDao.removeRecipientId(
              event.channelId,
              event.user.id,
            ),
          );
        }
      case PassiveUpdatesEvent():
        _handlePassiveUpdates(event);
      case GuildRoleCreateEvent():
        talker.debug('[Gateway] GUILD_ROLE_CREATE: ${event.role.id}');
        _handleRoleUpsert(event.guildId, event.role);
      case GuildRoleUpdateEvent():
        talker.debug('[Gateway] GUILD_ROLE_UPDATE: ${event.role.id}');
        _handleRoleUpsert(event.guildId, event.role);
      case GuildRoleDeleteEvent():
        talker.debug('[Gateway] GUILD_ROLE_DELETE: ${event.roleId}');
        unawaited(database.roleDao.deleteRole(event.roleId));
        onGuildPermissionsChanged?.call(event.guildId);
      case GuildRoleUpdateBulkEvent():
        talker.debug(
          '[Gateway] GUILD_ROLE_UPDATE_BULK: ${event.roles.length} roles',
        );
        _handleRoleUpdateBulk(event);
      case GuildBanAddEvent():
        talker.debug('[Gateway] GUILD_BAN_ADD: ${event.guildId}');
      case GuildBanRemoveEvent():
        talker.debug('[Gateway] GUILD_BAN_REMOVE: ${event.guildId}');
      case GuildEmojisUpdateEvent():
        talker.debug(
          '[Gateway] GUILD_EMOJIS_UPDATE: ${event.guildId}'
          ' (${event.emojis.length})',
        );
        unawaited(_handleGuildEmojisUpdate(event));
      case GuildStickersUpdateEvent():
        talker.debug(
          '[Gateway] GUILD_STICKERS_UPDATE: ${event.guildId}'
          ' (${event.stickers.length})',
        );
        unawaited(_handleGuildStickersUpdate(event));
      case GuildSyncEvent():
        talker.debug('[Gateway] GUILD_SYNC: ${event.guild.guild.id}');
        _handleGuildCreate(GuildCreateEvent(guild: event.guild));
      case GuildMembersChunkEvent():
        talker.debug(
          '[Gateway] GUILD_MEMBERS_CHUNK: ${event.guildId}'
          ' (${event.members.length})',
        );
        _handleMembersChunk(event);
      case GuildMemberListUpdateEvent():
        unawaited(_handleMemberListUpdate(event));
      case PresenceUpdateBulkEvent():
        talker.debug(
          '[Gateway] PRESENCE_UPDATE_BULK: ${event.presences.length}',
        );
        _handlePresenceUpdateBulk(event);
      case VoiceStateUpdateEvent():
        talker.debug(
          '[Gateway] VOICE_STATE_UPDATE: ${event.state.userId}'
          ' → ${event.state.channelId}',
        );
        onVoiceStateUpdate?.call(event.state);
      case final VoiceServerUpdateEvent e:
        talker.info(
          '[Gateway] VOICE_SERVER_UPDATE guildId=${e.guildId} '
          'channelId=${e.channelId}',
        );
        onVoiceServerUpdate?.call(e);
      case CallCreateEvent():
        talker.debug('[Gateway] CALL_CREATE: ${event.channelId}');
        onCallCreate?.call(event);
      case CallUpdateEvent():
        talker.debug('[Gateway] CALL_UPDATE: ${event.channelId}');
        onCallUpdate?.call(event);
      case CallDeleteEvent():
        talker.debug('[Gateway] CALL_DELETE: ${event.channelId}');
        onCallDelete?.call(event.channelId);
      case UserSettingsUpdateEvent():
        talker.debug('[Gateway] USER_SETTINGS_UPDATE');
        unawaited(_handleUserSettingsUpdate(event));
      case UserGuildSettingsUpdateEvent():
        talker.debug('[Gateway] USER_GUILD_SETTINGS_UPDATE: ${event.guildId}');
        unawaited(_handleUserGuildSettingsUpdate(event));
      case UserPinnedDmsUpdateEvent():
        talker.debug('[Gateway] USER_PINNED_DMS_UPDATE');
        unawaited(_handleUserPinnedDmsUpdate(event));
      case UserNoteUpdateEvent():
        talker.debug('[Gateway] USER_NOTE_UPDATE: ${event.userId}');
        unawaited(_handleUserNoteUpdate(event));
      case UserConnectionsUpdateEvent():
        talker.debug('[Gateway] USER_CONNECTIONS_UPDATE');
        _handleUserConnectionsUpdate(event);
      case WebauthnCredentialsUpdateEvent():
        talker.debug('[Gateway] WEBAUTHN_CREDENTIALS_UPDATE');
        onWebauthnCredentialsUpdate?.call(event.credentials);
      case AuthSessionChangeEvent():
        talker.debug('[Gateway] AUTH_SESSION_CHANGE');
        onAuthSessionIdHashChanged?.call(event.newAuthSessionIdHash);
      case InviteCreateEvent():
        talker.debug('[Gateway] INVITE_CREATE');
        onInviteCreate?.call(event.data);
      case InviteDeleteEvent():
        talker.debug('[Gateway] INVITE_DELETE: ${event.code}');
        onInviteDelete?.call(event.code);
      case SavedMessageCreateEvent():
        talker.debug('[Gateway] SAVED_MESSAGE_CREATE: ${event.message.id}');
        unawaited(database.savedMessageDao.addSavedMessage(event.message.id));
      case SavedMessageDeleteEvent():
        talker.debug('[Gateway] SAVED_MESSAGE_DELETE: ${event.messageId}');
        unawaited(database.savedMessageDao.removeSavedMessage(event.messageId));
      case RecentMentionDeleteEvent():
        talker.debug('[Gateway] RECENT_MENTION_DELETE: ${event.messageId}');
        unawaited(database.notificationDao.deleteMentionRow(event.messageId));
      case WebhooksUpdateEvent():
        talker.debug('[Gateway] WEBHOOKS_UPDATE: ${event.channelId}');
      case FavoriteMemeCreateEvent():
        talker.debug('[Gateway] FAVORITE_MEME_CREATE');
        unawaited(_handleFavoriteMemeCreate(event));
      case FavoriteMemeUpdateEvent():
        talker.debug('[Gateway] FAVORITE_MEME_UPDATE');
        unawaited(_handleFavoriteMemeUpdate(event));
      case FavoriteMemeDeleteEvent():
        talker.debug('[Gateway] FAVORITE_MEME_DELETE: ${event.id}');
        unawaited(_handleFavoriteMemeDelete(event));
      case SessionsReplaceEvent():
        talker.debug('[Gateway] SESSIONS_REPLACE');
      case final GatewayErrorEvent e:
        talker.warning('[Gateway] Error: [${e.code}] ${e.message}');
        onGatewayError?.call(e);
      case UnknownGatewayEvent():
        if (event.eventType == 'MESSAGE_UPDATE') {
          talker.warning(
            '[Gateway] Failed to parse MESSAGE_UPDATE: ${event.data}',
          );
        } else {
          talker.debug('[Gateway] Unknown event: ${event.eventType}');
        }
    }
  }

  Future<void> _handleReady(ReadyEvent event) async {
    final Stopwatch readyStopwatch = Stopwatch()..start();
    final bool isSameUserReconnect =
        _hasCommittedReady &&
        _lastReadyUserId != null &&
        _lastReadyUserId == event.user.id;
    final bool shouldFullWipe = !isSameUserReconnect;
    if (shouldFullWipe) {
      onSessionChanging?.call();
    }
    talker.info(
      '[Gateway] READY received (session: ${event.sessionId})'
      ' — guilds: ${event.guilds.length}'
      ', DMs: ${event.privateChannels.length}'
      ', relationships: ${event.relationships.length}'
      ', presences: ${event.presences.length}'
      ', readStates: ${event.readStates.length}'
      ', user: ${event.user.id}'
      ', mode: ${shouldFullWipe ? 'full' : 'incremental'}',
    );

    _currentUserId = event.user.id;
    onPermissionsClearAll?.call();
    onAuthSessionIdHashChanged?.call(event.authSessionIdHash);

    final readStatesByChannelId = <String, GatewayReadState>{
      for (final readState in event.readStates) readState.id: readState,
    };
    final hasUnavailableGuilds = event.rawGuilds.any(
      (guild) => guild['unavailable'] as bool? ?? false,
    );

    final List<String> prunedGuildIds = <String>[];

    await database.transaction(() async {
      if (shouldFullWipe) {
        await database.userDao.clearAll();
        await database.guildDao.clearAll();
        await database.channelDao.clearAll();
        await database.dmChannelDao.clearAll();
        await database.memberDao.clearAll();
        await database.roleDao.clearAll();
        await database.relationshipDao.clearAll();
        await database.readStateDao.clearAll();
        await database.userSettingsDao.clearAll();
        await database.userGuildSettingsDao.clearAll();
        await database.userNotesDao.clearAll();
        await database.pinnedDmsDao.clearAll();
        await database.favoriteMemesDao.clearAll();
        await database.rtcRegionsDao.clearAll();
        await database.guildEmojiDao.clearAll();
        await database.guildStickerDao.clearAll();
      }

      // Gateway never echoes the current user's own presence back.
      final selfStatus = event.userSettings?.status ?? 'online';
      await database.userDao.upsertUser(
        db.UsersCompanion.insert(
          id: event.user.id,
          username: event.user.username,
          discriminator: Value(event.user.discriminator),
          globalName: Value(event.user.globalName),
          avatar: Value(event.user.avatar),
          avatarColor: Value(event.user.avatarColor),
          bot: Value(event.user.bot ?? false),
          system: Value(event.user.system ?? false),
          status: Value(selfStatus),
          memberSince: Value(dateTimeFromUserSnowflakeOrNull(event.user.id)),
          bio: Value(event.user.bio),
          pronouns: Value(event.user.pronouns),
          accentColor: Value(event.user.accentColor),
          banner: Value(event.user.banner),
          premiumBadgeHidden: Value(event.user.premiumBadgeHidden),
          premiumBadgeMasked: Value(event.user.premiumBadgeMasked),
          premiumBadgeTimestampHidden: Value(
            event.user.premiumBadgeTimestampHidden,
          ),
          premiumBadgeSequenceHidden: Value(
            event.user.premiumBadgeSequenceHidden,
          ),
          customStatus: Value(
            serializeCustomStatus(event.userSettings?.customStatus),
          ),
        ),
      );

      final cachedUsers = event.users;
      if (cachedUsers != null && cachedUsers.isNotEmpty) {
        await database.userDao.upsertUsers(
          cachedUsers
              .map(
                (u) => userFromPartialSdk(
                  UserPartialResponse.fromJson(u.cast<String, Object?>()),
                ),
              )
              .toList(),
        );
      }

      final guildPositions = <String, int>{};
      final userSettings = event.userSettings;
      if (userSettings != null) {
        var pos = 0;
        for (final folder in userSettings.guildFolders) {
          for (final guildId in folder.guildIds) {
            guildPositions[guildId] = pos;
            pos++;
          }
        }
      }

      if (event.rawGuilds.isNotEmpty) {
        final List<ParsedReadyGuild> processedGuilds = await parseReadyGuilds(
          rawGuilds: event.rawGuilds,
          guildPositions: guildPositions,
        );
        final List<db.ServersCompanion> guildCompanions = processedGuilds
            .map(
              (ParsedReadyGuild parsed) => guildFromSdk(
                parsed.guildData.guild,
                position: parsed.position,
                memberCount: parsed.memberCount,
                onlineCount: parsed.onlineCount,
              ),
            )
            .toList();
        if (guildCompanions.isNotEmpty) {
          await database.guildDao.upsertServers(guildCompanions);
        }

        for (final ParsedReadyGuild parsed in processedGuilds) {
          final GuildCreateData guildData = parsed.guildData;
          final String guildId = guildData.guild.id;

          for (final channel in guildData.channels) {
            await database.channelDao.upsertChannel(
              channelFromSdk(channel, guildId),
            );
          }

          if (guildData.roles.isNotEmpty) {
            await database.roleDao.upsertRoles(
              guildData.roles.map((r) => roleFromSdk(r, guildId)).toList(),
            );
          }

          for (final member in guildData.members) {
            await database.userDao.upsertUser(userFromPartialSdk(member.user));
            await database.memberDao.upsertMember(
              memberCompanionFromSdk(member, guildId: guildId),
            );
          }

          if (guildData.voiceStates.isNotEmpty) {
            onVoiceStatesBulk?.call(guildData.voiceStates);
          }

          if (guildData.emojis.isNotEmpty) {
            await database.guildEmojiDao.replaceForGuild(
              guildId,
              guildData.emojis
                  .map(
                    (e) => db.GuildEmojisCompanion.insert(
                      id: e.id,
                      guildId: guildId,
                      name: e.name,
                      animated: Value(e.animated),
                    ),
                  )
                  .toList(),
            );
          }

          if (guildData.stickers.isNotEmpty) {
            await database.guildStickerDao.replaceForGuild(
              guildId,
              guildData.stickers
                  .map(
                    (s) => db.GuildStickersCompanion.insert(
                      id: s.id,
                      guildId: guildId,
                      name: s.name,
                      description: Value(s.description),
                      tagsJson: Value(jsonEncode(s.tags)),
                      animated: Value(s.animated),
                    ),
                  )
                  .toList(),
            );
          }
        }

        if (isSameUserReconnect) {
          final readyGuildIds = <String>{
            for (final rawGuild in event.rawGuilds)
              if (rawGuild['id'] is String) rawGuild['id'] as String,
          };
          prunedGuildIds.addAll(
            await removeGuildsNotInLocalDb(database, readyGuildIds),
          );
        }
      }

      if (event.privateChannels.isNotEmpty) {
        final dmCompanions = <db.DmChannelsCompanion>[];
        final recipientUsers = <db.UsersCompanion>[];
        for (final ch in event.privateChannels) {
          final companion = dmChannelCompanionFromChannelResponse(
            ch,
            unreadCount: readStatesByChannelId[ch.id]?.mentionCount ?? 0,
          );
          if (companion == null) {
            continue;
          }
          for (final r in dmRecipientUsersFromChannelResponse(ch)) {
            recipientUsers.add(userFromPartialSdk(r));
          }
          dmCompanions.add(companion);
        }
        if (recipientUsers.isNotEmpty) {
          await database.userDao.upsertUsers(recipientUsers);
        }
        if (dmCompanions.isNotEmpty) {
          await database.dmChannelDao.upsertDmChannels(dmCompanions);
        }
      }
      await database.dmChannelDao.upsertDmChannels([
        buildPersonalNotesDmCompanion(userId: event.user.id),
      ]);

      if (event.relationships.isNotEmpty) {
        final relUsers = <db.UsersCompanion>[];
        final relCompanions = <db.RelationshipsCompanion>[];
        for (final rel in event.relationships) {
          relUsers.add(userFromPartialSdk(rel.user));
          relCompanions.add(
            db.RelationshipsCompanion.insert(
              userId: rel.user.id,
              type: rel.type.json ?? 1,
              nickname: Value(rel.nickname),
              since: Value(rel.since),
            ),
          );
        }
        await database.userDao.upsertUsers(relUsers);
        await database.relationshipDao.upsertRelationships(relCompanions);
      }

      for (final p in event.presences) {
        final userId = (p['user'] as Map<String, dynamic>?)?['id'] as String?;
        final status = p['status'] as String?;
        if (userId != null && status != null) {
          await database.userDao.updateUserPresence(
            userId,
            status: status,
            customStatus: _presenceCustomStatusFromMap(p),
          );
        }
      }

      if (event.readStates.isNotEmpty) {
        for (final rs in event.readStates) {
          await database.readStateDao.upsertReadState(
            db.ReadStatesCompanion(
              channelId: Value(rs.id),
              lastMessageId: Value(rs.lastMessageId),
              mentionCount: Value(rs.mentionCount),
              lastPinTimestamp: Value(rs.lastPinTimestamp),
              manual: const Value(false),
            ),
          );
        }
      }

      if (userSettings != null) {
        await database.userSettingsDao.upsertSettings(
          db.UserSettingsTableCompanion(
            userId: Value(event.user.id),
            data: Value(jsonEncode(userSettings.toJson())),
          ),
        );
      }

      final guildSettings = event.userGuildSettings;
      if (guildSettings != null) {
        for (final gs in guildSettings) {
          final guildId = gs.guildId ?? '@me';
          await database.userGuildSettingsDao.upsert(
            db.UserGuildSettingsTableCompanion(
              guildId: Value(guildId),
              data: Value(jsonEncode(gs.toJson())),
            ),
          );
        }
      }

      final notes = event.notes;
      if (notes != null && notes.isNotEmpty) {
        await database.userNotesDao.upsertNotes(
          notes.entries
              .map(
                (e) => db.UserNotesTableCompanion(
                  targetUserId: Value(e.key),
                  content: Value(e.value),
                ),
              )
              .toList(),
        );
      }

      final pinnedDms = event.pinnedDms;
      if (pinnedDms != null) {
        final companions = <db.PinnedDmsTableCompanion>[
          for (var i = 0; i < pinnedDms.length; i++)
            db.PinnedDmsTableCompanion(
              channelId: Value(pinnedDms[i]),
              position: Value(i),
            ),
        ];
        await database.pinnedDmsDao.replaceAll(companions);
      }

      final favoriteMemes = event.favoriteMemes;
      if (favoriteMemes != null) {
        for (final meme in favoriteMemes) {
          final id = meme['id'] as String?;
          if (id == null) {
            continue;
          }
          await database.favoriteMemesDao.upsert(
            db.FavoriteMemesTableCompanion(
              id: Value(id),
              data: Value(jsonEncode(meme)),
            ),
          );
        }
      }

      final rtcRegions = event.rtcRegions;
      if (rtcRegions != null) {
        for (final region in rtcRegions) {
          final id = region['id'] as String?;
          if (id == null) {
            continue;
          }
          await database
              .into(database.rtcRegionsTable)
              .insert(
                db.RtcRegionsTableCompanion(
                  id: Value(id),
                  data: Value(jsonEncode(region)),
                ),
              );
        }
      }
    });

    for (final guildId in prunedGuildIds) {
      onGuildPermissionsEvict?.call(guildId);
    }

    talker.info(
      '[Gateway] READY transaction committed successfully in '
      '${readyStopwatch.elapsedMilliseconds}ms',
    );
    _lastReadyUserId = event.user.id;
    _hasCommittedReady = true;
    final hydratedSettings = event.userSettings;
    if (hydratedSettings != null) {
      onUserSettingsHydrate?.call(hydratedSettings);
    }
    if (!hasUnavailableGuilds) {
      unawaited(readStateRepository?.cleanupStaleReadStates());
    }
    onUnavailableGuildsReady?.call(event.rawGuilds);
    onReady?.call();
  }

  Future<void> _handleUserSettingsUpdate(UserSettingsUpdateEvent event) async {
    final userId = _currentUserId;
    if (userId == null) {
      return;
    }
    await database.userSettingsDao.upsertSettings(
      db.UserSettingsTableCompanion(
        userId: Value(userId),
        data: Value(jsonEncode(event.settings.toJson())),
      ),
    );
    await database.userDao.updateUserPresence(
      userId,
      status: event.settings.status,
      customStatus: serializeCustomStatus(event.settings.customStatus),
    );
    onUserSettingsHydrate?.call(event.settings);
  }

  Future<void> _handleUserGuildSettingsUpdate(
    UserGuildSettingsUpdateEvent event,
  ) async {
    final guildId = _userGuildSettingsStorageId(event.guildId, event.data);
    final existingRow = await database.userGuildSettingsDao.getByGuildId(
      guildId,
    );
    final merged = _mergeUserGuildSettingsData(
      guildId: guildId,
      existing: existingRow == null
          ? null
          : _tryDecodeJsonObject(existingRow.data),
      updates: event.data,
    );
    await database.userGuildSettingsDao.upsert(
      db.UserGuildSettingsTableCompanion(
        guildId: Value(guildId),
        data: Value(jsonEncode(merged)),
      ),
    );
  }

  String _userGuildSettingsStorageId(
    String eventGuildId,
    Map<String, dynamic> data,
  ) {
    final rawGuildId = data['guild_id'];
    if (rawGuildId is String && rawGuildId.isNotEmpty) {
      return rawGuildId;
    }
    return eventGuildId.isEmpty ? '@me' : eventGuildId;
  }

  Map<String, dynamic>? _tryDecodeJsonObject(String data) {
    try {
      final decoded = jsonDecode(data);
      return decoded is Map ? decoded.cast<String, dynamic>() : null;
    } on Object {
      return null;
    }
  }

  Map<String, dynamic> _mergeUserGuildSettingsData({
    required String guildId,
    required Map<String, dynamic>? existing,
    required Map<String, dynamic> updates,
  }) {
    final updatesWithoutOverrides = Map<String, dynamic>.from(updates);
    final Object? channelOverridesUpdate =
        updates.containsKey('channel_overrides')
        ? updatesWithoutOverrides.remove('channel_overrides')
        : null;
    final merged = <String, dynamic>{
      ..._defaultUserGuildSettingsData(guildId),
      ...?existing,
      ...updatesWithoutOverrides,
    };
    if (updates.containsKey('channel_overrides')) {
      merged['channel_overrides'] = _mergeChannelOverrides(
        existing?['channel_overrides'],
        channelOverridesUpdate,
      );
    }
    merged['guild_id'] = guildId == '@me' ? null : guildId;
    return merged;
  }

  Map<String, dynamic> _defaultUserGuildSettingsData(String guildId) {
    return UserGuildSettingsResponse(
      guildId: guildId == '@me' ? null : guildId,
      messageNotifications: guildId == '@me'
          ? UserNotificationSettings.allMessages
          : UserNotificationSettings.inherit,
      muted: false,
      muteConfig: null,
      mobilePush: true,
      suppressEveryone: false,
      suppressRoles: false,
      hideMutedChannels: false,
      channelOverrides: null,
      version: -1,
    ).toJson();
  }

  Map<String, dynamic>? _mergeChannelOverrides(
    Object? existingRaw,
    Object? updatesRaw,
  ) {
    if (updatesRaw == null) {
      return null;
    }
    final existing = existingRaw is Map
        ? existingRaw.cast<String, dynamic>()
        : const <String, dynamic>{};
    final updates = updatesRaw is Map
        ? updatesRaw.cast<String, dynamic>()
        : const <String, dynamic>{};
    final merged = <String, dynamic>{...existing};
    for (final entry in updates.entries) {
      final existingOverride = existing[entry.key];
      final updateOverride = entry.value;
      if (updateOverride is Map) {
        merged[entry.key] = <String, dynamic>{
          ..._defaultChannelOverrideData(),
          if (existingOverride is Map)
            ...existingOverride.cast<String, dynamic>(),
          ...updateOverride.cast<String, dynamic>(),
        };
      } else {
        merged[entry.key] = updateOverride;
      }
    }
    return merged;
  }

  Map<String, dynamic> _defaultChannelOverrideData() {
    return const ChannelOverrides(
      collapsed: false,
      messageNotifications: UserNotificationSettings.inherit,
      muted: false,
      muteConfig: null,
    ).toJson();
  }

  Future<void> _handleUserNoteUpdate(UserNoteUpdateEvent event) async {
    if (event.note == null || event.note!.isEmpty) {
      await database.userNotesDao.deleteNote(event.userId);
    } else {
      await database.userNotesDao.upsertNote(
        db.UserNotesTableCompanion(
          targetUserId: Value(event.userId),
          content: Value(event.note!),
        ),
      );
    }
  }

  void _handleUserConnectionsUpdate(UserConnectionsUpdateEvent event) {
    final callback = onConnectionsUpdate;
    if (callback == null) {
      return;
    }
    final rawList = event.data['connections'];
    if (rawList is! List) {
      return;
    }
    final connections = <ConnectionResponse>[];
    for (final raw in rawList) {
      if (raw is Map) {
        connections.add(
          ConnectionResponse.fromJson(raw.cast<String, Object?>()),
        );
      }
    }
    callback(connections);
  }

  Future<void> _handleUserPinnedDmsUpdate(
    UserPinnedDmsUpdateEvent event,
  ) async {
    final companions = <db.PinnedDmsTableCompanion>[];
    for (var i = 0; i < event.pinnedDmChannelIds.length; i++) {
      companions.add(
        db.PinnedDmsTableCompanion(
          channelId: Value(event.pinnedDmChannelIds[i]),
          position: Value(i),
        ),
      );
    }
    await database.pinnedDmsDao.replaceAll(companions);
  }

  Future<void> _handleFavoriteMemeCreate(FavoriteMemeCreateEvent event) async {
    final id = event.data['id'] as String? ?? '';
    if (id.isNotEmpty) {
      await database.favoriteMemesDao.upsert(
        db.FavoriteMemesTableCompanion(
          id: Value(id),
          data: Value(jsonEncode(event.data)),
        ),
      );
    }
  }

  Future<void> _handleFavoriteMemeUpdate(FavoriteMemeUpdateEvent event) async {
    final id = event.data['id'] as String? ?? '';
    if (id.isNotEmpty) {
      await database.favoriteMemesDao.upsert(
        db.FavoriteMemesTableCompanion(
          id: Value(id),
          data: Value(jsonEncode(event.data)),
        ),
      );
    }
  }

  Future<void> _handleFavoriteMemeDelete(FavoriteMemeDeleteEvent event) async {
    await database.favoriteMemesDao.deleteMeme(event.id);
  }

  Future<void> _handleMessageCreate(MessageCreateEvent event) async {
    final mentionsCurrentUser = await _messageMentionsCurrentUser(
      event.message,
    );
    final msg = Message.fromSdk(
      event.message,
      currentUserId: currentUserId,
    ).copyWith(isMentioned: mentionsCurrentUser);

    onTypingClear?.call(msg.channelId, msg.authorId);

    if (event.message.webhookId == null) {
      unawaited(
        database.userDao.upsertUser(userFromPartialSdk(event.message.author)),
      );
      unawaited(upsertMentionUsersFromSdk(database, event.message.mentions));
    }

    await database.messageDao.upsertMessage(msg.toCompanion());

    await database.channelDao.updateLastMessageId(msg.channelId, msg.id);

    // No-op for guild channels — only DM rows have a last-message column.
    await database.dmChannelDao.updateLastMessage(
      msg.channelId,
      msg.id,
      msg.content,
      msg.authorId,
      msg.timestamp,
    );

    await _updateReadStateForCreatedMessage(
      msg,
      mentionsCurrentUser: mentionsCurrentUser,
    );

    onMessageCreate?.call(event);
  }

  Future<void> _updateReadStateForCreatedMessage(
    Message msg, {
    required bool mentionsCurrentUser,
  }) async {
    final isOwnMessage = msg.authorId == currentUserId;
    final dm = await database.dmChannelDao.getDmChannelById(msg.channelId);

    if (isOwnMessage) {
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: Value(msg.channelId),
          lastMessageId: Value(msg.id),
          mentionCount: const Value(0),
          manual: const Value(false),
          stickyUnreadMessageId: const Value(null),
        ),
      );
      if (dm != null) {
        await database.dmChannelDao.markAsRead(msg.channelId);
      }
      onOwnMessageCreated?.call(msg.channelId);
      return;
    }

    if (dm != null) {
      if (await database.relationshipDao.isBlocked(msg.authorId)) {
        return;
      }
      await database.dmChannelDao.incrementUnreadCount(msg.channelId);
      if (!await _isDmMuted(msg.channelId)) {
        await database.readStateDao.incrementMentionCount(msg.channelId);
      }
      return;
    }

    if (mentionsCurrentUser) {
      await database.readStateDao.incrementMentionCount(msg.channelId);
      await database.notificationDao.prependMentionRow(
        messageId: msg.id,
        channelId: msg.channelId,
      );
    }
  }

  Future<bool> _isDmMuted(String channelId) async {
    final settingsRow = await database.userGuildSettingsDao.getByGuildId('@me');
    final settings = settingsRow == null
        ? null
        : decodeUserGuildSettings(settingsRow.data);
    return isChannelOverrideMuted(
      settings?.channelOverrides?[channelId],
      now: DateTime.now(),
    );
  }

  Future<bool> _messageMentionsCurrentUser(
    MessageResponseSchema message,
  ) async {
    final userId = currentUserId;
    if (userId == null || message.author.id == userId) {
      return false;
    }
    if (await database.relationshipDao.isBlocked(message.author.id)) {
      return false;
    }
    if (message.mentions.any((u) => u.id == userId)) {
      return true;
    }
    final channel = await database.channelDao.getChannelById(message.channelId);
    if (channel == null) {
      return message.mentionEveryone;
    }
    if (!message.mentionEveryone && message.mentionRoles.isEmpty) {
      return false;
    }
    final settingsRow = await database.userGuildSettingsDao.getByGuildId(
      channel.guildId,
    );
    final settings = settingsRow == null
        ? null
        : UserGuildSettingsResponse.fromJson(
            jsonDecode(settingsRow.data) as Map<String, dynamic>,
          );
    if (message.mentionEveryone) {
      return !(settings?.suppressEveryone ?? false);
    }
    final roleIds = message.mentionRoles;
    if (roleIds.isEmpty || (settings?.suppressRoles ?? false)) {
      return false;
    }
    final member = await database.memberDao.getMemberByUserId(
      userId,
      channel.guildId,
    );
    if (member == null) {
      return false;
    }
    final memberRoleIds = (jsonDecode(member.roleIdsJson) as List<dynamic>)
        .map((roleId) => roleId.toString())
        .toSet();
    return roleIds.any(memberRoleIds.contains);
  }

  Future<void> _handleMessageUpdate(MessageUpdateEvent event) async {
    final msg = Message.fromSdk(event.message, currentUserId: currentUserId);
    if (event.message.webhookId == null) {
      unawaited(
        database.userDao.upsertUser(userFromPartialSdk(event.message.author)),
      );
      unawaited(upsertMentionUsersFromSdk(database, event.message.mentions));
    }
    await database.messageDao.upsertMessage(msg.toCompanion());
    final dm = await database.dmChannelDao.getDmChannelById(msg.channelId);
    if (dm != null && dm.lastMessageId == msg.id) {
      await database.dmChannelDao.updateLastMessage(
        msg.channelId,
        msg.id,
        msg.content,
        msg.authorId,
        msg.timestamp,
      );
    }
    onMessageUpdate?.call(event);
  }

  Future<void> _handleMessageDelete(MessageDeleteEvent event) async {
    await _deleteMessagesAndRecalculate(
      channelId: event.channelId,
      messageIds: [event.messageId],
    );
    onMessageDelete?.call(event);
  }

  Future<void> _deleteMessagesAndRecalculate({
    required String channelId,
    required List<String> messageIds,
  }) async {
    if (messageIds.isEmpty) {
      return;
    }

    await database.transaction(() async {
      for (final messageId in messageIds) {
        await database.notificationDao.deleteMentionRow(messageId);
      }
      await database.messageDao.deleteMessages(messageIds);
      await _refreshLastMessageAfterDelete(channelId);
      await _recalculateReadStateFromCachedMessages(channelId);
    });
  }

  Future<void> _refreshLastMessageAfterDelete(String channelId) async {
    final latest = await database.messageDao.getLastMessage(channelId);
    final channel = await database.channelDao.getChannelById(channelId);
    if (channel != null) {
      await database.channelDao.setLastMessageId(channelId, latest?.id);
    }

    final dm = await database.dmChannelDao.getDmChannelById(channelId);
    if (dm != null) {
      await database.dmChannelDao.replaceLastMessageFromCache(
        channelId,
        latest,
      );
    }
  }

  Future<void> _recalculateReadStateFromCachedMessages(String channelId) async {
    final readState = await database.readStateDao.getReadState(channelId);
    if (readState == null) {
      return;
    }

    final messages = await database.messageDao.getAllMessagesForChannel(
      channelId,
    );
    final dm = await database.dmChannelDao.getDmChannelById(channelId);
    final mentionCount = dm != null
        ? await _recalculateDmUnreadCount(
            channelId: channelId,
            ackMessageId: readState.lastMessageId,
            messages: messages,
          )
        : messages
              .where(
                (message) =>
                    message.isMentioned &&
                    compareSnowflakeIds(message.id, readState.lastMessageId) >
                        0,
              )
              .length;
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value(readState.lastMessageId),
        mentionCount: Value(mentionCount),
        lastPinTimestamp: Value(readState.lastPinTimestamp),
        manual: Value(readState.manual),
      ),
    );

    if (dm != null) {
      await database.dmChannelDao.updateUnreadCount(channelId, mentionCount);
    }
  }

  Future<int> _recalculateDmUnreadCount({
    required String channelId,
    required String? ackMessageId,
    required List<db.Message> messages,
  }) async {
    if (await _isDmMuted(channelId)) {
      return 0;
    }
    final blockedUserIds = await database.relationshipDao.getBlockedUserIds();
    return messages
        .where(
          (message) =>
              compareSnowflakeIds(message.id, ackMessageId) > 0 &&
              (currentUserId == null || message.authorId != currentUserId) &&
              !blockedUserIds.contains(message.authorId),
        )
        .length;
  }

  void _handleTypingStart(TypingStartEvent event) {
    onTypingStart?.call(event.channelId, event.userId);
  }

  void _handlePresenceUpdate(PresenceUpdateEvent event) {
    unawaited(
      database.userDao.updateUserPresence(
        event.userId,
        status: event.status,
        customStatus: event.customStatus,
      ),
    );
  }

  void _handleMemberUpsert(String guildId, GuildMemberResponse member) {
    unawaited(database.userDao.upsertUser(userFromPartialSdk(member.user)));

    unawaited(
      database.memberDao.upsertMember(
        memberCompanionFromSdk(member, guildId: guildId),
      ),
    );
  }

  void _handleMemberRemove(GuildMemberRemoveEvent event) {
    if (event.userId == currentUserId) {
      unawaited(_removeGuildLocally(event.guildId));
      return;
    }
    unawaited(database.memberDao.deleteMember(event.userId, event.guildId));
  }

  void _handleChannelUpsert(ChannelResponse channel) {
    final guildId = channel.guildId;
    if (guildId != null) {
      unawaited(
        database.channelDao.upsertChannel(channelFromSdk(channel, guildId)),
      );
      onChannelPermissionChanged?.call(channel.id);
      return;
    }

    final companion = dmChannelCompanionFromChannelResponse(channel);
    if (companion == null) {
      return;
    }
    for (final r in dmRecipientUsersFromChannelResponse(channel)) {
      unawaited(database.userDao.upsertUser(userFromPartialSdk(r)));
    }
    unawaited(database.dmChannelDao.upsertDmChannels([companion]));
  }

  void _handleChannelDelete(ChannelDeleteEvent event) {
    unawaited(database.messageDao.deleteMessagesForChannel(event.channel.id));
    unawaited(database.channelDao.deleteChannel(event.channel.id));
    unawaited(database.dmChannelDao.deleteDmChannel(event.channel.id));
    unawaited(database.readStateDao.deleteReadState(event.channel.id));
  }

  void _handleUserUpdate(UserUpdateEvent event) {
    unawaited(
      database.userDao.upsertUser(
        db.UsersCompanion.insert(
          id: event.user.id,
          username: event.user.username,
          discriminator: Value(event.user.discriminator),
          globalName: Value(event.user.globalName),
          avatar: Value(event.user.avatar),
          avatarColor: Value(event.user.avatarColor),
          bot: Value(event.user.bot ?? false),
          system: Value(event.user.system ?? false),
          memberSince: Value(dateTimeFromUserSnowflakeOrNull(event.user.id)),
          bio: Value(event.user.bio),
          pronouns: Value(event.user.pronouns),
          accentColor: Value(event.user.accentColor),
          banner: Value(event.user.banner),
          premiumBadgeHidden: Value(event.user.premiumBadgeHidden),
          premiumBadgeMasked: Value(event.user.premiumBadgeMasked),
          premiumBadgeTimestampHidden: Value(
            event.user.premiumBadgeTimestampHidden,
          ),
          premiumBadgeSequenceHidden: Value(
            event.user.premiumBadgeSequenceHidden,
          ),
        ),
      ),
    );
  }

  Future<void> _handleMessageDeleteBulk(MessageDeleteBulkEvent event) async {
    await _deleteMessagesAndRecalculate(
      channelId: event.channelId,
      messageIds: event.ids,
    );
    onMessageDeleteBulk?.call(event);
  }

  void _handleRoleUpsert(String guildId, GuildRoleResponse role) {
    unawaited(database.roleDao.upsertRoles([roleFromSdk(role, guildId)]));
    onGuildPermissionsChanged?.call(guildId);
  }

  void _handleRoleUpdateBulk(GuildRoleUpdateBulkEvent event) {
    unawaited(
      database.roleDao.upsertRoles(
        event.roles.map((r) => roleFromSdk(r, event.guildId)).toList(),
      ),
    );
    onGuildPermissionsChanged?.call(event.guildId);
  }

  void _handleMembersChunk(GuildMembersChunkEvent event) {
    final List<String> userIds = <String>[];
    for (final GuildMemberResponse member in event.members) {
      userIds.add(member.user.id);
      _handleMemberUpsert(event.guildId, member);
    }
    final List<Map<String, dynamic>>? presences = event.presences;
    if (presences != null && presences.isNotEmpty) {
      final List<({String userId, String status, String? customStatus})>
      updates = <({String userId, String status, String? customStatus})>[];
      for (final Map<String, dynamic> presence in presences) {
        final String? userId =
            (presence['user'] as Map<String, dynamic>?)?['id'] as String?;
        final String? status = presence['status'] as String?;
        if (userId == null || status == null) {
          continue;
        }
        updates.add((
          userId: userId,
          status: status,
          customStatus: _presenceCustomStatusFromMap(presence),
        ));
      }
      if (updates.isNotEmpty) {
        unawaited(database.userDao.updateUserPresencesBatch(updates));
      }
    }
    onMembersChunk?.call(event.guildId, userIds);
    onMembersChunkProgress?.call(
      event.guildId,
      event.chunkIndex,
      event.chunkCount,
      userIds,
    );
    if (currentUserId != null && userIds.contains(currentUserId)) {
      onGuildPermissionsChanged?.call(event.guildId);
    }
  }

  Future<void> _handleMemberListUpdate(GuildMemberListUpdateEvent event) async {
    onMemberListUpdate?.call(event);
  }

  void _handlePresenceUpdateBulk(PresenceUpdateBulkEvent event) {
    final updates = <({String userId, String status, String? customStatus})>[];
    for (final p in event.presences) {
      final userId = (p['user'] as Map<String, dynamic>?)?['id'] as String?;
      final status = p['status'] as String?;
      if (userId != null && status != null) {
        updates.add((
          userId: userId,
          status: status,
          customStatus: _presenceCustomStatusFromMap(p),
        ));
      }
    }
    unawaited(database.userDao.updateUserPresencesBatch(updates));
  }

  void _handleGuildCreate(GuildCreateEvent event) {
    final guildId = event.guild.guild.id;
    onGuildAvailable?.call(guildId);

    unawaited(
      database.transaction(() async {
        await database.guildDao.upsertServer(guildFromSdk(event.guild.guild));

        for (final channel in event.guild.channels) {
          final channelGuildId = channel.guildId;
          if (channelGuildId != null) {
            await database.channelDao.upsertChannel(
              channelFromSdk(channel, channelGuildId),
            );
          }
        }

        if (event.guild.roles.isNotEmpty) {
          await database.roleDao.upsertRoles(
            event.guild.roles.map((r) => roleFromSdk(r, guildId)).toList(),
          );
        }

        for (final member in event.guild.members) {
          _handleMemberUpsert(guildId, member);
        }

        if (event.guild.emojis.isNotEmpty) {
          await database.guildEmojiDao.replaceForGuild(
            guildId,
            event.guild.emojis
                .map(
                  (e) => db.GuildEmojisCompanion.insert(
                    id: e.id,
                    guildId: guildId,
                    name: e.name,
                    animated: Value(e.animated),
                  ),
                )
                .toList(),
          );
        }

        if (event.guild.stickers.isNotEmpty) {
          await database.guildStickerDao.replaceForGuild(
            guildId,
            event.guild.stickers
                .map(
                  (s) => db.GuildStickersCompanion.insert(
                    id: s.id,
                    guildId: guildId,
                    name: s.name,
                    description: Value(s.description),
                    tagsJson: Value(jsonEncode(s.tags)),
                    animated: Value(s.animated),
                  ),
                )
                .toList(),
          );
        }
      }),
    );

    if (event.guild.voiceStates.isNotEmpty) {
      onVoiceStatesBulk?.call(event.guild.voiceStates);
    }
  }

  void _handleGuildUpdate(GuildUpdateEvent event) {
    unawaited(database.guildDao.upsertServer(guildFromSdk(event.guild.guild)));
  }

  Future<void> _handleGuildDelete(GuildDeleteEvent event) async {
    onGuildAvailabilityChanged?.call(
      event.guildId,
      unavailable: event.unavailable,
      unavailableHidden: event.unavailableHidden,
    );
    if (event.unavailable) {
      // Guild went unavailable — keep it in the list but mark it.
      await database.guildDao.markUnavailable(event.guildId);
      return;
    }
    await _removeGuildLocally(event.guildId);
  }

  Future<void> _removeGuildLocally(String guildId) async {
    await removeGuildFromLocalDb(database, guildId);
    onGuildPermissionsEvict?.call(guildId);
  }

  void _handleRelationshipUpsert(RelationshipResponse relationship) {
    unawaited(
      database.userDao.upsertUser(userFromPartialSdk(relationship.user)),
    );
    unawaited(
      database.relationshipDao.upsertRelationships([
        db.RelationshipsCompanion.insert(
          userId: relationship.user.id,
          type: relationship.type.json ?? 1,
          nickname: Value(relationship.nickname),
          since: Value(relationship.since),
        ),
      ]),
    );
  }

  void _handleRelationshipRemove(RelationshipRemoveEvent event) {
    unawaited(database.relationshipDao.deleteRelationship(event.userId));
  }

  Future<void> _handleReactionAdd(MessageReactionAddEvent event) async {
    await _modifyReaction(
      event.messageId,
      event.emoji,
      isAdd: true,
      userId: event.userId,
    );
    onMessageReactionChange?.call(event.channelId, event.messageId);
  }

  Future<void> _handleReactionRemove(MessageReactionRemoveEvent event) async {
    await _modifyReaction(
      event.messageId,
      event.emoji,
      isAdd: false,
      userId: event.userId,
    );
    onMessageReactionChange?.call(event.channelId, event.messageId);
  }

  void _handleReactionRemoveAll(MessageReactionRemoveAllEvent event) {
    unawaited(
      database.messageDao.updateReactions(event.messageId, '[]').then((_) {
        onMessageReactionChange?.call(event.channelId, event.messageId);
      }),
    );
  }

  void _handleReactionRemoveEmoji(MessageReactionRemoveEmojiEvent event) {
    unawaited(
      _removeEmojiReaction(
        event.messageId,
        event.emoji.name,
        event.emoji.id,
      ).then((_) {
        onMessageReactionChange?.call(event.channelId, event.messageId);
      }),
    );
  }

  Future<void> _modifyReaction(
    String messageId,
    ReactionEmoji emoji, {
    required bool isAdd,
    String? userId,
  }) async {
    final msg = await database.messageDao.getMessage(messageId);
    if (msg == null) {
      return;
    }

    final reactions = _decodeReactions(msg.reactionsJson);
    final isCurrentUser =
        userId != null && currentUserId != null && userId == currentUserId;

    if (!_applyReactionDelta(
      reactions,
      emoji,
      isAdd: isAdd,
      isCurrentUser: isCurrentUser,
    )) {
      return;
    }

    await database.messageDao.updateReactions(messageId, jsonEncode(reactions));
  }

  /// Applies a single reaction add/remove for [emoji] to the decoded
  /// [reactions] list in place.
  ///
  /// Returns `false` when a redundant self add/remove is skipped (the list is
  /// left unchanged so the caller can avoid an unnecessary write); otherwise
  /// returns `true`.
  bool _applyReactionDelta(
    List<Map<String, dynamic>> reactions,
    ReactionEmoji emoji, {
    required bool isAdd,
    required bool isCurrentUser,
  }) {
    final idx = reactions.indexWhere(
      (r) =>
          (r['emoji'] as String?) == emoji.name &&
          (r['emojiId'] as String?) == emoji.id,
    );

    if (isAdd) {
      if (idx != -1) {
        final existing = reactions[idx];
        if (isCurrentUser && (existing['hasReacted'] as bool? ?? false)) {
          return false;
        }
        reactions[idx]['count'] = ((existing['count'] as int?) ?? 0) + 1;
        if (isCurrentUser) {
          reactions[idx]['hasReacted'] = true;
        }
      } else {
        reactions.add(<String, dynamic>{
          'emoji': emoji.name,
          'emojiId': emoji.id,
          'animated': emoji.animated,
          'count': 1,
          'hasReacted': isCurrentUser,
        });
      }
    } else if (idx != -1) {
      final existing = reactions[idx];
      if (isCurrentUser && !(existing['hasReacted'] as bool? ?? false)) {
        return false;
      }
      final count = ((existing['count'] as int?) ?? 1) - 1;
      if (count <= 0) {
        reactions.removeAt(idx);
      } else {
        reactions[idx]['count'] = count;
        if (isCurrentUser) {
          reactions[idx]['hasReacted'] = false;
        }
      }
    }

    return true;
  }

  Future<void> _removeEmojiReaction(
    String messageId,
    String emojiName,
    String? emojiId,
  ) async {
    final msg = await database.messageDao.getMessage(messageId);
    if (msg == null) {
      return;
    }

    final reactions = _decodeReactions(msg.reactionsJson)
      ..removeWhere(
        (r) =>
            (r['emoji'] as String?) == emojiName &&
            (r['emojiId'] as String?) == emojiId,
      );
    await database.messageDao.updateReactions(messageId, jsonEncode(reactions));
  }

  Future<void> _handleMessageAck(MessageAckEvent event) async {
    final mentionCount = event.mentionCount ?? 0;
    final manual = event.manual ?? false;
    final current = await database.readStateDao.getReadState(event.channelId);
    if (!manual && current?.lastMessageId != null) {
      final comparison = compareSnowflakeIds(
        event.messageId,
        current!.lastMessageId,
      );
      if (comparison < 0) {
        return;
      }
    }
    final existingSticky = current?.stickyUnreadMessageId;
    final String? newSticky;
    if (manual) {
      newSticky = existingSticky ?? event.messageId;
    } else if (existingSticky != null &&
        compareSnowflakeIds(event.messageId, existingSticky) < 0) {
      newSticky = existingSticky;
    } else {
      newSticky = null;
    }
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: Value(event.channelId),
        lastMessageId: Value(event.messageId),
        mentionCount: Value(mentionCount),
        lastPinTimestamp: Value(current?.lastPinTimestamp),
        manual: Value(manual),
        stickyUnreadMessageId: Value(newSticky),
      ),
    );
    final dm = await database.dmChannelDao.getDmChannelById(event.channelId);
    if (dm != null) {
      await database.dmChannelDao.updateUnreadCount(
        event.channelId,
        mentionCount,
      );
    }
    onMessageAcked?.call(event.channelId, manual: manual);
  }

  void _handleReactionAddMany(MessageReactionAddManyEvent event) {
    unawaited(() async {
      final msg = await database.messageDao.getMessage(event.messageId);
      if (msg == null) {
        return;
      }
      final reactions = _decodeReactions(msg.reactionsJson);
      for (final r in event.reactions) {
        final emoji = r['emoji'] as Map<String, dynamic>?;
        if (emoji == null) {
          continue;
        }
        _applyReactionDelta(
          reactions,
          ReactionEmoji(
            name: emoji['name'] as String? ?? '',
            id: emoji['id'] as String?,
          ),
          isAdd: true,
          isCurrentUser: false,
        );
      }
      await database.messageDao.updateReactions(
        event.messageId,
        jsonEncode(reactions),
      );
      onMessageReactionChange?.call(event.channelId, event.messageId);
    }());
  }

  void _handlePassiveUpdates(PassiveUpdatesEvent event) {
    final created = event.createdChannels;
    final updated = event.updatedChannels;
    final deleted = event.deletedChannelIds;

    talker.debug(
      '[Gateway] PASSIVE_UPDATES: '
      'created=${created?.length ?? 0}, '
      'updated=${updated?.length ?? 0}, '
      'deleted=${deleted?.length ?? 0}',
    );

    if (created != null) {
      for (final channel in created) {
        talker.debug('[Gateway]   +channel: ${channel.id}');
        _handleChannelUpsert(channel);
      }
    }

    if (updated != null) {
      for (final channel in updated) {
        talker.debug('[Gateway]   ~channel: ${channel.id}');
        _handleChannelUpsert(channel);
      }
    }

    if (deleted != null) {
      for (final id in deleted) {
        talker.debug('[Gateway]   -channel: $id');
        unawaited(database.channelDao.deleteChannel(id));
      }
    }
  }

  Future<void> _handleGuildEmojisUpdate(GuildEmojisUpdateEvent event) async {
    await database.guildEmojiDao.replaceForGuild(
      event.guildId,
      event.emojis
          .map(
            (e) => db.GuildEmojisCompanion.insert(
              id: e.id,
              guildId: event.guildId,
              name: e.name,
              animated: Value(e.animated),
            ),
          )
          .toList(),
    );
  }

  Future<void> _handleGuildStickersUpdate(
    GuildStickersUpdateEvent event,
  ) async {
    await database.guildStickerDao.replaceForGuild(
      event.guildId,
      event.stickers
          .map(
            (s) => db.GuildStickersCompanion.insert(
              id: s.id,
              guildId: event.guildId,
              name: s.name,
              description: Value(s.description),
              tagsJson: Value(jsonEncode(s.tags)),
              animated: Value(s.animated),
            ),
          )
          .toList(),
    );
  }

  List<Map<String, dynamic>> _decodeReactions(String json) {
    try {
      return (jsonDecode(json) as List<dynamic>).cast<Map<String, dynamic>>();
    } on Object {
      return [];
    }
  }
}
