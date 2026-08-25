import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_settings_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/discovery/guild_discovery_settings_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_discovery_settings_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsDiscoveryPage extends ConsumerWidget {
  const SettingsDiscoveryPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildDiscoverySettingsState> discoveryAsync = ref.watch(
      guildDiscoverySettingsProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.discovery,
      body: GuildSettingsAsyncBody<GuildDiscoverySettingsState>(
        value: discoveryAsync,
        usesSettingsSheet: true,
        data: (GuildDiscoverySettingsState state) =>
            GuildDiscoverySettingsWidget(guildId: guildId, state: state),
      ),
    );
  }
}
