import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DiscoveryHeader extends StatelessWidget {
  const DiscoveryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final textStyles = context.textStyles;
    final l10n = FluxerLocalizations.of(context);
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        border: Border(
          bottom: BorderSide(color: colors.backgroundHeaderSecondary),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: <Widget>[
          PhosphorIcon(
            PhosphorIconsFill.compass,
            color: colors.textPrimary,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            l10n.discoveryExplore,
            style: textStyles.heading.copyWith(
              fontSize: 16,
              color: colors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
