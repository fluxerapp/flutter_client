import 'package:flutter/material.dart';
import 'package:fluxer_app/core/router/route_kind.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/guild_sidebar.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_sidebar_column.dart';
import 'package:fluxer_app/features/dm/presentation/widgets/dm_list.dart';
import 'package:fluxer_app/features/favorites/presentation/favorites_sidebar.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/app_bottom_nav_bar.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_call_bar.dart';

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

Widget desktopShellScaffold({
  required BuildContext context,
  required String shellLocation,
  required Widget navigationShell,
}) {
  final layout = context.layout;
  final leftSidebarsWidth = layout.guildListWidth + layout.sidebarWidth;
  return Row(
    children: <Widget>[
      SizedBox(
        width: leftSidebarsWidth,
        child: Column(
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
      ),
      VerticalDivider(
        width: 1,
        thickness: 1,
        color: context.colors.backgroundModifierAccent,
      ),
      Expanded(child: navigationShell),
    ],
  );
}

Widget mobileSidebarForLocation(BuildContext context, String location) {
  return ColoredBox(
    color: context.colors.channelSidebarBackground,
    child: SafeArea(
      bottom: false,
      child: Row(
        children: <Widget>[
          const GuildNavbar(),
          Expanded(child: desktopSidebarForLocation(context, location)),
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
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      const VoiceCallBar(),
      Divider(height: 1, color: context.colors.borderColor),
      AppBottomNavBar(
        currentIndex: currentIndex,
        onBranchSelected: onBranchSelected,
      ),
    ],
  );
}
