import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_action_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddGuildLandingView extends StatelessWidget {
  const AddGuildLandingView({
    required this.onCreateTap,
    required this.onJoinTap,
    required this.onImportTap,
    super.key,
  });

  final VoidCallback onCreateTap;
  final VoidCallback onJoinTap;
  final VoidCallback onImportTap;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final textStyles = context.textStyles;
    final colors = context.colors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          l10n.addGuildModalLandingDescription,
          style: textStyles.bodySmall.copyWith(
            color: colors.textSecondary,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: <Widget>[
            Expanded(
              child: AddGuildActionButton(
                icon: PhosphorIconsBold.house,
                label: l10n.addGuildCreateCommunity,
                onTap: onCreateTap,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: AddGuildActionButton(
                icon: PhosphorIconsBold.link,
                label: l10n.addGuildJoinCommunity,
                onTap: onJoinTap,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        AddGuildActionButton(
          icon: PhosphorIconsBold.downloadSimple,
          label: l10n.addGuildImportDiscordTemplate,
          layout: AddGuildActionButtonLayout.row,
          onTap: onImportTap,
        ),
      ],
    );
  }
}
