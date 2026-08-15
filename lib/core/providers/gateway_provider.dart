import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/gateway/gateway_event_dispatcher.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_performance_providers.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/providers/splash_exit_allowed_provider.dart';
import 'package:fluxer_app/core/push/pending_push_notification_path_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_store.dart';
import 'package:fluxer_app/core/synced_preferences/synced_theme_hydration.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/channels/providers/read_state_write_batcher_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_read_viewport_provider.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/utils/message_page_sync.dart';
import 'package:fluxer_app/features/friends/providers/blocked_user_ids_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/members/data/member_cache_evictor.dart';
import 'package:fluxer_app/features/members/data/member_list_update_batcher.dart';
import 'package:fluxer_app/features/members/providers/guild_member_chunk_waiter.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_desired_ranges_provider.dart';
import 'package:fluxer_app/features/members/providers/member_list_viewport_provider.dart';
import 'package:fluxer_app/features/settings/providers/connections_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/providers/webauthn_credentials_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_dart/export.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'gateway_connection_provider.dart';
export 'gateway_reconnect_provider.dart';

part 'gateway_provider.g.dart';

/// Connects whenever [gatewayConnectionProvider] builds a new
/// [GatewayConnection] (e.g. token or Dio churn). Startup alone is not enough
/// because only that first instance received [GatewayConnection.connect].
///
/// Rotating sockets must clear [gatewayReadyProvider] until the next READY so
/// navigation and voice do not assume an active session on a disconnected
/// socket.
@Riverpod(keepAlive: true)
void gatewayConnectBinding(Ref ref) {
  ref.listen<GatewayConnection>(gatewayConnectionProvider, (
    GatewayConnection? previous,
    GatewayConnection next,
  ) {
    if (previous != null) {
      ref.read(gatewayReadyProvider.notifier).reset();
      ref.read(guildAvailabilityProvider.notifier).clear();
    }
    unawaited(next.connect());
  }, fireImmediately: true);
}

