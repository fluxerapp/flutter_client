import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_override_scope.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_mode.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class ThemeColorsPreviewTheme extends ConsumerWidget {
  const ThemeColorsPreviewTheme({
    required this.editingMode,
    required this.child,
    super.key,
  });

  final FluxerThemeMode editingMode;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themePref = ref.watch(themePreferenceProvider);
    final colors = themePref.colorThemeForMode(editingMode);
    final textStyles = FluxerTextTheme.fromColors(colors);

    return FluxerColorOverrideScope(
      colors: colors,
      textStyles: textStyles,
      child: child,
    );
  }
}
