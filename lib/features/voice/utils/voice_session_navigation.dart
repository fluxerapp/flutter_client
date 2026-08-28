import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/navigate_to_content.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:go_router/go_router.dart';

void navigateToActiveVoiceSession(
  BuildContext context, {
  required VoiceSessionState voice,
}) {
  final String? channelId = voice.channelId;
  if (channelId == null || channelId.isEmpty) {
    return;
  }
  final bool isGuild = voice.guildId != null && voice.guildId!.isNotEmpty;
  if (isGuild) {
    final String? guildId = voice.guildId;
    if (guildId == null || guildId.isEmpty) {
      return;
    }
    navigateToContent(context, RoutePaths.guildChannel(guildId, channelId));
    return;
  }
  unawaited(context.push(RoutePaths.dmChannelCall(channelId)));
}

String voiceCallMinimizePath({required VoiceSessionState voice}) {
  final String? guildId = voice.guildId;
  if (guildId != null && guildId.isNotEmpty) {
    return RoutePaths.guild(guildId);
  }
  final String? channelId = voice.channelId;
  if (channelId != null && channelId.isNotEmpty) {
    return RoutePaths.dmChannel(channelId);
  }
  return RoutePaths.me;
}

void goToPhoneVoiceChannelList({
  required BuildContext context,
  required ProviderContainer container,
  required VoiceSessionState voice,
}) {
  final String? guildId = voice.guildId;
  final bool isGuild = guildId != null && guildId.isNotEmpty;
  if (!isGuild && context.canPop()) {
    context.pop();
    DrawerNavigationCoordinator.closeDrawer(container);
    return;
  }
  if (isGuild) {
    DrawerNavigationCoordinator.openGuildChannelList(container, guildId);
    return;
  }
  DrawerNavigationCoordinator.navigateToContent(container, RoutePaths.me);
}

void minimizePhoneVoiceCall({
  required BuildContext context,
  required ProviderContainer container,
}) {
  goToPhoneVoiceChannelList(
    context: context,
    container: container,
    voice: container.read(voiceSessionProvider),
  );
}

Future<void> endPhoneVoiceCall({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  if (isPhoneVoiceOverlay(context)) {
    await ref.read(voiceCallOverlayProvider.notifier).playPhoneExit();
  }
  if (!context.mounted) {
    return;
  }
  if (isMobileLayout(context)) {
    final String location = ref.read(currentLocationProvider);
    if (isFavoritesChannelRoute(location)) {
      returnToFavoritesList(ref);
    } else {
      goToPhoneVoiceChannelList(
        context: context,
        container: ref.container,
        voice: ref.read(voiceSessionProvider),
      );
    }
  }
  await ref.read(voiceSessionProvider.notifier).leaveVoice();
}
