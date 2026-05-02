import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluxer_app/core/gateway/gateway_event_handler.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/providers/gateway_connection_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/auth/providers/current_auth_session_provider.dart';
import 'package:fluxer_app/features/chat/providers/message_realtime_events.dart';
import 'package:fluxer_app/features/chat/providers/message_realtime_provider.dart';
import 'package:fluxer_app/features/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/features/gateway/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/guilds/providers/guild_permissions_provider.dart';
import 'package:fluxer_app/features/settings/providers/connections_view_model.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_dart/gateway.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

export 'gateway_connection_provider.dart';

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
  ref.listen<GatewayConnection>(
    gatewayConnectionProvider,
    (GatewayConnection? previous, GatewayConnection next) {
      if (previous != null) {
        ref.read(gatewayReadyProvider.notifier).reset();
      }
      unawaited(next.connect());
    },
    fireImmediately: true,
  );
}

@Riverpod(keepAlive: true)
Raw<StreamSubscription<GatewayEvent>?> gatewayEventListener(Ref ref) {
  final db = ref.watch(fluxerDatabaseProvider);
  final connection = ref.watch(gatewayConnectionProvider);

  final currentUserId = ref.read(currentUserIdProvider);
  final messageBus = ref.watch(messageRealtimeBusProvider);
  final handler = GatewayEventHandler(
    database: db,
    currentUserId: currentUserId,
    onReady: () {
      talker.info('[Gateway] Setting gatewayReady = true');
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
    },
    onVoiceStatesBulk: (states) {
      ref.read(voiceStatesMapProvider.notifier).updateBulk(states);
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
    },
    onGuildPermissionsEvict: (guildId) {
      ref.read(guildPermissionsProvider.notifier).evict(guildId);
    },
    onPermissionsClearAll: () {
      ref.read(guildPermissionsProvider.notifier).clearAll();
    },
    onMessageCreate: (event) => messageBus.emit(MessageCreated(event)),
    onMessageUpdate: (event) => messageBus.emit(MessageUpdated(event)),
    onMessageDelete: (event) => messageBus.emit(MessageDeleted(event)),
    onMessageDeleteBulk: (event) => messageBus.emit(MessagesDeletedBulk(event)),
    onMessageReactionChange: (channelId, messageId) => messageBus.emit(
      MessageReactionsChanged(channelId: channelId, messageId: messageId),
    ),
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

@Riverpod(keepAlive: true)
Raw<StreamSubscription<GatewayState>?> gatewayStateListener(Ref ref) {
  final connection = ref.watch(gatewayConnectionProvider);

  final subscription = connection.stateChanges.listen((state) {
    final reachable = ref.read(serverReachableProvider.notifier);
    switch (state) {
      case GatewayState.connected:
        reachable.setReachable(value: true);
      case GatewayState.disconnected:
        reachable.setReachable(value: false);
        ref.read(guildSyncProvider.notifier).clearAll();
      case GatewayState.connecting:
      case GatewayState.reconnecting:
        break;
    }
  });

  ref.onDispose(subscription.cancel);
  return subscription;
}

/// Monitors network connectivity and triggers immediate gateway reconnect
/// when the device comes back online.
@Riverpod(keepAlive: true)
Raw<StreamSubscription<List<ConnectivityResult>>?> connectivityListener(
  Ref ref,
) {
  final connection = ref.watch(gatewayConnectionProvider);

  final subscription = Connectivity().onConnectivityChanged.listen((results) {
    final hasConnection = results.any((r) => r != ConnectivityResult.none);

    if (hasConnection && connection.state == GatewayState.disconnected) {
      talker.info('[Gateway] Network restored, reconnecting immediately');
      unawaited(connection.connect());
    }
  });

  ref.onDispose(subscription.cancel);
  return subscription;
}
