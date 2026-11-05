import 'package:cupertino_ui/cupertino_ui.dart'
    show CupertinoTheme, CupertinoThemeData;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/material_ui.dart';

class StarfieldDarkTheme extends ConsumerWidget {
  const StarfieldDarkTheme({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return child;
    }
    final FluxerColorTheme darkColors = ref.watch(
      themePreferenceProvider.select(
        (ThemePreferenceState state) => state.darkColorTheme,
      ),
    );
    final ThemeData theme = cachedFluxerTheme(colorTheme: darkColors);
    final CupertinoThemeData cupertinoTheme = CupertinoTheme.of(context)
        .copyWith(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: theme.scaffoldBackgroundColor,
        );
    return Theme(
      data: theme,
      child: CupertinoTheme(
        data: cupertinoTheme,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: fluxerSystemUiOverlayStyle(
            brightness: Brightness.dark,
            navigationBarColor: theme.scaffoldBackgroundColor,
          ),
          child: child,
        ),
      ),
    );
  }
}
