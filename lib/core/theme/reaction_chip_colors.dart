import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/material_ui.dart';

typedef SelectedReactionChipColors = ({
  Color background,
  Color border,
  Color foreground,
});

SelectedReactionChipColors selectedReactionChipColorsFor(
  FluxerColorTheme colors, {
  required Brightness brightness,
  Color? surface,
}) {
  if (brightness == Brightness.light) {
    return (
      background: Color.lerp(
        surface ?? colors.backgroundPrimary,
        colors.brandPrimary,
        0.12,
      )!,
      border: colors.brandPrimary.withValues(alpha: 0.45),
      foreground: colors.brandPrimary,
    );
  }
  return (
    background: Color.lerp(
      surface ?? colors.backgroundSecondary,
      colors.brandPrimary,
      0.36,
    )!,
    border: colors.brandPrimary,
    foreground: colors.textOnBrandPrimary,
  );
}

SelectedReactionChipColors selectedReactionChipColors(
  BuildContext context, {
  Color? surface,
}) {
  return selectedReactionChipColorsFor(
    context.colors,
    brightness: Theme.of(context).brightness,
    surface: surface,
  );
}
