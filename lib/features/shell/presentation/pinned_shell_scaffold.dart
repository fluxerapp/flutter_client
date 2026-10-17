import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/router/route_state_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/shell/foldable/crease_overlay_layout.dart';
import 'package:fluxer_app/features/shell/foldable/device_fold_posture.dart';
import 'package:fluxer_app/features/shell/foldable/retargeting_scalar.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/navigation/shell_layout_mode.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_chat_back_scope.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_home_utility_shell.dart';
import 'package:fluxer_app/features/shell/presentation/mobile_main_tab_shell.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_phone_surface.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:go_router/go_router.dart';

class PinnedMobileShellScaffold extends ConsumerWidget {
  const PinnedMobileShellScaffold({
    required this.mode,
    required this.navigationShell,
    required this.shellContent,
    required this.bottomNav,
    super.key,
  });

  final ShellLayoutMode mode;
  final StatefulNavigationShell navigationShell;
  final Widget shellContent;
  final Widget bottomNav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String shellLocation = ref.watch(shellLocationProvider);
    final bool handheld = isHandheldVoiceOverlay(context);
    final bool immersiveVoice = ref.watch(handheldVoiceImmersiveProvider);
    final bool fullScreenVoice = handheld && immersiveVoice;
    final FluxerLayoutTheme layout = context.layout;
    final Size size = MediaQuery.sizeOf(context);
    final DeviceFoldPosture posture = deviceFoldPostureOf(context);
    final bool splitAtHinge =
        posture.splitSidebarAtHinge && posture.hingeBounds != null;
    final bool isOnChatRoute = _isChatRoute(shellLocation);
    final Widget channelList = desktopSidebarForLocation(
      context,
      shellLocation,
    );
    const Widget contentBottomNav = SizedBox.shrink();

    final Widget content = switch (mode) {
      ShellLayoutMode.channelDrawer => navigationShell,
      ShellLayoutMode.mainTab => MobileMainTabShell(
        navigationShell: shellContent,
        bottomNav: contentBottomNav,
      ),
      ShellLayoutMode.homeUtility => MobileHomeUtilityShell(
        shellLocation: shellLocation,
        navigationShell: shellContent,
        bottomNav: contentBottomNav,
      ),
    };

    final double compactPanelWidth = pinnedLeftPanelWidth(size, layout);

    Widget buildLeftColumn(double panelWidth) {
      return SizedBox(
        width: panelWidth,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  const GuildNavbar(),
                  Expanded(child: channelList),
                ],
              ),
            ),
            if (!usesIphoneDuoHostedUi(context)) bottomNav,
          ],
        ),
      );
    }

    Widget buildBody(double leftPanelWidth) {
      return Row(
        children: <Widget>[
          buildLeftColumn(leftPanelWidth),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: context.colors.backgroundModifierAccent,
          ),
          Expanded(
            child: KeyedSubtree(
              key: ValueKey<String>(shellLocation),
              child: mode == ShellLayoutMode.channelDrawer
                  ? content
                  : Column(children: <Widget>[Expanded(child: content)]),
            ),
          ),
        ],
      );
    }

    final Widget body;
    if (fullScreenVoice) {
      body = content;
    } else if (splitAtHinge) {
      final double splitTarget = pinnedSidebarWidthForPosture(
        window: size,
        layout: layout,
        posture: posture,
      );
      body = RetargetingScalar(
        target: splitTarget,
        builder: (BuildContext context, double leftWidth) {
          return buildBody(leftWidth);
        },
      );
    } else {
      body = buildBody(compactPanelWidth);
    }

    return MobileChatBackScope(
      child: Scaffold(
        backgroundColor: fullScreenVoice
            ? context.colors.chatBackground
            : isOnChatRoute
            ? context.colors.chatInputBackground
            : context.colors.backgroundPrimary,
        resizeToAvoidBottomInset: false,
        body: VoiceCallPhoneSurface(active: fullScreenVoice, child: body),
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
