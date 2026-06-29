import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/overview/guild_overview_widget.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';

class SettingsOverviewPage extends ConsumerWidget {
  const SettingsOverviewPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildSettingsDetails> guildAsync = ref.watch(
      guildSettingsOverviewProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.overview,
      body: GuildSettingsAsyncBody<GuildSettingsDetails>(
        value: guildAsync,
        usesSettingsSheet: true,
        data: (GuildSettingsDetails details) =>
            GuildOverviewWidget(guildId: guildId, details: details),
      ),
    );
  }
}
