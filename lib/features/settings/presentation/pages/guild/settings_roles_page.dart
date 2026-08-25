import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/roles/guild_roles_settings_widget.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsRolesPage extends ConsumerWidget {
  const SettingsRolesPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.roles,
      body: GuildRolesSettingsWidget(guildId: guildId),
    );
  }
}
