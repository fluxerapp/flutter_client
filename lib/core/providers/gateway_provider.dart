import 'dart:async';

import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';
import 'package:fluxer_app/features/channels/data/read_state_repository.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_realtime_provider.dart';
import 'package:fluxer_app/features/favorites/data/favorites_sync_service.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/guilds/providers/guild_availability_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/settings/providers/connections_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
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
  final handler = GatewayEventHandler(
    database: db,
    readStateRepository: ReadStateRepository(
      ref.watch(fluxerClientProvider),
      db,
    ),
    currentUserId: currentUserId,
    onReady: () {
      talker.info('[Gateway] Setting gatewayReady = true');
      unawaited(ref.read(channelPermissionCacheProvider.notifier).rebuildAll());
      ref.read(gatewayReadyProvider.notifier).setReady();
    },
    onTypingStart: (channelId, userId) {
      ref.read(typingIndicatorsProvider.notifier).addTyping(channelId, userId);
    },
    onTypingClear: (channelId, userId) {
      ref
          .read(typingIndicatorsProvider.notifier)
          .removeTyping(channelId, userId);
    },
    onVoiceStateUpdate: (state) {
      ref.read(voiceStatesMapProvider.notifier).update(state);
      ref.read(voiceSessionProvider.notifier).handleSelfVoiceStateUpdate(state);
      ref.read(voiceSessionProvider.notifier).syncE2eeFromVoiceStates();
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
      ref.read(voiceSessionProvider.notifier).syncE2eeFromVoiceStates();
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
    },
    onPermissionsClearAll: () {
      ref.read(guildPermissionsProvider.notifier).clearAll();
      ref.read(channelPermissionCacheProvider.notifier).clearAll();
    },
    onMessageCreate: (event) => messageBus.emit(MessageCreated(event)),
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
    onUserSettingsHydrate: (settings) {
      unawaited(
        ref
            .read(themePreferenceProvider.notifier)
            .applyServerSettings(settings),
      );
      unawaited(
        ref
            .read(favoritesSyncServiceProvider)
            .hydrateFromUserSettings(settings),
      );
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
  );

  final subscription = connection.events.listen(
    handler.handle,
    onError: (Object error) {
      talker.error('[Gateway] Event stream error: $error');
    },
  );

  ref.onDispose(subscription.cancel);
  return subscription;
}
