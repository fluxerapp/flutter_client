import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:go_router/go_router.dart';

bool isHandheldVoiceOverlayForContainer(ProviderContainer container) {
  final BuildContext? context = container
      .read(fluxerRouterProvider)
      .routerDelegate
      .navigatorKey
      .currentContext;
  if (context == null) {
    return false;
  }
  return isHandheldVoiceOverlay(context);
}

void navigateToActiveVoiceSession(
  BuildContext context, {
  required VoiceSessionState voice,
}) {
  final String? channelId = voice.channelId;
  if (channelId == null || channelId.isEmpty) {
    return;
  }
  popShellCoveringPages();
  final ProviderContainer container = ProviderScope.containerOf(context);
  final String? guildId = voice.guildId;
  if (guildId != null && guildId.isNotEmpty) {
    DrawerNavigationCoordinator.openImmersiveGuildVoiceCall(
      container,
      guildId: guildId,
      channelId: channelId,
    );
    return;
  }
  DrawerNavigationCoordinator.openImmersiveDmVoiceCall(
    container,
    channelId: channelId,
  );
}

void openHandheldImmersiveVoiceCallAfterJoin(
  ProviderContainer container, {
  required String? guildId,
  required String channelId,
}) {
  if (!isHandheldVoiceOverlayForContainer(container)) {
    return;
  }
  if (guildId != null && guildId.isNotEmpty) {
    DrawerNavigationCoordinator.openImmersiveGuildVoiceCall(
      container,
      guildId: guildId,
      channelId: channelId,
    );
    return;
  }
  DrawerNavigationCoordinator.openImmersiveDmVoiceCall(
    container,
    channelId: channelId,
  );
}

void minimizePhoneVoiceCall({
  required BuildContext context,
  required ProviderContainer container,
}) {
  final VoiceSessionState voice = container.read(voiceSessionProvider);
  final String? guildId = voice.guildId;
  if (guildId == null || guildId.isEmpty) {
    final GoRouter router = container.read(fluxerRouterProvider);
    if (router.canPop()) {
      router.pop();
    }
    DrawerNavigationCoordinator.closeDrawer(container);
    return;
  }
  DrawerNavigationCoordinator.openGuildChannelList(container, guildId);
}

Future<void> endPhoneVoiceCall({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final ProviderContainer container = ref.container;
  final VoiceSessionState voiceBeforeLeave = ref.read(voiceSessionProvider);
  final String location = ref.read(currentLocationProvider);
  final bool favoritesChannel = isFavoritesChannelRoute(location);
  final bool handheld = isHandheldVoiceOverlay(context);

  if (handheld) {
    await container.read(voiceCallOverlayProvider.notifier).playPhoneExit();
  }
  await container.read(voiceSessionProvider.notifier).leaveVoice();
  if (!handheld) {
    return;
  }
  if (favoritesChannel) {
    returnToFavoritesList(container);
    return;
  }
  final String? guildId = voiceBeforeLeave.guildId;
  if (guildId == null || guildId.isEmpty) {
    final GoRouter router = container.read(fluxerRouterProvider);
    final String? channelId = voiceBeforeLeave.channelId;
    if (channelId != null && location == RoutePaths.dmChannelCall(channelId)) {
      DrawerNavigationCoordinator.navigateToContent(
        container,
        RoutePaths.dmChannel(channelId),
      );
    } else if (router.canPop()) {
      router.pop();
    }
  }
  DrawerNavigationCoordinator.closeDrawer(container);
}
