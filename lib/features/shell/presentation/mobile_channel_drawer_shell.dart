import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/sidebar_drawer.dart';
import 'package:fluxer_app/features/shell/providers/shell_sidebar_width_provider.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_phone_surface.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/material_ui.dart';

class MobileChannelDrawerShell extends ConsumerWidget {
  const MobileChannelDrawerShell({
    required this.shellLocation,
    required this.navigationShell,
    required this.bottomNav,
    super.key,
  });

  final String shellLocation;
  final Widget navigationShell;
  final Widget bottomNav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isOnChatRoute = _isChatRoute(shellLocation);
    final bool handheld = isHandheldVoiceOverlay(context);
    final bool immersiveVoice = ref.watch(handheldVoiceImmersiveProvider);
    final bool fullScreenVoice = handheld && immersiveVoice;

    final bool compactWide = isCompactWideMobileLayout(context);
    final bool drawerLocked = isSidebarDrawerLockedForLocation(shellLocation);
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double peekWidth = math.min(
      mobileDrawerPeekWidth(
        context,
        channelSidebarWidth: watchResolvedShellChannelSidebarWidth(
          ref,
          context,
        ),
      ),
      screenWidth,
    );
    final double peekContentInset = compactWide && !drawerLocked
        ? math.max(0, screenWidth - peekWidth)
        : 0;
    final Widget sidebar = mobileSidebarForLocation(
      context,
      shellLocation,
      peekContentInset: peekContentInset,
    );

    final Widget drawer = SidebarDrawer(
      key: const ValueKey<String>('mobile-channel-drawer'),
      shellLocation: shellLocation,
      base: Offstage(
        offstage: fullScreenVoice,
        child: Column(
          children: <Widget>[
            Expanded(child: sidebar),
            bottomNav,
          ],
        ),
      ),
      slider: navigationShell,
    );

    return MobileChatBackScope(
      child: Scaffold(
        backgroundColor: fullScreenVoice
            ? context.colors.chatBackground
            : isOnChatRoute
            ? context.colors.chatInputBackground
            : context.colors.backgroundPrimary,
        resizeToAvoidBottomInset: false,
        body: VoiceCallPhoneSurface(active: fullScreenVoice, child: drawer),
      ),
    );
  }

  bool _isChatRoute(String location) {
    final RouteKind kind = classifyRoute(location);
    return kind == RouteKind.chat ||
        kind == RouteKind.guildMembers ||
        kind == RouteKind.dmCall;
  }
}
