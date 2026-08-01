import 'dart:async';
import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/gateway/gateway_ready_guild_parser.dart';
import 'package:fluxer_app/core/gateway/message_mention_context_cache.dart';
import 'package:fluxer_app/core/gateway/presence_update_batcher.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/utils/message_mention_resolver.dart';
import 'package:fluxer_app/features/channels/data/read_state_decisions.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/data/read_state_utils.dart';
import 'package:fluxer_app/features/channels/data/read_state_write_batcher.dart';
import 'package:fluxer_app/features/channels/data/unread_settings_resolver.dart';
import 'package:fluxer_app/features/chat/data/message_write_batcher.dart';
import 'package:fluxer_app/features/chat/data/reaction_delta_utils.dart';
import 'package:fluxer_app/features/chat/data/reaction_write_batcher.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/dm/domain/dm_channel_types.dart';
import 'package:fluxer_app/features/guilds/data/guild_local_cleanup.dart';
import 'package:fluxer_app/features/notifications/data/mention_feed_write_batcher.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/shared/utils/sdk_converters.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';

void _logGatewayDebug(void Function() log) {
  assert(() {
    log();
    return true;
  }(), 'gateway debug logging');
}

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
typedef MessageCreateCallback = void Function(MessageCreateDispatch dispatch);
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
typedef DefaultHideMutedChannelsResolver = bool Function();
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
    this.readStateWriteBatcher,
    this.messageMentionContextCache,
    this.messageWriteBatcher,
    this.mentionFeedWriteBatcher,
    this.reactionWriteBatcher,
    this.currentUserId,
    this.isAutoAckActive,
    this.onReady,
    this.onResumed,
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
    this.resolveDefaultHideMutedChannels,
  });

  final db.FluxerDatabase database;
  final ReadStateRepository? readStateRepository;
  final ReadStateWriteBatcher? readStateWriteBatcher;
  final MessageMentionContextCache? messageMentionContextCache;
  final MessageWriteBatcher? messageWriteBatcher;
  final MentionFeedWriteBatcher? mentionFeedWriteBatcher;
  final ReactionWriteBatcher? reactionWriteBatcher;
  final String? currentUserId;
  final bool Function(String channelId)? isAutoAckActive;
  final ReadyCallback? onReady;
  final ReadyCallback? onResumed;
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
  final DefaultHideMutedChannelsResolver? resolveDefaultHideMutedChannels;

  late final PresenceUpdateBatcher _presenceUpdateBatcher =
      PresenceUpdateBatcher(database: database, currentUserId: currentUserId);

  String? _currentUserId;
  String? _lastReadyUserId;
  bool _hasCommittedReady = false;

  void dispose() {
    _presenceUpdateBatcher.dispose();
  }

  Future<void> handle(GatewayEvent event) async {
    switch (event) {
      case ReadyEvent():
        await _handleReady(event);
      case ResumedEvent():
        talker.info('[Gateway] RESUMED');
        (onResumed ?? onReady)?.call();
      case MessageCreateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] MESSAGE_CREATE: ${event.message.channelId}',
          ),
        );
        await _handleMessageCreate(event);
      case MessageUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] MESSAGE_UPDATE: ${event.message.id}'),
        );
        await _handleMessageUpdate(event);
      case MessageDeleteEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] MESSAGE_DELETE: ${event.messageId}'),
        );
        await _handleMessageDelete(event);
      case TypingStartEvent():
        _handleTypingStart(event);
      case PresenceUpdateEvent():
        _handlePresenceUpdate(event);
      case GuildMemberAddEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] GUILD_MEMBER_ADD: ${event.member.user.id}'
            ' → ${event.guildId}',
          ),
        );
        _handleMemberUpsert(event.guildId, event.member);
        if (event.member.user.id == currentUserId) {
          onGuildPermissionsChanged?.call(event.guildId);
        }
      case GuildMemberUpdateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] GUILD_MEMBER_UPDATE: ${event.member.user.id}'
            ' → ${event.guildId}',
          ),
        );
        _handleMemberUpsert(event.guildId, event.member);
        if (event.member.user.id == currentUserId) {
          onGuildPermissionsChanged?.call(event.guildId);
          messageMentionContextCache?.invalidateGuild(event.guildId);
        }
      case GuildMemberRemoveEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] GUILD_MEMBER_REMOVE: ${event.userId}'
            ' → ${event.guildId}',
          ),
        );
        _handleMemberRemove(event);
      case ChannelCreateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] CHANNEL_CREATE: ${event.channel.id}'),
        );
        unawaited(_handleChannelUpsert(event.channel));
      case ChannelUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] CHANNEL_UPDATE: ${event.channel.id}'),
        );
        unawaited(_handleChannelUpsert(event.channel));
      case ChannelDeleteEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] CHANNEL_DELETE: ${event.channel.id}'),
        );
        _handleChannelDelete(event);
      case MessageReactionAddEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] MESSAGE_REACTION_ADD: ${event.messageId}',
          ),
        );
        await _handleReactionAdd(event);
      case MessageReactionRemoveEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] MESSAGE_REACTION_REMOVE: ${event.messageId}',
          ),
        );
        await _handleReactionRemove(event);
      case MessageReactionRemoveAllEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] MESSAGE_REACTION_REMOVE_ALL: ${event.messageId}',
          ),
        );
        _handleReactionRemoveAll(event);
      case MessageReactionRemoveEmojiEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] MESSAGE_REACTION_REMOVE_EMOJI: ${event.messageId}',
          ),
        );
        _handleReactionRemoveEmoji(event);
      case GuildCreateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_CREATE: ${event.guild.guild.id}'),
        );
        _handleGuildCreate(event);
      case GuildUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_UPDATE: ${event.guild.guild.id}'),
        );
        _handleGuildUpdate(event);
      case GuildDeleteEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_DELETE: ${event.guildId}'),
        );
        unawaited(_handleGuildDelete(event));
      case RelationshipAddEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] RELATIONSHIP_ADD: ${event.relationship.user.id}',
          ),
        );
        _handleRelationshipUpsert(event.relationship);
      case RelationshipUpdateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] RELATIONSHIP_UPDATE: ${event.relationship.user.id}',
          ),
        );
        _handleRelationshipUpsert(event.relationship);
      case RelationshipRemoveEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] RELATIONSHIP_REMOVE: ${event.userId}'),
        );
        _handleRelationshipRemove(event);
      case UserUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] USER_UPDATE: ${event.user.id}'),
        );
        _handleUserUpdate(event);
      case MessageDeleteBulkEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] MESSAGE_DELETE_BULK: ${event.ids.length} messages',
          ),
        );
        await _handleMessageDeleteBulk(event);
      case MessageAckEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] MESSAGE_ACK: ${event.channelId}'),
        );
        await _handleMessageAck(event);
      case MessageReactionAddManyEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] MESSAGE_REACTION_ADD_MANY: ${event.messageId}',
          ),
        );
        _handleReactionAddMany(event);
      case ChannelUpdateBulkEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] CHANNEL_UPDATE_BULK: ${event.channels.length} channels',
          ),
        );
        for (final channel in event.channels) {
          _handleChannelUpsert(channel);
        }
      case ChannelPinsUpdateEvent():
        _logGatewayDebug(
          () =>
              talker.debug('[Gateway] CHANNEL_PINS_UPDATE: ${event.channelId}'),
        );
        await database.channelDao.updateLastPinTimestamp(
          event.channelId,
          event.lastPinTimestamp,
        );
      case ChannelPinsAckEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] CHANNEL_PINS_ACK: ${event.channelId}'),
        );
        final channel = await database.channelDao.getChannelById(
          event.channelId,
        );
        await database.readStateDao.updatePinTimestamp(
          event.channelId,
          event.lastPinTimestamp ?? channel?.lastPinTimestamp,
        );
      case ChannelRecipientAddEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] CHANNEL_RECIPIENT_ADD: ${event.channelId}',
          ),
        );
        unawaited(database.userDao.upsertUser(userFromPartialSdk(event.user)));
        unawaited(
          database.dmChannelDao.addRecipientId(event.channelId, event.user.id),
        );
      case ChannelRecipientRemoveEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] CHANNEL_RECIPIENT_REMOVE: ${event.channelId}',
          ),
        );
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
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_ROLE_CREATE: ${event.role.id}'),
        );
        _handleRoleUpsert(event.guildId, event.role);
      case GuildRoleUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_ROLE_UPDATE: ${event.role.id}'),
        );
        _handleRoleUpsert(event.guildId, event.role);
      case GuildRoleDeleteEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_ROLE_DELETE: ${event.roleId}'),
        );
        unawaited(database.roleDao.deleteRole(event.roleId));
        onGuildPermissionsChanged?.call(event.guildId);
      case GuildRoleUpdateBulkEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] GUILD_ROLE_UPDATE_BULK: ${event.roles.length} roles',
          ),
        );
        _handleRoleUpdateBulk(event);
      case GuildBanAddEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_BAN_ADD: ${event.guildId}'),
        );
      case GuildBanRemoveEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_BAN_REMOVE: ${event.guildId}'),
        );
      case GuildEmojisUpdateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] GUILD_EMOJIS_UPDATE: ${event.guildId}'
            ' (${event.emojis.length})',
          ),
        );
        unawaited(_handleGuildEmojisUpdate(event));
      case GuildStickersUpdateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] GUILD_STICKERS_UPDATE: ${event.guildId}'
            ' (${event.stickers.length})',
          ),
        );
        unawaited(_handleGuildStickersUpdate(event));
      case GuildSyncEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] GUILD_SYNC: ${event.guild.guild.id}'),
        );
        _handleGuildCreate(GuildCreateEvent(guild: event.guild));
      case GuildMembersChunkEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] GUILD_MEMBERS_CHUNK: ${event.guildId}'
            ' (${event.members.length})',
          ),
        );
        _handleMembersChunk(event);
      case GuildMemberListUpdateEvent():
        unawaited(_handleMemberListUpdate(event));
      case PresenceUpdateBulkEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] PRESENCE_UPDATE_BULK: ${event.presences.length}',
          ),
        );
        _handlePresenceUpdateBulk(event);
      case VoiceStateUpdateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] VOICE_STATE_UPDATE: ${event.state.userId}'
            ' → ${event.state.channelId}',
          ),
        );
        onVoiceStateUpdate?.call(event.state);
      case final VoiceServerUpdateEvent e:
        talker.info(
          '[Gateway] VOICE_SERVER_UPDATE guildId=${e.guildId} '
          'channelId=${e.channelId}',
        );
        onVoiceServerUpdate?.call(e);
      case CallCreateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] CALL_CREATE: ${event.channelId}'),
        );
        onCallCreate?.call(event);
      case CallUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] CALL_UPDATE: ${event.channelId}'),
        );
        onCallUpdate?.call(event);
      case CallDeleteEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] CALL_DELETE: ${event.channelId}'),
        );
        onCallDelete?.call(event.channelId);
      case UserSettingsUpdateEvent():
        _logGatewayDebug(() => talker.debug('[Gateway] USER_SETTINGS_UPDATE'));
        unawaited(_handleUserSettingsUpdate(event));
      case UserGuildSettingsUpdateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] USER_GUILD_SETTINGS_UPDATE: ${event.guildId}',
          ),
        );
        unawaited(_handleUserGuildSettingsUpdate(event));
      case UserPinnedDmsUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] USER_PINNED_DMS_UPDATE'),
        );
        unawaited(_handleUserPinnedDmsUpdate(event));
      case UserNoteUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] USER_NOTE_UPDATE: ${event.userId}'),
        );
        unawaited(_handleUserNoteUpdate(event));
      case UserConnectionsUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] USER_CONNECTIONS_UPDATE'),
        );
        _handleUserConnectionsUpdate(event);
      case WebauthnCredentialsUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] WEBAUTHN_CREDENTIALS_UPDATE'),
        );
        onWebauthnCredentialsUpdate?.call(event.credentials);
      case AuthSessionChangeEvent():
        _logGatewayDebug(() => talker.debug('[Gateway] AUTH_SESSION_CHANGE'));
        onAuthSessionIdHashChanged?.call(event.newAuthSessionIdHash);
      case InviteCreateEvent():
        _logGatewayDebug(() => talker.debug('[Gateway] INVITE_CREATE'));
        onInviteCreate?.call(event.data);
      case InviteDeleteEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] INVITE_DELETE: ${event.code}'),
        );
        onInviteDelete?.call(event.code);
      case SavedMessageCreateEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] SAVED_MESSAGE_CREATE: ${event.message.id}',
          ),
        );
        unawaited(database.savedMessageDao.addSavedMessage(event.message.id));
      case SavedMessageDeleteEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] SAVED_MESSAGE_DELETE: ${event.messageId}',
          ),
        );
        unawaited(database.savedMessageDao.removeSavedMessage(event.messageId));
      case RecentMentionDeleteEvent():
        _logGatewayDebug(
          () => talker.debug(
            '[Gateway] RECENT_MENTION_DELETE: ${event.messageId}',
          ),
        );
        unawaited(database.notificationDao.deleteMentionRow(event.messageId));
      case WebhooksUpdateEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] WEBHOOKS_UPDATE: ${event.channelId}'),
        );
      case FavoriteMemeCreateEvent():
        _logGatewayDebug(() => talker.debug('[Gateway] FAVORITE_MEME_CREATE'));
        unawaited(_handleFavoriteMemeCreate(event));
      case FavoriteMemeUpdateEvent():
        _logGatewayDebug(() => talker.debug('[Gateway] FAVORITE_MEME_UPDATE'));
        unawaited(_handleFavoriteMemeUpdate(event));
      case FavoriteMemeDeleteEvent():
        _logGatewayDebug(
          () => talker.debug('[Gateway] FAVORITE_MEME_DELETE: ${event.id}'),
        );
        unawaited(_handleFavoriteMemeDelete(event));
      case SessionsReplaceEvent():
        _logGatewayDebug(() => talker.debug('[Gateway] SESSIONS_REPLACE'));
      case final GatewayErrorEvent e:
        talker.warning('[Gateway] Error: [${e.code}] ${e.message}');
        onGatewayError?.call(e);
      case UnknownGatewayEvent():
        if (event.eventType == 'MESSAGE_UPDATE') {
          talker.warning(
            '[Gateway] Failed to parse MESSAGE_UPDATE: ${event.data}',
          );
        } else {
          _logGatewayDebug(
            () => talker.debug('[Gateway] Unknown event: ${event.eventType}'),
          );
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
    final List<VoiceState> readyVoiceStates = <VoiceState>[];

    // Drop unread writes queued against the previous session. The snapshot
    // applied below is authoritative.
    readStateWriteBatcher?.clearAll();

    var clearsMs = 0;
    var guildsMs = 0;
    var fanoutMs = 0;
    var accountDataMs = 0;
    var readstatesMs = 0;
    var settingsMs = 0;

    await database.transaction(() async {
      final Stopwatch phase = Stopwatch()..start();
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
        await database.messageDao.clearAll();
      }
      clearsMs = phase.elapsedMilliseconds;

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
          mobile: Value(isFluxerMobileClient),
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
        phase
          ..reset()
          ..start();
        final List<ParsedReadyGuild> processedGuilds = await parseReadyGuilds(
          rawGuilds: event.rawGuilds,
          guildPositions: guildPositions,
        );
        guildsMs = phase.elapsedMilliseconds;

        phase
          ..reset()
          ..start();
        final List<db.ServersCompanion> guildCompanions =
            <db.ServersCompanion>[];
        final List<db.ChannelsCompanion> channelCompanions =
            <db.ChannelsCompanion>[];
        final List<db.RolesCompanion> roleCompanions = <db.RolesCompanion>[];
        final List<db.UsersCompanion> memberUserCompanions =
            <db.UsersCompanion>[];
        final List<db.MembersCompanion> memberCompanions =
            <db.MembersCompanion>[];
        final List<({String guildId, List<db.GuildEmojisCompanion> emojis})>
        emojiReplacements =
            <({String guildId, List<db.GuildEmojisCompanion> emojis})>[];
        final List<({String guildId, List<db.GuildStickersCompanion> stickers})>
        stickerReplacements =
            <({String guildId, List<db.GuildStickersCompanion> stickers})>[];

        for (final ParsedReadyGuild parsed in processedGuilds) {
          final GuildCreateData guildData = parsed.guildData;
          final String guildId = guildData.guild.id;
          guildCompanions.add(
            guildFromSdk(
              guildData.guild,
              position: parsed.position,
              memberCount: parsed.memberCount,
              onlineCount: parsed.onlineCount,
            ),
          );
          for (final channel in guildData.channels) {
            channelCompanions.add(channelFromSdk(channel, guildId));
          }
          if (guildData.roles.isNotEmpty) {
            roleCompanions.addAll(
              guildData.roles.map((r) => roleFromSdk(r, guildId)),
            );
          }
          for (final member in guildData.members) {
            memberUserCompanions.add(userFromPartialSdk(member.user));
            memberCompanions.add(
              memberCompanionFromSdk(member, guildId: guildId),
            );
          }
          if (guildData.voiceStates.isNotEmpty) {
            readyVoiceStates.addAll(guildData.voiceStates);
          }
          if (guildData.emojis.isNotEmpty) {
            emojiReplacements.add((
              guildId: guildId,
              emojis: guildData.emojis
                  .map(
                    (e) => db.GuildEmojisCompanion.insert(
                      id: e.id,
                      guildId: guildId,
                      name: e.name,
                      animated: Value(e.animated),
                    ),
                  )
                  .toList(),
            ));
          }
          if (guildData.stickers.isNotEmpty) {
            stickerReplacements.add((
              guildId: guildId,
              stickers: guildData.stickers
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
            ));
          }
        }

        // Bulk hops: servers, channels, roles, users, members, then
        // per-guild emoji/sticker replace (delete+batch each).
        if (guildCompanions.isNotEmpty) {
          await database.guildDao.upsertServers(guildCompanions);
        }
        if (channelCompanions.isNotEmpty) {
          await database.channelDao.upsertChannelsMerged(
            channelCompanions,
            authoritativeTails: true,
          );
        }
        if (roleCompanions.isNotEmpty) {
          await database.roleDao.upsertRoles(roleCompanions);
        }
        if (memberUserCompanions.isNotEmpty) {
          await database.userDao.upsertUsers(memberUserCompanions);
        }
        if (memberCompanions.isNotEmpty) {
          await database.memberDao.upsertMembers(memberCompanions);
        }
        for (final ({String guildId, List<db.GuildEmojisCompanion> emojis})
            replacement
            in emojiReplacements) {
          await database.guildEmojiDao.replaceForGuild(
            replacement.guildId,
            replacement.emojis,
          );
        }
        for (final ({String guildId, List<db.GuildStickersCompanion> stickers})
            replacement
            in stickerReplacements) {
          await database.guildStickerDao.replaceForGuild(
            replacement.guildId,
            replacement.stickers,
          );
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

        fanoutMs = phase.elapsedMilliseconds;
      }

      phase
        ..reset()
        ..start();
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

      if (event.presences.isNotEmpty) {
        final List<
          ({String userId, String status, String? customStatus, bool mobile})
        >
        presenceUpdates =
            <
              ({
                String userId,
                String status,
                String? customStatus,
                bool mobile,
              })
            >[];
        for (final p in event.presences) {
          final userId = (p['user'] as Map<String, dynamic>?)?['id'] as String?;
          final status = p['status'] as String?;
          if (userId != null && status != null) {
            presenceUpdates.add((
              userId: userId,
              status: status,
              customStatus: _presenceCustomStatusFromMap(p),
              mobile: p['mobile'] as bool? ?? false,
            ));
          }
        }
        if (presenceUpdates.isNotEmpty) {
          await database.userDao.updateUserPresencesBatch(presenceUpdates);
        }
      }

      accountDataMs = phase.elapsedMilliseconds;

      phase
        ..reset()
        ..start();
      if (event.readStates.isNotEmpty) {
        final Map<String, db.ReadState> existingByChannelId =
            <String, db.ReadState>{
              for (final db.ReadState row
                  in await database.readStateDao.getReadStates())
                row.channelId: row,
            };
        final List<db.ReadStatesCompanion> readStateCompanions =
            <db.ReadStatesCompanion>[];
        for (final rs in event.readStates) {
          final db.ReadState? existing = existingByChannelId[rs.id];
          // The server snapshot never carries the client-only manual-unread
          // flag, so preserve a local manual mark (and its sticky divider)
          // while the server ack has not advanced past where we left off.
          final manualMark = existing?.manual ?? false;
          final keepManual =
              manualMark &&
              compareSnowflakeIds(rs.lastMessageId, existing?.lastMessageId) <=
                  0;
          final String? sticky = keepManual
              ? existing?.stickyUnreadMessageId
              : null;
          readStateCompanions.add(
            db.ReadStatesCompanion(
              channelId: Value(rs.id),
              lastMessageId: Value(rs.lastMessageId),
              mentionCount: Value(rs.mentionCount),
              lastPinTimestamp: Value(rs.lastPinTimestamp),
              manual: Value(keepManual),
              stickyUnreadMessageId: Value(sticky),
              version: Value(rs.version),
            ),
          );
          // Fold into the preload map so duplicate channel ids in one READY
          // match sequential single-row merges (later rows see earlier results).
          existingByChannelId[rs.id] = db.ReadState(
            channelId: rs.id,
            lastMessageId: rs.lastMessageId,
            mentionCount: rs.mentionCount,
            lastPinTimestamp: rs.lastPinTimestamp,
            manual: keepManual,
            stickyUnreadMessageId: sticky,
            version: rs.version,
          );
        }
        await database.readStateDao.upsertReadStates(readStateCompanions);
      }

      readstatesMs = phase.elapsedMilliseconds;

      phase
        ..reset()
        ..start();
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
                mode: InsertMode.insertOrReplace,
              );
        }
      }

      settingsMs = phase.elapsedMilliseconds;
    });

    final Stopwatch postPhase = Stopwatch()..start();
    for (final guildId in prunedGuildIds) {
      onGuildPermissionsEvict?.call(guildId);
    }

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
    if (readyVoiceStates.isNotEmpty) {
      onVoiceStatesBulk?.call(readyVoiceStates);
    }
    final int postMs = postPhase.elapsedMilliseconds;

    talker
      ..info(
        '[Gateway] READY transaction committed successfully in '
        '${readyStopwatch.elapsedMilliseconds}ms',
      )
      ..info(
        '[Gateway] READY split: '
        'guilds=${guildsMs}ms clears=${clearsMs}ms fanout=${fanoutMs}ms '
        'accountData=${accountDataMs}ms readstates=${readstatesMs}ms '
        'settings=${settingsMs}ms post=${postMs}ms '
        'total=${readyStopwatch.elapsedMilliseconds}ms '
        'guildCount=${event.guilds.length}',
      );
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
      mobile: isFluxerMobileClient,
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
    messageMentionContextCache?.invalidateGuild(guildId);
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
      hideMutedChannels: resolveDefaultHideMutedChannels?.call() ?? false,
      channelOverrides: null,
      version: -1,
    ).toJson();
  }

  Map<String, dynamic>? _mergeChannelOverrides(
    Object? existingRaw,
    Object? updatesRaw,
  ) {
    if (updatesRaw == null) {
      if (existingRaw is Map) {
        return existingRaw.cast<String, dynamic>();
      }
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
    final String channelId = event.message.channelId;
    final MessageMentionContextCache? mentionCache = messageMentionContextCache;
    late final MessageMentionContext mentionCtx;
    late final ChannelResolution channelResolution;
    if (mentionCache != null) {
      mentionCtx = await mentionCache.resolve(
        currentUserId: currentUserId,
        channelId: channelId,
        authorId: event.message.author.id,
        mentionedUserIds: event.message.mentions.map((u) => u.id).toList(),
        mentionEveryone: event.message.mentionEveryone,
        mentionRoleIds: event.message.mentionRoles,
      );
      channelResolution = await mentionCache.resolveChannel(channelId);
    } else {
      final db.Channel? priorChannel = await database.channelDao.getChannelById(
        channelId,
      );
      final db.DmChannel? priorDm = priorChannel == null
          ? await database.dmChannelDao.getDmChannelById(channelId)
          : null;
      channelResolution = priorChannel != null
          ? ChannelResolution.guild(
              channelId: channelId,
              guildStorageId: priorChannel.guildId,
              guildChannel: priorChannel,
            )
          : ChannelResolution.private(
              channelId: channelId,
              guildStorageId: '@me',
              dmChannel: priorDm,
            );
      mentionCtx = await buildMessageMentionContext(
        database,
        currentUserId: currentUserId,
        channelId: channelId,
      );
    }
    final bool mentionsCurrentUser = messageMentionsUser(
      mentionCtx,
      authorId: event.message.author.id,
      mentionedUserIds: event.message.mentions.map((u) => u.id).toList(),
      mentionEveryone: event.message.mentionEveryone,
      mentionRoleIds: event.message.mentionRoles,
    );
    final bool isDm = !channelResolution.isGuild;
    final String? previousChannelLastMessageId = channelResolution.isGuild
        ? channelResolution.guildChannel?.lastMessageId
        : channelResolution.dmChannel?.lastMessageId;
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
      unawaited(upsertSupplementalUsersFromSdk(database, event.message.users));
    }

    final ReadStateIncomingMessageDecision decision =
        await _readStateDecisionForCreatedMessage(
          msg,
          isDm: isDm,
          mentionsCurrentUser: mentionsCurrentUser,
          previousChannelLastMessageId: previousChannelLastMessageId,
          mentionCtx: mentionCtx,
        );
    final bool acknowledgedByGateway =
        decision.kind == ReadStateIncomingMessageKind.ackCurrentUserMessage ||
        decision.kind == ReadStateIncomingMessageKind.ackAutomaticMessage ||
        decision.kind == ReadStateIncomingMessageKind.ackBlockedMessage;

    await _applyReadStateDecisionForCreatedMessage(
      msg,
      isDm: isDm,
      mentionsCurrentUser: mentionsCurrentUser,
      previousChannelLastMessageId: previousChannelLastMessageId,
      decision: decision,
    );

    if (mentionsCurrentUser &&
        !isDm &&
        !acknowledgedByGateway &&
        !mentionCtx.blockedUserIds.contains(msg.authorId)) {
      if (mentionFeedWriteBatcher != null) {
        mentionFeedWriteBatcher!.enqueue(
          messageId: msg.id,
          channelId: msg.channelId,
        );
      } else {
        await database.notificationDao.prependMentionRow(
          messageId: msg.id,
          channelId: msg.channelId,
        );
      }
    }

    final UserNotificationSettings notificationLevel =
        channelResolution.isGuild && channelResolution.guildChannel != null
        ? resolveMessageNotifications(
            channel: channelResolution.guildChannel!,
            guildSettings: await _guildSettingsForStorage(
              channelResolution.guildStorageId,
            ),
          )
        : resolvePrivateMessageNotifications(
            guildSettings: await _guildSettingsForStorage('@me'),
            channelId: channelId,
          );

    onMessageCreate?.call(
      MessageCreateDispatch(
        event: event,
        snapshot: MessagePersistSnapshot(
          mentionsCurrentUser: mentionsCurrentUser,
          isDm: isDm,
          guildStorageId: channelResolution.guildStorageId,
          acknowledgedByGateway: acknowledgedByGateway,
          notificationLevel: notificationLevel,
        ),
      ),
    );

    if (messageWriteBatcher != null) {
      messageWriteBatcher!.enqueueMessage(
        companion: msg.toCompanion(),
        channelId: msg.channelId,
        messageId: msg.id,
        dmUpdate: isDm
            ? DmLastMessageUpdate(
                messageId: msg.id,
                content: msg.content,
                authorId: msg.authorId,
                timestamp: msg.timestamp,
              )
            : null,
      );
    } else {
      await database.messageDao.upsertMessage(msg.toCompanion());
      await database.channelDao.updateLastMessageId(msg.channelId, msg.id);
      if (isDm) {
        await database.dmChannelDao.updateLastMessage(
          msg.channelId,
          msg.id,
          msg.content,
          msg.authorId,
          msg.timestamp,
        );
      }
    }
  }

  Future<UserGuildSettingsResponse?> _guildSettingsForStorage(
    String guildStorageId,
  ) async {
    final row = await database.userGuildSettingsDao.getByGuildId(
      guildStorageId,
    );
    if (row == null) {
      return null;
    }
    return decodeUserGuildSettings(row.data);
  }

  Future<ReadStateIncomingMessageDecision> _readStateDecisionForCreatedMessage(
    Message msg, {
    required bool isDm,
    required bool mentionsCurrentUser,
    required String? previousChannelLastMessageId,
    required MessageMentionContext mentionCtx,
  }) async {
    final isOwnMessage = msg.authorId == currentUserId;
    final readState = await database.readStateDao.getReadState(msg.channelId);
    final ackMessageId = readState?.lastMessageId;
    final readStateKnown = ackMessageId != null;
    final manual = readState?.manual ?? false;
    final authorBlocked =
        !isOwnMessage && mentionCtx.blockedUserIds.contains(msg.authorId);
    final hadUnread =
        readStateKnown &&
        compareSnowflakeIds(ackMessageId, previousChannelLastMessageId) < 0;
    final hadUnreadOrMentions =
        (readState?.mentionCount ?? 0) > 0 ||
        hadUnread ||
        (readStateWriteBatcher?.hasPending(msg.channelId) ?? false);
    final autoAckActive =
        !manual && (isAutoAckActive?.call(msg.channelId) ?? false);
    return resolveReadStateIncomingMessageDecision(
      ReadStateIncomingMessageInput(
        isCurrentUserAuthor: isOwnMessage,
        automaticAckEnabled: autoAckActive,
        isAtBottom: true,
        authorBlocked: authorBlocked,
        hadUnreadOrMentions: hadUnreadOrMentions,
        readStateKnown: readStateKnown,
        messageId: msg.id,
        ackMessageId: ackMessageId,
        previousLastMessageId: previousChannelLastMessageId,
      ),
    );
  }

  Future<void> _applyReadStateDecisionForCreatedMessage(
    Message msg, {
    required bool isDm,
    required bool mentionsCurrentUser,
    required String? previousChannelLastMessageId,
    required ReadStateIncomingMessageDecision decision,
  }) async {
    switch (decision.kind) {
      case ReadStateIncomingMessageKind.ackCurrentUserMessage:
        await _enqueueOrAckReadState(
          channelId: msg.channelId,
          messageId: msg.id,
          isDm: isDm,
          clearSticky: true,
          markDmRead: true,
        );
        onOwnMessageCreated?.call(msg.channelId);
        return;
      case ReadStateIncomingMessageKind.ackAutomaticMessage:
      case ReadStateIncomingMessageKind.ackBlockedMessage:
        await _enqueueOrAckReadState(
          channelId: msg.channelId,
          messageId: msg.id,
          isDm: isDm,
          clearSticky: false,
          markDmRead: isDm,
        );
        return;
      case ReadStateIncomingMessageKind.ignoreBlockedMessage:
      case ReadStateIncomingMessageKind.coveredByAck:
        return;
      case ReadStateIncomingMessageKind.recordUnread:
        final readState = await database.readStateDao.getReadState(
          msg.channelId,
        );
        if (readStateWriteBatcher != null) {
          final shouldMention = isDm
              ? !await _isDmMuted(msg.channelId)
              : mentionsCurrentUser;
          final String? seedAckCandidate =
              (decision.initializeUnknownReadState && !isDm)
              ? (previousChannelLastMessageId ??
                    snowflakeAtPreviousMillisecond(msg.id))
              : null;
          readStateWriteBatcher!.enqueueUnread(
            channelId: msg.channelId,
            messageId: msg.id,
            shouldMention: shouldMention,
            isDm: isDm,
            seedAckCandidate: seedAckCandidate,
          );
        } else {
          await _recordUnreadForCreatedMessage(
            msg,
            isDm: isDm,
            existing: readState,
            mentionsCurrentUser: mentionsCurrentUser,
            seedAck: decision.initializeUnknownReadState,
            previousChannelLastMessageId: previousChannelLastMessageId,
          );
        }
        return;
    }
  }

  Future<void> _enqueueOrAckReadState({
    required String channelId,
    required String messageId,
    required bool isDm,
    required bool clearSticky,
    required bool markDmRead,
  }) async {
    if (readStateWriteBatcher != null) {
      readStateWriteBatcher!.enqueueAck(
        channelId: channelId,
        messageId: messageId,
        isDm: isDm,
        clearSticky: clearSticky,
        markDmRead: markDmRead,
      );
      return;
    }
    final existing = await database.readStateDao.getReadState(channelId);
    await _ackReadStateForCreatedMessage(
      channelId: channelId,
      messageId: messageId,
      isDm: isDm,
      existing: existing,
      clearSticky: clearSticky,
    );
  }

  Future<void> _ackReadStateForCreatedMessage({
    required String channelId,
    required String messageId,
    required bool isDm,
    required db.ReadState? existing,
    required bool clearSticky,
  }) async {
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value(messageId),
        mentionCount: const Value(0),
        lastPinTimestamp: Value(existing?.lastPinTimestamp),
        manual: const Value(false),
        stickyUnreadMessageId: clearSticky
            ? const Value(null)
            : Value(existing?.stickyUnreadMessageId),
        version: Value(existing?.version),
      ),
    );
    if (isDm) {
      await database.dmChannelDao.markAsRead(channelId);
    }
  }

  Future<void> _recordUnreadForCreatedMessage(
    Message msg, {
    required bool isDm,
    required db.ReadState? existing,
    required bool mentionsCurrentUser,
    required bool seedAck,
    required String? previousChannelLastMessageId,
  }) async {
    final shouldMention = isDm
        ? !await _isDmMuted(msg.channelId)
        : mentionsCurrentUser;
    // Seed the ack baseline only for never-acked guild channels so new messages
    // surface as plain unread. DM unread is tracked via the DM row counter, so
    // its ack is left untouched.
    final String? ackMessageId = (seedAck && !isDm)
        ? (previousChannelLastMessageId ??
              snowflakeAtPreviousMillisecond(msg.id))
        : existing?.lastMessageId;
    final mentionCount =
        (existing?.mentionCount ?? 0) + (shouldMention ? 1 : 0);
    final bool readStateChanged =
        existing == null ||
        existing.lastMessageId != ackMessageId ||
        shouldMention;
    if (readStateChanged) {
      await database.readStateDao.upsertReadState(
        db.ReadStatesCompanion(
          channelId: Value(msg.channelId),
          lastMessageId: Value(ackMessageId),
          mentionCount: Value(mentionCount),
          lastPinTimestamp: Value(existing?.lastPinTimestamp),
          manual: Value(existing?.manual ?? false),
          stickyUnreadMessageId: Value(existing?.stickyUnreadMessageId),
          version: Value(existing?.version),
        ),
      );
    }
    if (isDm) {
      await database.dmChannelDao.incrementUnreadCount(msg.channelId);
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

  Future<void> _handleMessageUpdate(MessageUpdateEvent event) async {
    final msg = Message.fromSdk(event.message, currentUserId: currentUserId);
    final mentionsCurrentUser = await resolveMessageMentionsUser(
      database,
      currentUserId: currentUserId,
      channelId: event.message.channelId,
      authorId: event.message.author.id,
      mentionedUserIds: event.message.mentions.map((u) => u.id).toList(),
      mentionEveryone: event.message.mentionEveryone,
      mentionRoleIds: event.message.mentionRoles,
    );
    if (event.message.webhookId == null) {
      unawaited(
        database.userDao.upsertUser(userFromPartialSdk(event.message.author)),
      );
      unawaited(upsertMentionUsersFromSdk(database, event.message.mentions));
      unawaited(upsertSupplementalUsersFromSdk(database, event.message.users));
    }
    await database.messageDao.upsertMessage(
      msg.copyWith(isMentioned: mentionsCurrentUser).toCompanion(),
    );
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
    await _deleteMessages(
      channelId: event.channelId,
      messageIds: [event.messageId],
    );
    onMessageDelete?.call(event);
  }

  Future<void> _deleteMessages({
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
    });

    // Reconcile read state after the rows are removed. Only the tail is
    // rewritten; deleting older messages in a jump window must not hide real
    // unread below it.
    final repository = readStateRepository;
    if (repository != null) {
      await repository.reconcileAfterMessageDelete(
        channelId: channelId,
        deletedMessageIds: messageIds,
        currentUserId: currentUserId,
      );
    }
  }

  void _handleTypingStart(TypingStartEvent event) {
    final String? guildId = event.guildId;
    final GuildMemberResponse? member = event.member;
    if (guildId != null && member != null) {
      unawaited(_hydrateTypingMemberIfMissing(guildId, member));
    }
    onTypingStart?.call(event.channelId, event.userId);
  }

  // Hydrate the typer's member only when absent, mirroring the web client.
  // Avoids clobbering fresher rows and re-emitting member streams each event.
  Future<void> _hydrateTypingMemberIfMissing(
    String guildId,
    GuildMemberResponse member,
  ) async {
    final existing = await database.memberDao.getMemberByUserId(
      member.user.id,
      guildId,
    );
    if (existing != null) {
      return;
    }
    _handleMemberUpsert(guildId, member);
  }

  void _handlePresenceUpdate(PresenceUpdateEvent event) {
    _presenceUpdateBatcher.enqueue(
      userId: event.userId,
      status: event.status,
      customStatus: event.customStatus,
      mobile: event.mobile,
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

  Future<void> _handleChannelUpsert(ChannelResponse channel) async {
    final guildId = channel.guildId;
    if (guildId != null) {
      await database.channelDao.upsertChannel(channelFromSdk(channel, guildId));
      unawaited(() {
        _invalidateMentionCacheForChannel(channel.id, guildId: guildId);
        onChannelPermissionChanged?.call(channel.id);
      }());
      return;
    }

    final companion = dmChannelCompanionFromChannelResponse(channel);
    if (companion == null) {
      return;
    }
    _invalidateMentionCacheForChannel(channel.id);
    for (final r in dmRecipientUsersFromChannelResponse(channel)) {
      unawaited(database.userDao.upsertUser(userFromPartialSdk(r)));
    }
    unawaited(database.dmChannelDao.upsertDmChannels([companion]));
  }

  void _handleChannelDelete(ChannelDeleteEvent event) {
    _invalidateMentionCacheForChannel(
      event.channel.id,
      guildId: event.channel.guildId,
    );
    unawaited(database.messageDao.deleteMessagesForChannel(event.channel.id));
    unawaited(database.channelDao.deleteChannel(event.channel.id));
    unawaited(database.dmChannelDao.deleteDmChannel(event.channel.id));
    readStateWriteBatcher?.discard(event.channel.id);
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
    await _deleteMessages(channelId: event.channelId, messageIds: event.ids);
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
      final List<
        ({String userId, String status, String? customStatus, bool mobile})
      >
      updates =
          <
            ({String userId, String status, String? customStatus, bool mobile})
          >[];
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
          mobile: presence['mobile'] as bool? ?? false,
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
    final updates =
        <({String userId, String status, String? customStatus, bool mobile})>[];
    for (final p in event.presences) {
      final userId = (p['user'] as Map<String, dynamic>?)?['id'] as String?;
      final status = p['status'] as String?;
      if (userId != null && status != null) {
        updates.add((
          userId: userId,
          status: status,
          customStatus: _presenceCustomStatusFromMap(p),
          mobile: p['mobile'] as bool? ?? false,
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
      // Guild went unavailable. Keep it in the list but mark it.
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
    unawaited(() async {
      await database.relationshipDao.upsertRelationships([
        db.RelationshipsCompanion.insert(
          userId: relationship.user.id,
          type: relationship.type.json ?? 1,
          nickname: Value(relationship.nickname),
          since: Value(relationship.since),
        ),
      ]);
      await readStateWriteBatcher?.flushAll();
      await readStateRepository?.recomputeMentionsForUnreadOrMentionedChannels(
        currentUserId: currentUserId,
      );
    }());
  }

  void _handleRelationshipRemove(RelationshipRemoveEvent event) {
    unawaited(() async {
      await database.relationshipDao.deleteRelationship(event.userId);
      await readStateWriteBatcher?.flushAll();
      await readStateRepository?.recomputeMentionsForUnreadOrMentionedChannels(
        currentUserId: currentUserId,
      );
    }());
  }

  Future<void> _handleReactionAdd(MessageReactionAddEvent event) async {
    await _enqueueReactionChange(
      messageId: event.messageId,
      channelId: event.channelId,
      emoji: event.emoji,
      isAdd: true,
      userId: event.userId,
    );
    onMessageReactionChange?.call(event.channelId, event.messageId);
  }

  Future<void> _handleReactionRemove(MessageReactionRemoveEvent event) async {
    await _enqueueReactionChange(
      messageId: event.messageId,
      channelId: event.channelId,
      emoji: event.emoji,
      isAdd: false,
      userId: event.userId,
    );
    onMessageReactionChange?.call(event.channelId, event.messageId);
  }

  Future<void> _enqueueReactionChange({
    required String messageId,
    required String channelId,
    required ReactionEmoji emoji,
    required bool isAdd,
    String? userId,
  }) async {
    final bool isCurrentUser =
        userId != null && currentUserId != null && userId == currentUserId;
    if (reactionWriteBatcher != null) {
      reactionWriteBatcher!.enqueue(
        messageId: messageId,
        channelId: channelId,
        emoji: emoji,
        isAdd: isAdd,
        isCurrentUser: isCurrentUser,
      );
      return;
    }
    await _modifyReaction(messageId, emoji, isAdd: isAdd, userId: userId);
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

    final reactions = decodeMessageReactionsJson(msg.reactionsJson);
    final isCurrentUser =
        userId != null && currentUserId != null && userId == currentUserId;

    if (!applyMessageReactionDelta(
      reactions,
      emoji,
      isAdd: isAdd,
      isCurrentUser: isCurrentUser,
    )) {
      return;
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

    final reactions = decodeMessageReactionsJson(msg.reactionsJson)
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

    final decision = resolveReadStateServerAckDecision(
      ReadStateServerAckInput(
        messageId: event.messageId,
        ackMessageId: current?.lastMessageId,
        serverVersion: current?.version,
        version: event.version,
        manual: manual,
        readStateWasKnown: current?.lastMessageId != null,
        hasMentionCount: event.mentionCount != null,
      ),
    );

    final shouldWrite = switch (decision.kind) {
      ReadStateServerAckKind.ignoreStaleVersion => false,
      ReadStateServerAckKind.ignoreOlderMessage => false,
      ReadStateServerAckKind.refreshCurrentAck =>
        decision.shouldUpdateMentionCount,
      ReadStateServerAckKind.applyManualAck => true,
      ReadStateServerAckKind.advanceAck => true,
    };
    if (!shouldWrite) {
      return;
    }

    // Server ack is authoritative; flush pending increments first.
    await readStateWriteBatcher?.flush(event.channelId);
    await _writeServerAck(
      channelId: event.channelId,
      messageId: event.messageId,
      mentionCount: mentionCount,
      manual: manual,
      current: current,
      version: event.version,
    );
    onMessageAcked?.call(event.channelId, manual: manual);
  }

  Future<void> _writeServerAck({
    required String channelId,
    required String messageId,
    required int mentionCount,
    required bool manual,
    required db.ReadState? current,
    required String? version,
  }) async {
    final existingSticky = current?.stickyUnreadMessageId;
    final String? newSticky;
    if (manual) {
      newSticky = existingSticky ?? messageId;
    } else if (existingSticky != null &&
        compareSnowflakeIds(messageId, existingSticky) < 0) {
      newSticky = existingSticky;
    } else {
      newSticky = null;
    }
    await database.readStateDao.upsertReadState(
      db.ReadStatesCompanion(
        channelId: Value(channelId),
        lastMessageId: Value(messageId),
        mentionCount: Value(mentionCount),
        lastPinTimestamp: Value(current?.lastPinTimestamp),
        manual: Value(manual),
        stickyUnreadMessageId: Value(newSticky),
        version: Value(version ?? current?.version),
      ),
    );
    final dm = await database.dmChannelDao.getDmChannelById(channelId);
    if (dm != null) {
      await database.dmChannelDao.updateUnreadCount(channelId, mentionCount);
    }
  }

  void _handleReactionAddMany(MessageReactionAddManyEvent event) {
    unawaited(() async {
      final msg = await database.messageDao.getMessage(event.messageId);
      if (msg == null) {
        return;
      }
      final reactions = decodeMessageReactionsJson(msg.reactionsJson);
      for (final r in event.reactions) {
        final emoji = r['emoji'] as Map<String, dynamic>?;
        if (emoji == null) {
          continue;
        }
        applyMessageReactionDelta(
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

    _logGatewayDebug(
      () => talker.debug(
        '[Gateway] PASSIVE_UPDATES: '
        'created=${created?.length ?? 0}, '
        'updated=${updated?.length ?? 0}, '
        'deleted=${deleted?.length ?? 0}',
      ),
    );

    if (created != null) {
      for (final channel in created) {
        _logGatewayDebug(
          () => talker.debug('[Gateway]   +channel: ${channel.id}'),
        );
        _handleChannelUpsert(channel);
      }
    }

    if (updated != null) {
      for (final channel in updated) {
        _logGatewayDebug(
          () => talker.debug('[Gateway]   ~channel: ${channel.id}'),
        );
        _handleChannelUpsert(channel);
      }
    }

    if (deleted != null) {
      for (final id in deleted) {
        _logGatewayDebug(() => talker.debug('[Gateway]   -channel: $id'));
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

  void _invalidateMentionCacheForChannel(String channelId, {String? guildId}) {
    messageMentionContextCache?.invalidateChannel(channelId);
    if (guildId != null) {
      messageMentionContextCache?.invalidateGuild(guildId);
    }
  }
}
