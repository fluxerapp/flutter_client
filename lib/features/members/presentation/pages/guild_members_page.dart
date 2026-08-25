import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/members/presentation/widgets/guild_members_access_gate.dart';
import 'package:fluxer_app/features/members/presentation/widgets/guild_members_desktop_table.dart';
import 'package:fluxer_app/features/messaging/presentation/widgets/message_list_page_shell.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildMembersPage extends ConsumerWidget {
  const GuildMembersPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return MessageListPageShell(
      icon: PhosphorIcon(
        PhosphorIconsFill.users,
        size: 24,
        color: context.colors.textPrimaryMuted,
      ),
      title: l10n.guildMembersChannelListLabel,
      body: GuildMembersAccessGate(
        guildId: guildId,
        child: GuildMembersDesktopTable(guildId: guildId),
      ),
    );
  }
}
