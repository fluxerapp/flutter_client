import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/providers/app/startup_gateway_fallback_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_provider.dart';
import 'package:fluxer_app/core/providers/gateway/gateway_ready_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/dm/providers/dm_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/guilds/providers/organized_guild_list_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';

Future<void> signOutCurrentAccount(
  ProviderContainer container, {
  bool keepInstance = false,
}) async {
  try {
    final String userId = container.read(currentUserIdProvider) ?? '';

    await container.read(gatewayConnectionProvider).disconnect();
    container.read(gatewayReadyProvider.notifier).reset();

    container
      ..invalidate(gatewayConnectionProvider)
      ..invalidate(gatewayEventListenerProvider)
      ..invalidate(gatewayStateListenerProvider)
      ..invalidate(gatewayForegroundListenerProvider)
      ..invalidate(gatewayReconnectBannerListenerProvider)
      ..invalidate(gatewayReconnectBannerProvider)
      ..invalidate(gatewayConnectionFailedProvider)
      ..invalidate(startupGatewayFallbackProvider)
      ..invalidate(connectivityListenerProvider)
      ..invalidate(typingIndicatorsProvider)
      ..invalidate(voiceStatesMapProvider)
      ..invalidate(activeCallsProvider)
      ..invalidate(outgoingVoiceCallInitiatorProvider)
      ..invalidate(inviteCacheProvider)
      ..invalidate(currentUserIdProvider)
      ..invalidate(dmViewModelProvider)
      ..invalidate(guildListViewModelProvider)
      ..invalidate(organizedGuildListProvider)
      ..invalidate(folderExpandedStateProvider)
      ..invalidate(channelListViewModelProvider)
      ..invalidate(chatViewModelProvider)
      ..invalidate(userSettingsViewModelProvider)
      ..invalidate(loginViewModelProvider);

    await container
        .read(accountManagerProvider.notifier)
        .signOut(userId, keepInstance: keepInstance);
  } finally {
    container
        .read(accountClosureInFlightProvider.notifier)
        .setInFlight(value: false);
  }
}