@Riverpod(keepAlive: true)
Raw<StreamSubscription<GatewayEvent>?> gatewayEventListener(Ref ref) {
  final db = ref.watch(fluxerDatabaseProvider);
  final connection = ref.watch(gatewayConnectionProvider);

  final currentUserId = ref.read(currentUserIdProvider);
  final messageBus = ref.watch(messageRealtimeBusProvider);
  final mentionCache = ref.watch(messageMentionContextCacheProvider);
  ({String? guildId})? pendingReadyHeavyWork;

  void runReadyHeavyWork(String? guildId) {
    unawaited(
      ref
          .read(channelPermissionCacheProvider.notifier)
          .rebuildAfterReady(priorityGuildId: guildId),
    );
    ref
      ..invalidate(effectiveGuildChannelPermissionBitsProvider)
      ..invalidate(channelLocalGuildChannelPermissionBitsProvider);
    if (guildId != null) {
      ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId, force: true);
    }
  }

  void scheduleReadyHeavyWork(String? guildId) {
    if (ref.read(splashRevealCompleteProvider)) {
      runReadyHeavyWork(guildId);
      return;
    }
    pendingReadyHeavyWork = (guildId: guildId);
  }

  ref
    ..listen<bool>(splashRevealCompleteProvider, (_, bool complete) {
      final ({String? guildId})? pending = pendingReadyHeavyWork;
      if (!complete || pending == null) {
        return;
      }
      pendingReadyHeavyWork = null;
      runReadyHeavyWork(pending.guildId);
    })
    ..listen<Set<String>>(blockedUserIdsProvider, (_, Set<String> next) {
      mentionCache.blockedUserIds = next;
    }, fireImmediately: true);
  final handler = GatewayEventHandler(
    database: db,
    readStateRepository: ReadStateRepository(
      ref.watch(fluxerClientProvider),
      db,
    ),
    readStateWriteBatcher: ref.read(readStateWriteBatcherProvider),
    messageMentionContextCache: mentionCache,
    messageWriteBatcher: ref.read(messageWriteBatcherProvider),
    channelLastMessageIndex: ref.read(channelLastMessageIndexProvider),
    mentionFeedWriteBatcher: ref.read(mentionFeedWriteBatcherProvider),
    reactionWriteBatcher: ref.read(reactionWriteBatcherProvider),
    currentUserId: currentUserId,
    isAutoAckActive: (channelId) {
      final chat = ref.read(chatViewModelProvider);
      if (chat.channelId != channelId) {
        // Not the channel the user is looking at: never auto-ack it on the
        // strength of a stale viewport row mid channel-handoff.
        return false;
      }
      return isAutoAckEligible(
        viewport: ref.read(chatReadViewportProvider),
        channelId: channelId,
        hasMoreNewerMessages: chat.hasMoreNewerMessages,
        currentTailId: newestServerBackedMessageId(chat.messages),
      );
    },
    onReady: () {
      talker.info('[Gateway] Setting gatewayReady = true');
      if (!kReleaseMode) {
        final stats = connection.compressionStats;
        talker.info(
          '[Gateway] compression: negotiated=${stats.compressionNegotiated} frames=${stats.frames} wire=${stats.wireBytes} decompressed=${stats.decompressedBytes}',
        );
      }
      final String? activeGuildId = ref.read(activeGuildIdProvider);
      ref.read(gatewayReadyProvider.notifier).setReady();
      ref.read(guildSyncProvider.notifier).clearAll();
      clearGuildRolesPrefetchState();
      clearVoiceParticipantUsersCache();
      ref.read(memberListViewportProvider.notifier).clearSession();
      ref.read(memberListDesiredRangesProvider.notifier).clearAll();
      ref.read(memberListUpdateBatcherProvider).clearAll();
      scheduleReadyHeavyWork(activeGuildId);
      ref.read(gatewaySessionRecoveryProvider.notifier).bump();
      ref.read(pendingPushNotificationPathProvider.notifier).flushIfReady();
    },
    onResumed: () {
      talker.info('[Gateway] RESUMED, light recovery');
      ref.read(gatewayReadyProvider.notifier).setReady();
      ref.read(gatewaySessionRecoveryProvider.notifier).bump();
      ref.read(pendingPushNotificationPathProvider.notifier).flushIfReady();
    },
    onTypingStart: (channelId, userId) {
      ref.read(typingIndicatorsProvider.notifier).addTyping(channelId, userId);
    },
    onTypingClear: (channelId, userId) {
      ref
          .read(typingIndicatorsProvider.notifier)
          .removeTyping(channelId, userId);
    },
    onVoiceStateUpdate: (voiceState) {
      ref.read(voiceStatesMapProvider.notifier).update(voiceState);
      ref
          .read(voiceSessionProvider.notifier)
          .handleSelfVoiceStateUpdate(voiceState);
      // Only sync E2EE if this update is for the current voice channel
      final VoiceSessionState session = ref.read(voiceSessionProvider);
      if (session.isConnected &&
          session.channelId != null &&
          voiceState.channelId == session.channelId &&
          voiceState.guildId == session.guildId) {
        ref.read(voiceSessionProvider.notifier).syncE2eeFromVoiceStates();
      }
    },
    onVoiceStatesBulk: (states) {
      ref.read(voiceStatesMapProvider.notifier).updateBulk(states);
      final String? userId = currentUserId;
      if (userId != null) {
        for (final VoiceState vs in states) {
          if (vs.userId == userId) {
            ref
                .read(voiceSessionProvider.notifier)
                .handleSelfVoiceStateUpdate(vs);
          }
        }
      }
      // Only sync E2EE if any of the bulk updates are for the current voice channel
      final VoiceSessionState session = ref.read(voiceSessionProvider);
      if (session.isConnected && session.channelId != null) {
        final bool hasRelevantUpdate = states.any(
          (VoiceState vs) =>
              vs.channelId == session.channelId &&
              vs.guildId == session.guildId,
        );
        if (hasRelevantUpdate) {
          ref.read(voiceSessionProvider.notifier).syncE2eeFromVoiceStates();
        }
      }
    },
    onGatewayError: (event) {
      ref.read(voiceSessionProvider.notifier).handleGatewayError(event);
    },
    onVoiceServerUpdate: (event) {
      ref.read(voiceSessionProvider.notifier).handleVoiceServerUpdate(event);
    },
    onCallCreate: (event) {
      ref
          .read(activeCallsProvider.notifier)
          .createCall(
            event.channelId,
            messageId: event.messageId,
            region: event.region,
            ringing: event.ringing,
            voiceStates: event.voiceStates,
          );
    },
    onCallUpdate: (event) {
      ref
          .read(activeCallsProvider.notifier)
          .updateCall(
            event.channelId,
            messageId: event.messageId,
            region: event.region,
            ringing: event.ringing,
            voiceStates: event.voiceStates,
          );
      if (event.ringing == null) {
        final String? uid = ref.read(currentUserIdProvider);
        final bool userJoinedOnAnotherDevice =
            uid != null &&
            (event.voiceStates?.any((VoiceState vs) => vs.userId == uid) ??
                false);
        if (userJoinedOnAnotherDevice) {
          final VoiceSessionState voice = ref.read(voiceSessionProvider);
          final bool onThisDevice =
              voice.isInVoice && voice.channelId == event.channelId;
          if (!onThisDevice) {
            ref
                .read(activeCallsProvider.notifier)
                .removeUserFromPendingRing(
                  channelId: event.channelId,
                  userId: uid,
                );
          }
        }
      }
    },
    onCallDelete: (channelId) {
      ref.read(activeCallsProvider.notifier).deleteCall(channelId);
      ref
          .read(outgoingVoiceCallInitiatorProvider.notifier)
          .clearChannel(channelId);
    },
    onInviteCreate: (data) {
      ref.read(inviteCacheProvider.notifier).addInvite(data);
    },
    onInviteDelete: (code) {
      ref.read(inviteCacheProvider.notifier).removeInvite(code);
    },
    onGuildPermissionsChanged: (guildId) {
      unawaited(
        ref.read(guildPermissionsProvider.notifier).refreshPermissions(guildId),
      );
      unawaited(
        ref.read(channelPermissionCacheProvider.notifier).rebuildGuild(guildId),
      );
      ref
        ..invalidate(effectiveGuildChannelPermissionBitsProvider)
        ..invalidate(channelLocalGuildChannelPermissionBitsProvider);
    },
    onGuildPermissionsEvict: (guildId) {
      ref.read(guildPermissionsProvider.notifier).evict(guildId);
      unawaited(
        ref.read(channelPermissionCacheProvider.notifier).evictGuild(guildId),
      );
    },
    onChannelPermissionChanged: (channelId) {
      unawaited(
        ref
            .read(channelPermissionCacheProvider.notifier)
            .rebuildChannel(channelId),
      );
      ref
        ..invalidate(effectiveGuildChannelPermissionBitsProvider(channelId))
        ..invalidate(channelLocalGuildChannelPermissionBitsProvider(channelId));
    },
    onChannelDelete: (channelId) {
      ref.read(slowmodeTrackerProvider.notifier).clearChannel(channelId);
    },
    onPermissionsClearAll: () {
      ref.read(guildPermissionsProvider.notifier).clearAll();
      ref.read(channelPermissionCacheProvider.notifier).clearAll();
      ref
        ..invalidate(effectiveGuildChannelPermissionBitsProvider)
        ..invalidate(channelLocalGuildChannelPermissionBitsProvider);
    },
    onMessageCreate: (MessageCreateDispatch dispatch) => messageBus.emit(
      MessageCreated(event: dispatch.event, snapshot: dispatch.snapshot),
    ),
    onMessageUpdate: (event) => messageBus.emit(MessageUpdated(event)),
    onMessageDelete: (event) => messageBus.emit(MessageDeleted(event)),
    onMessageDeleteBulk: (event) => messageBus.emit(MessagesDeletedBulk(event)),
    onMessageReactionChange: (channelId, messageId) => messageBus.emit(
      MessageReactionsChanged(channelId: channelId, messageId: messageId),
    ),
    onOwnMessageCreated: (channelId) {
      ref.read(chatViewModelProvider.notifier)
        ..clearStickyUnreadFor(channelId)
        ..cancelPendingOutgoingAck(channelId);
    },
    onMessageAcked: (channelId, {required manual}) {
      ref
          .read(chatViewModelProvider.notifier)
          .applyExternalAck(channelId, manual: manual);
    },
    onAuthSessionIdHashChanged: (idHash) {
      ref.read(currentAuthSessionIdHashProvider.notifier).update(idHash);
    },
    onConnectionsUpdate: (connections) {
      ref
          .read(connectionsViewModelProvider.notifier)
          .setConnections(connections);
    },
    onWebauthnCredentialsUpdate: (credentials) {
      ref
          .read(webauthnCredentialsViewModelProvider.notifier)
          .setCredentials(credentials);
    },
    onSessionChanging: () {
      ref.read(syncedPreferencesStoreProvider).markSessionChanging();
    },
    onUserSettingsHydrate: (settings) {
      unawaited(_handleUserSettingsHydrate(ref, settings));
    },
    onUnavailableGuildsReady: (rawGuilds) {
      ref.read(guildAvailabilityProvider.notifier).loadFromReady(rawGuilds);
    },
    onGuildAvailabilityChanged:
        (guildId, {required unavailable, unavailableHidden = false}) {
          ref
              .read(guildAvailabilityProvider.notifier)
              .handleGuildAvailability(
                guildId,
                unavailable: unavailable,
                unavailableHidden: unavailableHidden,
              );
        },
    onGuildAvailable: (guildId) {
      ref.read(guildAvailabilityProvider.notifier).setGuildAvailable(guildId);
    },
    onMembersChunk: (guildId, userIds, {nonce}) {
      ref
          .read(guildMemberChunkWaiterProvider)
          .notifyChunk(
            guildId,
            userIds: userIds,
            requestId: GuildMemberChunkWaiter.requestIdFromNonce(nonce),
          );
      unawaited(
        ref
            .read(memberCacheEvictorProvider)
            .evictIfNeeded(
              guildId: guildId,
              protectedUserIds: collectProtectedMemberUserIds(
                ref: ref,
                guildId: guildId,
              ),
            ),
      );
    },
    onMembersChunkProgress:
        (guildId, chunkIndex, chunkCount, userIds, {nonce}) {
          ref
              .read(guildMemberChunkWaiterProvider)
              .notifyChunkProgress(
                guildId,
                chunkIndex,
                chunkCount,
                userIds: userIds,
                requestId: GuildMemberChunkWaiter.requestIdFromNonce(nonce),
              );
        },
    onMemberListUpdate: (event) {
      ref.read(memberListUpdateBatcherProvider).enqueue(event);
    },
    resolveDefaultHideMutedChannels: () =>
        ref.read(userSettingsViewModelProvider).defaultHideMutedChannels,
  );

  final dispatcher = GatewayEventDispatcher(
    onEvent: handler.handle,
    onFlushWriteBatchers: ref.read(gatewayWriteBatcherFlushAllProvider),
  );

  final subscription = connection.events.listen(
    dispatcher.dispatch,
    onError: (Object error) {
      talker.error('[Gateway] Event stream error: $error');
    },
  );

  ref.onDispose(() {
    unawaited(subscription.cancel());
    unawaited(dispatcher.dispose());
    handler.dispose();
  });
  return subscription;
}

Future<void> _handleUserSettingsHydrate(
  Ref ref,
  UserSettingsResponse settings,
) async {
  final notifier = ref.read(themePreferenceProvider.notifier);
  await ref
      .read(syncedPreferencesStoreProvider)
      .hydrateFromUserSettings(
        settings,
        themeCustomizationApplier: notifier.applySyncedThemeCustomization,
      );
  await applySyncedThemeFromUserSettings(
    settings,
    notifier.applySyncedThemeCustomization,
  );
  await notifier.applyServerSettings(settings);
}
