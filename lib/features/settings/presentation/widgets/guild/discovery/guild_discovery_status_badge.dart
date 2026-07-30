import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GuildDiscoveryStatusBadge extends StatelessWidget {
  const GuildDiscoveryStatusBadge({required this.status, super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor;
    final Color textColor;
    switch (status) {
      case DiscoveryApplicationStatus.pending:
        backgroundColor = context.colors.accentWarning.withValues(alpha: 0.15);
        textColor = context.colors.accentWarning;
      case DiscoveryApplicationStatus.approved:
        backgroundColor = context.colors.statusOnline.withValues(alpha: 0.15);
        textColor = context.colors.statusOnline;
      case DiscoveryApplicationStatus.rejected:
      case DiscoveryApplicationStatus.removed:
        backgroundColor = context.colors.statusDanger.withValues(alpha: 0.15);
        textColor = context.colors.statusDanger;
      default:
        backgroundColor = context.colors.backgroundTertiary;
        textColor = context.colors.textSecondary;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String label = switch (status) {
      DiscoveryApplicationStatus.pending =>
        l10n.guildSettingsDiscoveryStatusPending,
      DiscoveryApplicationStatus.approved =>
        l10n.guildSettingsDiscoveryStatusApproved,
      DiscoveryApplicationStatus.rejected =>
        l10n.guildSettingsDiscoveryStatusRejected,
      DiscoveryApplicationStatus.removed =>
        l10n.guildSettingsDiscoveryStatusRemoved,
      _ => status,
    };
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.layout.s2,
        vertical: context.layout.s1,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: context.textStyles.smallText.copyWith(
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
