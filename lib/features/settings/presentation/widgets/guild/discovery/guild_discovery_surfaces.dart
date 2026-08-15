import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:material_ui/material_ui.dart';

BoxDecoration guildDiscoveryCardDecoration(
  FluxerColorTheme colors,
  FluxerLayoutTheme layout,
) {
  return BoxDecoration(
    color: colors.backgroundSecondary,
    borderRadius: layout.radiusSm,
    border: Border.all(color: colors.backgroundHeaderSecondary),
  );
}
