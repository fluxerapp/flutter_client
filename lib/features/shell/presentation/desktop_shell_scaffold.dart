import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_sidebar_column.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list.dart';
import 'package:fluxer_app/features/favorites/presentation/favorites_sidebar.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/presentation/app_bottom_nav_bar.dart';
import 'package:fluxer_app/features/shell/presentation/resizable_shell_sidebar_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_bar.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_phone_surface.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/material_ui.dart';

Widget desktopSidebarForLocation(BuildContext context, String location) {
  if (isDiscoverRoute(location)) {
    return const DiscoverySidebarColumn();
  }
  if (location.startsWith('/channels/@me')) {
    return const DMList();
  }
  if (location.startsWith('/channels/@favorites')) {
    return const FavoritesSidebar();
  }
  return const GuildSidebar();
}

class WideShellScaffold extends ConsumerWidget {
  const WideShellScaffold({
    required this.shellLocation,
    required this.navigationShell,
    super.key,
  });

  final String shellLocation;
  final Widget navigationShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool immersiveVoice = ref.watch(handheldVoiceImmersiveProvider);
    final bool fullScreenVoice =
        isHandheldVoiceOverlay(context) && immersiveVoice;
    final Widget body = fullScreenVoice
        ? navigationShell
        : desktopShellScaffold(
            context: context,
            shellLocation: shellLocation,
            navigationShell: navigationShell,
          );
    return Scaffold(
      backgroundColor: fullScreenVoice
          ? context.colors.chatBackground
          : context.colors.backgroundPrimary,
      resizeToAvoidBottomInset: false,
      body: VoiceCallPhoneSurface(active: fullScreenVoice, child: body),
    );
  }
}

Widget desktopShellScaffold({
  required BuildContext context,
  required String shellLocation,
  required Widget navigationShell,
}) {
  return ResizableShellSidebarLayout(
    leftPanel: Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              const GuildNavbar(),
              Expanded(
                child: desktopSidebarForLocation(context, shellLocation),
              ),
            ],
          ),
        ),
        UserArea(onSettingsTap: () => UserSettingsModal.show(context)),
      ],
    ),
    rightChild: KeyedSubtree(
      key: ValueKey<String>(shellLocation),
      child: navigationShell,
    ),
  );
}

Widget mobileSidebarForLocation(
  BuildContext context,
  String location, {
  double peekContentInset = 0,
}) {
  final Widget sidebar = desktopSidebarForLocation(context, location);
  return ColoredBox(
    color: context.colors.channelSidebarBackground,
    child: SafeArea(
      bottom: false,
      child: Row(
        children: <Widget>[
          const GuildNavbar(),
          Expanded(
            child: peekContentInset > 0
                ? Padding(
                    padding: EdgeInsetsDirectional.only(end: peekContentInset),
                    child: sidebar,
                  )
                : sidebar,
          ),
        ],
      ),
    ),
  );
}

Widget mobileBottomNav({
  required BuildContext context,
  required int currentIndex,
  required void Function(int index) onBranchSelected,
}) {
  final bool hostedUi = usesIphoneDuoHostedUi(context);
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const VoiceCallBar(),
      if (!hostedUi) ...<Widget>[
        Divider(height: 1, color: context.colors.borderColor),
        AppBottomNavBar(
          currentIndex: currentIndex,
          onBranchSelected: onBranchSelected,
        ),
      ],
    ],
  );
}
