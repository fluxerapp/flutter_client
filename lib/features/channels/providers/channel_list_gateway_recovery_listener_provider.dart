import 'package:fluxer_app/core/providers/gateway_session_recovery_provider.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'channel_list_gateway_recovery_listener_provider.g.dart';

@Riverpod(keepAlive: true)
void channelListGatewayRecoveryListener(Ref ref) {
  ref.listen<int>(gatewaySessionRecoveryProvider, (int? previous, int next) {
    if (next <= 0) {
      return;
    }
    final String? guildId = ref.read(contextualGuildIdProvider);
    if (guildId == null || guildId.isEmpty) {
      return;
    }
    ref.read(channelListViewModelProvider.notifier).loadActiveGuild(guildId);
    ref.read(guildSyncProvider.notifier).syncIfNeeded(guildId, force: true);
  });
}
