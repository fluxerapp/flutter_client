import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_audit_log_state.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/audit_log/guild_audit_log_widget.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_page_shell.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_audit_log_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class SettingsAuditLogPage extends ConsumerWidget {
  const SettingsAuditLogPage({required this.guildId, super.key});

  final String guildId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<GuildAuditLogState> auditLogAsync = ref.watch(
      guildAuditLogProvider(guildId),
    );
    return GuildSettingsPageShell(
      guildId: guildId,
      tab: GuildSettingsTab.auditLog,
      body: GuildSettingsAsyncBody<GuildAuditLogState>(
        value: auditLogAsync,
        usesSettingsSheet: true,
        data: (GuildAuditLogState state) =>
            GuildAuditLogWidget(guildId: guildId, state: state),
      ),
    );
  }
}
