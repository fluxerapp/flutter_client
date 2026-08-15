import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/members/presentation/widgets/guild_members_mobile_list_view.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:material_ui/material_ui.dart';

class SettingsMembersPage extends ConsumerWidget {
  const SettingsMembersPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.members,
      body: GuildMembersMobileListView(guildId: guildId),
    );
  }
}
