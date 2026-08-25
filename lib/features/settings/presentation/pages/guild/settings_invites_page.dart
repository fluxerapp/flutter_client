import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_invites_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/invites/guild_invites_widget.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_invites_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsInvitesPage extends ConsumerWidget {
  const SettingsInvitesPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildInvitesState> invitesAsync = ref.watch(
      guildInvitesProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.invites,
      body: GuildSettingsAsyncBody<GuildInvitesState>(
        value: invitesAsync,
        usesSettingsSheet: true,
        data: (GuildInvitesState state) =>
            GuildInvitesWidget(guildId: guildId, state: state),
      ),
    );
  }
}
