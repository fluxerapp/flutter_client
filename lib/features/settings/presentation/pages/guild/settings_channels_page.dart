import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/channels/guild_channels_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsChannelsPage extends ConsumerWidget {
  const SettingsChannelsPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.channels,
      body: GuildChannelsSettingsWidget(guildId: guildId, showFab: true),
    );
  }
}
