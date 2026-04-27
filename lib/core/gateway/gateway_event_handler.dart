import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
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
typedef UserSettingsHydrateCallback =
    void Function(UserSettingsResponse settings);
typedef VoiceServerUpdateCallback = void Function(
  VoiceServerUpdateEvent event,
);

class GatewayEventHandler {
  GatewayEventHandler({
    required this.database,
    this.currentUserId,
    this.onReady,
    this.onTypingStart,
    this.onTypingClear,
    this.onVoiceStateUpdate,
    this.onVoiceStatesBulk,
    this.onVoiceServerUpdate,
    this.onCallCreate,
    this.onCallUpdate,
    this.onCallDelete,
    this.onInviteCreate,
    this.onInviteDelete,
    this.onGuildPermissionsChanged,
    this.onGuildPermissionsEvict,
    this.onPermissionsClearAll,
    this.onMessageCreate,
    this.onMessageUpdate,
    this.onMessageDelete,
    this.onMessageDeleteBulk,
    this.onMessageReactionChange,
    this.onAuthSessionIdHashChanged,
    this.onConnectionsUpdate,
    this.onUserSettingsHydrate,
  });

  final db.FluxerDatabase database;
  final String? currentUserId;
  final ReadyCallback? onReady;
  final TypingCallback? onTypingStart;
  final TypingCallback? onTypingClear;
  final VoiceStateCallback? onVoiceStateUpdate;
  final VoiceBulkCallback? onVoiceStatesBulk;
  final VoiceServerUpdateCallback? onVoiceServerUpdate;
  final CallCreateCallback? onCallCreate;
  final CallUpdateCallback? onCallUpdate;
  final ChannelCallback? onCallDelete;
  final InviteCreateCallback? onInviteCreate;
  final InviteDeleteCallback? onInviteDelete;
  final GuildCallback? onGuildPermissionsChanged;
  final GuildCallback? onGuildPermissionsEvict;
  final void Function()? onPermissionsClearAll;
  final MessageCreateCallback? onMessageCreate;
  final MessageUpdateCallback? onMessageUpdate;
  final MessageDeleteCallback? onMessageDelete;
  final MessageDeleteBulkCallback? onMessageDeleteBulk;
  final MessageReactionChangeCallback? onMessageReactionChange;
  final void Function(String? idHash)? onAuthSessionIdHashChanged;
  final ConnectionsUpdateCallback? onConnectionsUpdate;
  final UserSettingsHydrateCallback? onUserSettingsHydrate;

  /// The current user's ID, set during READY processing.
  String? _currentUserId;

  Future<void> handle(GatewayEvent event) async {
    switch (event) {
      case ReadyEvent():
        await _handleReady(event);
      case ResumedEvent():
        talker.info('[Gateway] RESUMED');
      case MessageCreateEvent():
        talker.debug('[Gateway] MESSAGE_CREATE: ${event.message.channelId}');
        _handleMessageCreate(event);
      case MessageUpdateEvent():
        talker.debug('[Gateway] MESSAGE_UPDATE: ${event.message.id}');
        _handleMessageUpdate(event);
      case MessageDeleteEvent():
        talker.debug('[Gateway] MESSAGE_DELETE: ${event.messageId}');
        _handleMessageDelete(event);
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
      case GuildMemberUpdateEvent():
        talker.debug(
          '[Gateway] GUILD_MEMBER_UPDATE: ${event.member.user.id}'
          ' → ${event.guildId}',
        );
        _handleMemberUpsert(event.guildId, event.member);
        onGuildPermissionsChanged?.call(event.guildId);
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
        _handleReactionAdd(event);
      case MessageReactionRemoveEvent():
        talker.debug('[Gateway] MESSAGE_REACTION_REMOVE: ${event.messageId}');
        _handleReactionRemove(event);
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
        _handleGuildDelete(event);
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
        _handleMessageDeleteBulk(event);
      case MessageAckEvent():
        talker.debug('[Gateway] MESSAGE_ACK: ${event.channelId}');
        _handleMessageAck(event);
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
        unawaited(
          database.readStateDao.updatePinTimestamp(
            event.channelId,
            event.lastPinTimestamp,
          ),
        );
      case ChannelPinsAckEvent():
        talker.debug('[Gateway] CHANNEL_PINS_ACK: ${event.channelId}');
      case ChannelRecipientAddEvent():
        talker.debug('[Gateway] CHANNEL_RECIPIENT_ADD: ${event.channelId}');
        unawaited(database.userDao.upsertUser(userFromPartialSdk(event.user)));
      case ChannelRecipientRemoveEvent():
        talker.debug('[Gateway] CHANNEL_RECIPIENT_REMOVE: ${event.channelId}');
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
        talker.debug('[Gateway] GUILD_MEMBER_LIST_UPDATE: ${event.guildId}');
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
        talker.debug('[Gateway] VOICE_SERVER_UPDATE');
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
      case GatewayErrorEvent():
        talker.warning('[Gateway] Error: [${event.code}] ${event.message}');
      case UnknownGatewayEvent():
        talker.debug('[Gateway] Unknown event: ${event.eventType}');
    }
  }

