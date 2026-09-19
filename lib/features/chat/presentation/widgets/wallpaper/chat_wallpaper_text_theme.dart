import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_override_scope.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/chat/providers/chat_wallpaper_provider.dart';
import 'package:fluxer_app/features/chat/utils/wallpaper/chat_wallpaper_text_overlay.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/material_ui.dart';

class ChatSurfaceTheme extends StatelessWidget {
  const ChatSurfaceTheme({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    if (!FluxerColorOverrideScope.isActiveOf(context)) {
      return builder(context);
    }
    return FluxerColorOverrideScope(
      colors: null,
      textStyles: null,
      child: Builder(builder: builder),
    );
  }
}

class ChatWallpaperTextTheme extends ConsumerWidget {
  const ChatWallpaperTextTheme({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ChatWallpaperState resolved = ref.watch(
      chatWallpaperProvider.select(
        (ChatWallpaperSnapshot snapshot) => snapshot.resolved,
      ),
    );
    final Brightness themeBrightness = Theme.of(context).brightness;
    final Brightness? tone = resolveChatWallpaperTone(resolved);
    if (tone == null || tone == themeBrightness) {
      return child;
    }
    final FluxerColorTheme source = ref.watch(
      themePreferenceProvider.select(
        (ThemePreferenceState prefs) => tone == Brightness.dark
            ? prefs.darkColorTheme
            : prefs.lightColorTheme,
      ),
    );
    final FluxerColorTheme currentColors = Theme.of(
      context,
    ).extension<FluxerColorTheme>()!;
    final FluxerColorTheme mixed = overlayChatWallpaperColors(
      current: currentColors,
      source: source,
    );
    final FluxerTextTheme currentText = Theme.of(
      context,
    ).extension<FluxerTextTheme>()!;
    return FluxerColorOverrideScope(
      colors: mixed,
      textStyles: overlayChatWallpaperTextStyles(
        current: currentText,
        colors: mixed,
      ),
      child: child,
    );
  }
}
