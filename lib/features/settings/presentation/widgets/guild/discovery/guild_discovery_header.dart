import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GuildDiscoveryHeader extends StatelessWidget {
  const GuildDiscoveryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (!isMobile) ...<Widget>[
          Text(
            l10n.guildMenuSettingsDiscovery,
            style: context.textStyles.heading.copyWith(
              fontSize: 18,
              color: context.colors.textChat,
            ),
          ),
          SizedBox(height: context.layout.s1),
        ],
        Text(
          l10n.guildSettingsDiscoveryDescription,
          style: context.textStyles.bodyMedium.copyWith(
            color: context.colors.textPrimaryMuted,
          ),
        ),
      ],
    );
  }
}
