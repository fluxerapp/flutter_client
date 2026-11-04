import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_avatar.dart';
import 'package:fluxer_app/features/settings/presentation/guild_settings_modal.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildOwnershipWarningSheet extends StatelessWidget {
  const GuildOwnershipWarningSheet({required this.ownedGuilds, super.key});

  final List<Guild> ownedGuilds;

  static Future<void> show(
    BuildContext context, {
    required List<Guild> ownedGuilds,
  }) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(
        context,
      ).dangerZoneDeleteCannotDeleteAccount,
      useRootNavigator: true,
      builder: (_, _) => GuildOwnershipWarningSheet(ownedGuilds: ownedGuilds),
    );
  }

  void _openGuildSettings(BuildContext context, Guild guild) {
    final NavigatorState root = Navigator.of(context, rootNavigator: true)
      ..popUntil((Route<dynamic> route) => route.isFirst);
    unawaited(GuildSettingsModal.show(root.context, guildId: guild.id));
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final FluxerColorTheme colors = context.colors;
    final layout = context.layout;
    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.dangerZoneDeleteOwnsCommunitiesList,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          FluxerMenuGroup(
            children: [
              for (final Guild guild in ownedGuilds)
                FluxerBottomSheetSubmenuItem(
                  label: guild.name,
                  leading: GuildBottomSheetAvatar(guild: guild),
                  onTap: () => _openGuildSettings(context, guild),
                ),
            ],
          ),
          SizedBox(height: layout.s4),
          Text(
            l10n.dangerZoneDeleteOwnedCommunitiesHelp,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
