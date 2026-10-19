import 'dart:async';

import 'package:fluxer_app/core/permissions/channel_effective_permissions.dart';
import 'package:fluxer_app/core/permissions/channel_permission_cache_provider.dart';
import 'package:fluxer_app/core/providers/gateway_ready_provider.dart';
import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'route_warmup_listener_provider.g.dart';

@Riverpod(keepAlive: true)
void routeWarmupListener(Ref ref) {
  void warmActiveChannelBits(String? channelId) {
    if (channelId == null || channelId.isEmpty) {
      return;
    }
    ref.invalidate(channelMessagePermissionsProvider(channelId));
    unawaited(
      ref
          .read(channelPermissionCacheProvider.notifier)
          .rebuildChannel(channelId),
    );
  }

  void rebuildPermissionsAfterReady() {
    final String? guildId = ref.read(contextualGuildIdProvider);
    final String? channelId = ref.read(activeChannelIdProvider);
    warmActiveChannelBits(channelId);
    unawaited(
      ref
          .read(channelPermissionCacheProvider.notifier)
          .rebuildAfterReady(
            priorityGuildId: guildId,
            priorityChannelId: channelId,
          ),
    );
    ref
      ..invalidate(effectiveGuildChannelPermissionBitsProvider)
      ..invalidate(channelLocalGuildChannelPermissionBitsProvider);
  }

  void syncActiveGuildChannels() {
    final String? guildId = ref.read(contextualGuildIdProvider);
    if (guildId == null || guildId.isEmpty) {
      return;
    }
    ref
        .read(channelListViewModelProvider.notifier)
        .ensureChannelsLoaded(guildId);
  }

  ref.listen<int>(gatewayFullRecoveryProvider, (int? previous, int next) {
    if (next <= 0) {
      return;
    }
    rebuildPermissionsAfterReady();
    syncActiveGuildChannels();
  });

  ref.listen<bool>(gatewayReadyProvider, (bool? previous, bool next) {
    if ((previous ?? false) || !next) {
      return;
    }
    syncActiveGuildChannels();
    warmActiveChannelBits(ref.read(activeChannelIdProvider));
  });

  ref.listen<String?>(activeGuildIdProvider, (String? previous, String? next) {
    if (next == null || next.isEmpty || previous == next) {
      return;
    }
    ref.read(channelListViewModelProvider.notifier).ensureChannelsLoaded(next);
    warmActiveChannelBits(ref.read(activeChannelIdProvider));
  });

  ref.listen<String?>(activeChannelIdProvider, (
    String? previous,
    String? next,
  ) {
    if (next == null || next.isEmpty || previous == next) {
      return;
    }
    warmActiveChannelBits(next);
  });
}
