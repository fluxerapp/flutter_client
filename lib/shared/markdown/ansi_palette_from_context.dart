import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

AnsiPalette? ansiPaletteFromContext(BuildContext? context) {
  if (context == null) {
    return null;
  }
  final colors = context.colors;
  final bool isDark = Theme.of(context).brightness == Brightness.dark;
  final double saturationFactor = ProviderScope.containerOf(
    context,
  ).read(themePreferenceProvider).saturationFactor;
  return AnsiPalette.fromThemeTokens(
    isDark: isDark,
    textCode: colors.textCode,
    bgCodeBlock: colors.bgCodeBlock,
    textPrimary: colors.textPrimary,
    textSecondary: colors.textSecondary,
    textTertiary: colors.textTertiary,
    saturationFactor: saturationFactor,
  );
}