  Future<void> _handleReady(ReadyEvent event) async {
    talker.info(
      '[Gateway] READY received (session: ${event.sessionId})'
      ' — guilds: ${event.guilds.length}'
      ', DMs: ${event.privateChannels.length}'
      ', relationships: ${event.relationships.length}'
      ', presences: ${event.presences.length}'
      ', readStates: ${event.readStates.length}'
      ', user: ${event.user.id}',
    );

    _currentUserId = event.user.id;
    onPermissionsClearAll?.call();
    onAuthSessionIdHashChanged?.call(event.authSessionIdHash);

    await database.transaction(() async {
      // Clear all entity tables (full replace).
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

      // Insert current user.
      await database.userDao.upsertUser(
        db.UsersCompanion.insert(
          id: event.user.id,
          username: event.user.username,
          discriminator: Value(event.user.discriminator),
          globalName: Value(event.user.globalName),
          avatar: Value(event.user.avatar),
          avatarColor: Value(event.user.avatarColor),
          bot: Value(event.user.bot ?? false),
          memberSince: Value(dateTimeFromUserSnowflakeOrNull(event.user.id)),
        ),
      );

      // Insert cached users.
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

      // Build guild position map from guild folders in user settings.
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

      // Insert guilds (skip unavailable — no metadata).
      if (event.rawGuilds.isNotEmpty) {
        final guildCompanions = <db.ServersCompanion>[];
        final processedGuilds = <GuildCreateData>[];
        var fallbackPosition = guildPositions.length;
        for (final rawGuild in event.rawGuilds) {
          final unavailable = rawGuild['unavailable'] as bool? ?? false;
          if (unavailable) {
            continue;
          }
          final guildData = GuildCreateData.fromJson(rawGuild);
          final guildId = guildData.guild.id;
          final position = guildPositions[guildId] ?? fallbackPosition++;
          guildCompanions.add(
            guildFromSdk(guildData.guild, position: position),
          );
          processedGuilds.add(guildData);
        }
        if (guildCompanions.isNotEmpty) {
          await database.guildDao.upsertServers(guildCompanions);
        }

        for (final guildData in processedGuilds) {
          final guildId = guildData.guild.id;

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
              db.MembersCompanion.insert(
                userId: member.user.id,
                guildId: guildId,
                nick: Value(member.nick),
                serverAvatar: Value(member.avatar),
                roleIdsJson: Value(jsonEncode(member.roles)),
                joinedAt: Value(member.joinedAt),
              ),
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
        }
      }

      // Insert DM channels (+ upsert recipients as users).
      if (event.privateChannels.isNotEmpty) {
        final dmCompanions = <db.DmChannelsCompanion>[];
        final recipientUsers = <db.UsersCompanion>[];
        for (final ch in event.privateChannels) {
          final recipients = ch.recipients;
          if (recipients == null || recipients.isEmpty) {
            continue;
          }
          for (final r in recipients) {
            recipientUsers.add(userFromPartialSdk(r));
          }
          dmCompanions.add(
            db.DmChannelsCompanion.insert(
              id: ch.id,
              recipientId: recipients.first.id,
              type: Value(ch.type),
              name: Value(ch.name),
              icon: Value(ch.icon),
              recipientCount: Value(recipients.length + 1),
              recipientIds: Value(
                jsonEncode(recipients.map((r) => r.id).toList()),
              ),
              lastMessageTime: Value(
                ch.lastMessageId != null
                    ? dateTimeFromSnowflakeAsLocalOrNow(ch.lastMessageId!)
                    : dateTimeFromSnowflakeAsLocalOrNow(ch.id),
              ),
            ),
          );
        }
        if (recipientUsers.isNotEmpty) {
          await database.userDao.upsertUsers(recipientUsers);
        }
        await database.dmChannelDao.upsertDmChannels(dmCompanions);
      }

      // Insert relationships (+ upsert related users).
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

      // Update user statuses from presences (users already inserted above).
      for (final p in event.presences) {
        final userId = (p['user'] as Map<String, dynamic>?)?['id'] as String?;
        final status = p['status'] as String?;
        if (userId != null && status != null) {
          await database.userDao.updateStatus(userId, status);
        }
      }

      // Insert read states.
      if (event.readStates.isNotEmpty) {
        for (final rs in event.readStates) {
          await database.readStateDao.upsertReadState(
            db.ReadStatesCompanion(
              channelId: Value(rs.id),
              lastMessageId: Value(rs.lastMessageId),
              mentionCount: Value(rs.mentionCount),
              lastPinTimestamp: Value(rs.lastPinTimestamp),
            ),
          );
        }
      }

      // Insert user settings (JSON blob).
      if (userSettings != null) {
        await database.userSettingsDao.upsertSettings(
          db.UserSettingsTableCompanion(
            userId: Value(event.user.id),
            data: Value(jsonEncode(userSettings.toJson())),
          ),
        );
      }

      // Insert user guild settings (JSON blob per guild).
      final guildSettings = event.userGuildSettings;
      if (guildSettings != null) {
        for (final gs in guildSettings) {
          final guildId = gs.guildId;
          if (guildId == null) {
            continue;
          }
          await database.userGuildSettingsDao.upsert(
            db.UserGuildSettingsTableCompanion(
              guildId: Value(guildId),
              data: Value(jsonEncode(gs.toJson())),
            ),
          );
        }
      }

      // Insert notes.
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

      // Insert pinned DMs with position index (table already cleared above).
      final pinnedDms = event.pinnedDms;
      if (pinnedDms != null && pinnedDms.isNotEmpty) {
        for (var i = 0; i < pinnedDms.length; i++) {
          await database
              .into(database.pinnedDmsTable)
              .insert(
                db.PinnedDmsTableCompanion(
                  channelId: Value(pinnedDms[i]),
                  position: Value(i),
                ),
              );
        }
      }

      // Insert favorite memes (JSON blob per meme).
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

      // Insert RTC regions (table already cleared above).
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

    talker.info('[Gateway] READY transaction committed successfully');
    final hydratedSettings = event.userSettings;
    if (hydratedSettings != null) {
      onUserSettingsHydrate?.call(hydratedSettings);
    }
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
    onUserSettingsHydrate?.call(event.settings);
  }

  Future<void> _handleUserGuildSettingsUpdate(
    UserGuildSettingsUpdateEvent event,
  ) async {
    await database.userGuildSettingsDao.upsert(
      db.UserGuildSettingsTableCompanion(
        guildId: Value(event.guildId),
        data: Value(jsonEncode(event.data)),
      ),
    );
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

  void _handleMessageCreate(MessageCreateEvent event) {
    final msg = Message.fromSdk(event.message, currentUserId: currentUserId);

    // Clear typing indicator for the message author.
    onTypingClear?.call(msg.channelId, msg.authorId);

    // Upsert the author.
    unawaited(
      database.userDao.upsertUser(userFromPartialSdk(event.message.author)),
    );

    unawaited(database.messageDao.upsertMessage(msg.toCompanion()));

    // Update channel's last message ID for unread tracking.
    unawaited(database.channelDao.updateLastMessageId(msg.channelId, msg.id));

    // Update DM last-message metadata (no-ops for guild channels).
    unawaited(
      database.dmChannelDao.updateLastMessage(
        msg.channelId,
        msg.content,
        msg.authorId,
        msg.timestamp,
      ),
    );

    onMessageCreate?.call(event);
  }

  void _handleMessageUpdate(MessageUpdateEvent event) {
    final msg = Message.fromSdk(event.message, currentUserId: currentUserId);
    unawaited(database.messageDao.upsertMessage(msg.toCompanion()));
    onMessageUpdate?.call(event);
  }

  void _handleMessageDelete(MessageDeleteEvent event) {
    unawaited(database.messageDao.deleteMessage(event.messageId));
    onMessageDelete?.call(event);
  }

  void _handleTypingStart(TypingStartEvent event) {
    onTypingStart?.call(event.channelId, event.userId);
  }

  void _handlePresenceUpdate(PresenceUpdateEvent event) {
    unawaited(database.userDao.updateStatus(event.userId, event.status));
  }

  void _handleMemberUpsert(String guildId, GuildMemberResponse member) {
    unawaited(database.userDao.upsertUser(userFromPartialSdk(member.user)));

    unawaited(
      database.memberDao.upsertMember(
        db.MembersCompanion.insert(
          userId: member.user.id,
          guildId: guildId,
          nick: Value(member.nick),
          serverAvatar: Value(member.avatar),
          roleIdsJson: Value(jsonEncode(member.roles)),
          joinedAt: Value(member.joinedAt),
        ),
      ),
    );
  }

  void _handleMemberRemove(GuildMemberRemoveEvent event) {
    unawaited(database.memberDao.deleteMember(event.userId, event.guildId));
  }

  void _handleChannelUpsert(ChannelResponse channel) {
    final guildId = channel.guildId;
    if (guildId != null) {
      unawaited(
        database.channelDao.upsertChannel(channelFromSdk(channel, guildId)),
      );
      return;
    }

    // Handle DM channel create/update.
    final recipients = channel.recipients;
    if (recipients != null && recipients.isNotEmpty) {
      for (final r in recipients) {
        unawaited(database.userDao.upsertUser(userFromPartialSdk(r)));
      }
      unawaited(
        database.dmChannelDao.upsertDmChannels([
          db.DmChannelsCompanion.insert(
            id: channel.id,
            recipientId: recipients.first.id,
            type: Value(channel.type),
            name: Value(channel.name),
            icon: Value(channel.icon),
            recipientCount: Value(recipients.length + 1),
            recipientIds: Value(
              jsonEncode(recipients.map((r) => r.id).toList()),
            ),
          ),
        ]),
      );
    }
  }

  void _handleChannelDelete(ChannelDeleteEvent event) {
    unawaited(database.messageDao.deleteMessagesForChannel(event.channel.id));
    unawaited(database.channelDao.deleteChannel(event.channel.id));
    unawaited(database.dmChannelDao.deleteDmChannel(event.channel.id));
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

  void _handleMessageDeleteBulk(MessageDeleteBulkEvent event) {
    for (final id in event.ids) {
      unawaited(database.messageDao.deleteMessage(id));
    }
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
    for (final member in event.members) {
      _handleMemberUpsert(event.guildId, member);
    }
  }

  void _handlePresenceUpdateBulk(PresenceUpdateBulkEvent event) {
    for (final p in event.presences) {
      final userId = (p['user'] as Map<String, dynamic>?)?['id'] as String?;
      final status = p['status'] as String?;
      if (userId != null && status != null) {
        unawaited(database.userDao.updateStatus(userId, status));
      }
    }
  }

  void _handleGuildCreate(GuildCreateEvent event) {
    unawaited(database.guildDao.upsertServer(guildFromSdk(event.guild.guild)));

    // Upsert channels and roles from the guild create payload.
    for (final channel in event.guild.channels) {
      final guildId = channel.guildId;
      if (guildId != null) {
        unawaited(
          database.channelDao.upsertChannel(channelFromSdk(channel, guildId)),
        );
      }
    }

    if (event.guild.roles.isNotEmpty) {
      unawaited(
        database.roleDao.upsertRoles(
          event.guild.roles
              .map((r) => roleFromSdk(r, event.guild.guild.id))
              .toList(),
        ),
      );
    }

    // Upsert members.
    for (final member in event.guild.members) {
      _handleMemberUpsert(event.guild.guild.id, member);
    }

    // Upsert emojis.
    final guildId = event.guild.guild.id;
    if (event.guild.emojis.isNotEmpty) {
      unawaited(
        database.guildEmojiDao.replaceForGuild(
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
        ),
      );
    }

    // Upsert stickers.
    if (event.guild.stickers.isNotEmpty) {
      unawaited(
        database.guildStickerDao.replaceForGuild(
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
        ),
      );
    }

    // Populate voice states from guild payload.
    if (event.guild.voiceStates.isNotEmpty) {
      onVoiceStatesBulk?.call(event.guild.voiceStates);
    }
  }

  void _handleGuildUpdate(GuildUpdateEvent event) {
    unawaited(database.guildDao.upsertServer(guildFromSdk(event.guild.guild)));
  }

  void _handleGuildDelete(GuildDeleteEvent event) {
    if (event.unavailable) {
      // Guild went unavailable — keep it in the list but mark it.
      unawaited(database.guildDao.markUnavailable(event.guildId));
      return;
    }
    // Actually removed from guild — delete all associated data.
    unawaited(database.channelDao.deleteChannelsForGuild(event.guildId));
    unawaited(database.memberDao.deleteMembersForGuild(event.guildId));
    unawaited(database.roleDao.deleteRolesForGuild(event.guildId));
    unawaited(database.guildDao.deleteServer(event.guildId));
    onGuildPermissionsEvict?.call(event.guildId);
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

  void _handleReactionAdd(MessageReactionAddEvent event) {
    unawaited(
      _modifyReaction(event.messageId, event.emoji, isAdd: true).then((_) {
        onMessageReactionChange?.call(event.channelId, event.messageId);
      }),
    );
  }

  void _handleReactionRemove(MessageReactionRemoveEvent event) {
    unawaited(
      _modifyReaction(event.messageId, event.emoji, isAdd: false).then((_) {
        onMessageReactionChange?.call(event.channelId, event.messageId);
      }),
    );
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
  }) async {
    final msg = await database.messageDao.getMessage(messageId);
    if (msg == null) {
      return;
    }

    final reactions = _decodeReactions(msg.reactionsJson);
    final idx = reactions.indexWhere(
      (r) =>
          (r['emoji'] as String?) == emoji.name &&
          (r['emojiId'] as String?) == emoji.id,
    );

    if (isAdd) {
      if (idx != -1) {
        reactions[idx]['count'] = ((reactions[idx]['count'] as int?) ?? 0) + 1;
      } else {
        reactions.add(<String, dynamic>{
          'emoji': emoji.name,
          'emojiId': emoji.id,
          'animated': emoji.animated,
          'count': 1,
          'hasReacted': false,
        });
      }
    } else if (idx != -1) {
      final count = ((reactions[idx]['count'] as int?) ?? 1) - 1;
      if (count <= 0) {
        reactions.removeAt(idx);
      } else {
        reactions[idx]['count'] = count;
      }
    }

    await database.messageDao.updateReactions(messageId, jsonEncode(reactions));
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

  void _handleMessageAck(MessageAckEvent event) {
    unawaited(
      database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: Value(event.channelId),
          lastMessageId: Value(event.messageId),
          mentionCount: Value(event.mentionCount ?? 0),
        ),
      ),
    );
  }

  void _handleReactionAddMany(MessageReactionAddManyEvent event) {
    final futures = <Future<void>>[];
    for (final r in event.reactions) {
      final emoji = r['emoji'] as Map<String, dynamic>?;
      if (emoji == null) {
        continue;
      }
      futures.add(
        _modifyReaction(
          event.messageId,
          ReactionEmoji(
            name: emoji['name'] as String? ?? '',
            id: emoji['id'] as String?,
          ),
          isAdd: true,
        ),
      );
    }
    unawaited(
      Future.wait(futures).then((_) {
        onMessageReactionChange?.call(event.channelId, event.messageId);
      }),
    );
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
