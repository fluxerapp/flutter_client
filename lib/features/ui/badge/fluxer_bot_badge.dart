import 'package:flutter/material.dart';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class FluxerBotBadge extends StatelessWidget {
  const FluxerBotBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final label = FluxerLocalizations.of(context).userTagBot.toUpperCase();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
      decoration: BoxDecoration(
        color: context.colors.brandPrimary,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: context.colors.textPrimary,
          fontSize: 9,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}