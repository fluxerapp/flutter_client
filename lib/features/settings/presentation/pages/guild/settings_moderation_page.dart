import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_details.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/moderation/guild_moderation_widget.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:material_ui/material_ui.dart';

class SettingsModerationPage extends ConsumerWidget {
  const SettingsModerationPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildSettingsDetails> guildAsync = ref.watch(
      guildSettingsModerationProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.moderation,
      body: GuildSettingsAsyncBody<GuildSettingsDetails>(
        value: guildAsync,
        usesSettingsSheet: true,
        data: (GuildSettingsDetails details) =>
            GuildModerationWidget(guildId: guildId, details: details),
      ),
    );
  }
}
