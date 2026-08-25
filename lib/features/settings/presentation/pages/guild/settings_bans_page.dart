import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_bans_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/bans/guild_bans_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_bans_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsBansPage extends ConsumerWidget {
  const SettingsBansPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildBansState> bansAsync = ref.watch(
      guildBansProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.bans,
      body: GuildSettingsAsyncBody<GuildBansState>(
        value: bansAsync,
        usesSettingsSheet: true,
        data: (GuildBansState state) =>
            GuildBansWidget(guildId: guildId, state: state),
      ),
    );
  }
}
