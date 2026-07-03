import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/presentation/discovery_layout.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_sidebar_column.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';

class DiscoveryDesktopShell extends ConsumerWidget {
  const DiscoveryDesktopShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final layout = context.layout;
    final leftSidebarsWidth = layout.guildListWidth + layout.sidebarWidth;
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: Row(
        children: [
          SizedBox(
            width: leftSidebarsWidth,
            child: Column(
              children: [
                const Expanded(
                  child: Row(
                    children: [
                      GuildNavbar(),
                      Expanded(child: DiscoverySidebarColumn()),
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
          const Expanded(child: DiscoveryLayout()),
        ],
      ),
    );
  }
}
