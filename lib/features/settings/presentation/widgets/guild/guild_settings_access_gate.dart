import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class GuildSettingsAccessGate extends ConsumerWidget {
  const GuildSettingsAccessGate({
    required this.guildId,
    required this.tab,
    required this.child,
    super.key,
  });

  final String guildId;
  final GuildSettingsTab tab;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(guildId),
    );
    final AsyncValue<Guild?> guildValue = ref.watch(guildByIdProvider(guildId));
    final Guild? guild = guildValue.value;
    final bool isVisible = isGuildSettingsTabVisible(
      tab: tab,
      permissions: permissions,
      guild: guild,
      isTouchPrimary: isTouchPrimaryInput(ref),
    );
    if (!isVisible) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(context.layout.s4),
          child: Text(
            FluxerLocalizations.of(context).guildSettingsNoPermission,
            style: TextStyle(color: context.colors.textPrimaryMuted),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }
    return child;
  }
}
