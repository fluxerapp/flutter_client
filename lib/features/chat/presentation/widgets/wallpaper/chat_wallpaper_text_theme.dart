import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/providers/theme_preference_provider.dart';
import 'package:fluxer_app/features/chat/providers/chat_wallpaper_provider.dart';
import 'package:fluxer_app/features/chat/utils/wallpaper/chat_wallpaper_text_overlay.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/material_ui.dart';

class ChatAppThemeScope extends InheritedWidget {
  const ChatAppThemeScope({
    required this.theme,
    required super.child,
    super.key,
  });

  final ThemeData theme;

  static ThemeData? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ChatAppThemeScope>()
        ?.theme;
  }

  @override
  bool updateShouldNotify(ChatAppThemeScope oldWidget) {
    return theme != oldWidget.theme;
  }
}

class ChatSurfaceTheme extends StatelessWidget {
  const ChatSurfaceTheme({required this.builder, super.key});

  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    final ThemeData? original = ChatAppThemeScope.maybeOf(context);
    if (original == null) {
      return builder(context);
    }
    return Theme(
      data: original,
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
    final ThemePreferenceState prefs = ref.watch(themePreferenceProvider);
    final Brightness themeBrightness = Theme.of(context).brightness;
    if (!shouldOverlayChatWallpaperText(
      resolved: resolved,
      themeBrightness: themeBrightness,
    )) {
      return child;
    }
    final Brightness tone = resolveChatWallpaperTone(resolved)!;
    final FluxerColorTheme source = tone == Brightness.dark
        ? prefs.darkColorTheme
        : prefs.lightColorTheme;
    final ThemeData current = Theme.of(context);
    return ChatAppThemeScope(
      theme: current,
      child: Theme(
        data: overlayChatWallpaperTextTheme(theme: current, source: source),
        child: child,
      ),
    );
  }
}
