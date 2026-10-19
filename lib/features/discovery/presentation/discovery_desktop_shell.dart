import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/presentation/discovery_layout.dart';
import 'package:fluxer_app/features/discovery/presentation/widgets/discovery_sidebar_column.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_navbar.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/shell/presentation/resizable_shell_sidebar_layout.dart';
import 'package:fluxer_app/features/shell/presentation/user_area.dart';
import 'package:fluxer_app/material_ui.dart';

class DiscoveryDesktopShell extends ConsumerWidget {
  const DiscoveryDesktopShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.backgroundPrimary,
      body: ResizableShellSidebarLayout(
        leftPanel: Column(
          children: <Widget>[
            const Expanded(
              child: Row(
                children: <Widget>[
                  GuildNavbar(),
                  Expanded(child: DiscoverySidebarColumn()),
                ],
              ),
            ),
            UserArea(onSettingsTap: () => UserSettingsModal.show(context)),
          ],
        ),
        rightChild: const DiscoveryLayout(),
      ),
    );
  }
}
