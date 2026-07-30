import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class GuildDiscoveryErrorState extends StatelessWidget {
  const GuildDiscoveryErrorState({required this.onRetry, super.key});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s4),
        child: FluxerButton.secondary(
          label: l10n.retry,
          fitContent: true,
          onPressed: onRetry,
        ),
      ),
    );
  }
}
