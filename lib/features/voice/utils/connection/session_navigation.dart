import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/router/route_names.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/features/favorites/utils/favorites_shell_navigation.dart';
import 'package:fluxer_app/features/shell/navigation/drawer_navigation_coordinator.dart';
import 'package:fluxer_app/features/shell/navigation/handheld_voice_overlay.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/utils/shell_popup_navigation.dart';
import 'package:fluxer_app/features/voice/providers/voice_call_overlay_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
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
  unawaited(
    DrawerNavigationCoordinator.openGuildChatAfterMinimizeVoice(
      container,
      guildId,
      excludeVoiceChannelId: voice.channelId,
    ),
  );
}

Future<void> endPhoneVoiceCall({
  required BuildContext context,
  required WidgetRef ref,
}) async {
  final ProviderContainer container = ref.container;
  if (!isHandheldVoiceOverlay(context)) {
    await container.read(voiceSessionProvider.notifier).leaveVoice();
    return;
  }
  final VoiceSessionState voiceBeforeLeave = ref.read(voiceSessionProvider);
  final String location = ref.read(currentLocationProvider);
  final String? guildId = voiceBeforeLeave.guildId;
  final bool guildCall = guildId != null && guildId.isNotEmpty;
  final bool returnsToList =
      isFavoritesChannelRoute(location) ||
      (guildCall && !shellShowsConcurrentChannelList(context));

  await container.read(voiceCallOverlayProvider.notifier).playPhoneExit();
  if (returnsToList) {
    await _leaveVoiceToChannelList(container);
    return;
  }
  await container.read(voiceSessionProvider.notifier).leaveVoice();
  if (!guildCall) {
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

Future<void> leaveVoiceFromCallView({
  required BuildContext context,
  required WidgetRef ref,
}) {
  if (ref.read(voicePipOnSessionCallRouteProvider)) {
    return endPhoneVoiceCall(context: context, ref: ref);
  }
  return ref.read(voiceSessionProvider.notifier).leaveVoice();
}

Future<void> _leaveVoiceToChannelList(ProviderContainer container) async {
  final ProviderSubscription<bool> subscription = container.listen<bool>(
    voiceSessionProvider.select((VoiceSessionState s) => s.isInVoice),
    (bool? previous, bool next) {
      if (!next) {
        DrawerNavigationCoordinator.revealDrawer(container);
      }
    },
    fireImmediately: true,
  );
  try {
    await container.read(voiceSessionProvider.notifier).leaveVoice();
  } finally {
    subscription.close();
  }
}
