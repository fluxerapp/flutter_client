import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_bottom_sheet_avatar.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildOwnershipWarningSheet extends StatelessWidget {
  const GuildOwnershipWarningSheet({required this.ownedGuilds, super.key});

  final List<Guild> ownedGuilds;

  static const int _maxDisplayedGuilds = 3;

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

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final FluxerColorTheme colors = context.colors;
    final layout = context.layout;
    final List<Guild> displayedGuilds = ownedGuilds
        .take(_maxDisplayedGuilds)
        .toList(growable: false);
    final int remainingCount = ownedGuilds.length - _maxDisplayedGuilds;
    final String settingsPath =
        '${l10n.guildSettingsCommunitySettings} > ${l10n.guildMenuSettingsGeneral}';
    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dangerZoneDeleteOwnsCommunities,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          ...displayedGuilds.map(
            (Guild guild) => _buildGuildItem(context, guild),
          ),
          if (remainingCount > 0)
            Padding(
              padding: EdgeInsets.only(top: layout.s2),
              child: Text(
                l10n.dangerZoneDeleteAndXMore(remainingCount),
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textSecondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          SizedBox(height: layout.s4),
          Text(
            l10n.dangerZoneDeleteTransferInstructions(settingsPath),
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
        ],
      ),
    );
  }

  Widget _buildGuildItem(BuildContext context, Guild guild) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          GuildBottomSheetAvatar(guild: guild),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              guild.name,
              style: context.textStyles.channelName,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
