import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const String _kFallbackErrorMessage = 'An error occurred';

/// Placeholder shown in release when a widget fails to build
class FluxerRenderErrorPlaceholder extends StatelessWidget {
  const FluxerRenderErrorPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerColorTheme colors = _resolveColors(context);
    final String message = _resolveMessage(context);
    final TextStyle textStyle = _resolveTextStyle(context, colors);
    return Semantics(
      label: message,
      child: ColoredBox(
        color: colors.backgroundPrimary,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                PhosphorIcon(
                  PhosphorIconsFill.bug,
                  size: 48,
                  color: colors.textPrimaryMuted,
                ),
                const SizedBox(height: 12),
                Text(message, style: textStyle, textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }

  FluxerColorTheme _resolveColors(BuildContext context) {
    try {
      return Theme.of(context).extension<FluxerColorTheme>() ??
          buildDarkColorTheme();
    } on Object {
      return buildDarkColorTheme();
    }
  }

  String _resolveMessage(BuildContext context) {
    final FluxerLocalizations? l10n = Localizations.of<FluxerLocalizations>(
      context,
      FluxerLocalizations,
    );
    return l10n?.genericError ?? _kFallbackErrorMessage;
  }

  TextStyle _resolveTextStyle(BuildContext context, FluxerColorTheme colors) {
    try {
      final FluxerTextTheme? textTheme = Theme.of(
        context,
      ).extension<FluxerTextTheme>();
      if (textTheme != null) {
        return textTheme.bodySmall.copyWith(color: colors.textPrimaryMuted);
      }
    } on Object {
      // Fall through to default text style.
    }
    return TextStyle(fontSize: 14, color: colors.textPrimaryMuted);
  }
}
