import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class GuildAuditLogEmptyState extends StatelessWidget {
  const GuildAuditLogEmptyState({required this.l10n, super.key});

  final FluxerLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.layout.s8),
      child: Column(
        children: <Widget>[
          PhosphorIcon(
            PhosphorIconsFill.clipboardText,
            size: 40,
            color: context.colors.textPrimaryMuted,
          ),
          SizedBox(height: context.layout.s3),
          Text(
            l10n.guildSettingsAuditLogEmpty,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textChat,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: context.layout.s1),
          Text(
            l10n.guildSettingsAuditLogEmptyDescription,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
