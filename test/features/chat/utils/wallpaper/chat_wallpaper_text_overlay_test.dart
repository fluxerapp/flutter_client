import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/chat/utils/wallpaper/chat_wallpaper_text_overlay.dart';
import 'package:fluxer_app/features/chat/wallpaper/chat_wallpaper.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  final FluxerColorTheme lightColors = buildLightColorTheme();
  final FluxerColorTheme darkColors = buildDarkColorTheme();
  final FluxerTextTheme lightText = FluxerTextTheme.fromColors(lightColors);
  final FluxerLayoutTheme layout = FluxerLayoutTheme.scaled();

  final ThemeData lightTheme = buildFluxerTheme(
    colorTheme: lightColors,
    textTheme: lightText,
    layoutTheme: layout,
    brightness: Brightness.light,
  );

  group('overlayChatWallpaperTextTheme', () {
    test('copies dark text tokens onto a light theme', () {
      const ChatWallpaperState starfield = ChatWallpaperState(
        kind: ChatWallpaperKind.starfield,
      );
      expect(
        shouldOverlayChatWallpaperText(
          resolved: starfield,
          themeBrightness: Brightness.light,
        ),
        isTrue,
      );

      final ThemeData overlay = overlayChatWallpaperTextTheme(
        theme: lightTheme,
        source: darkColors,
      );
      final FluxerColorTheme colors = overlay.extension<FluxerColorTheme>()!;
      final FluxerTextTheme text = overlay.extension<FluxerTextTheme>()!;

      expect(colors.textChat, darkColors.textChat);
      expect(colors.textPrimaryMuted, darkColors.textPrimaryMuted);
      expect(colors.textLink, darkColors.textLink);
      expect(colors.bgCodeBlock, darkColors.bgCodeBlock);
      expect(colors.embedBackground, lightColors.embedBackground);
      expect(colors.markupMentionText, lightColors.markupMentionText);
      expect(text.messageText.color, darkColors.textChat);
      expect(text.messageText.fontSize, lightText.messageText.fontSize);
      expect(text.timestamp.color, darkColors.textPrimaryMuted);
      expect(overlay.extension<FluxerLayoutTheme>(), layout);
    });

    test('is a no-op when default wallpaper is selected', () {
      expect(
        shouldOverlayChatWallpaperText(
          resolved: const ChatWallpaperState(),
          themeBrightness: Brightness.light,
        ),
        isFalse,
      );
      expect(
        shouldOverlayChatWallpaperText(
          resolved: const ChatWallpaperState(),
          themeBrightness: Brightness.dark,
        ),
        isFalse,
      );
    });

    test('does not overlay dark theme with starfield', () {
      expect(
        shouldOverlayChatWallpaperText(
          resolved: const ChatWallpaperState(kind: ChatWallpaperKind.starfield),
          themeBrightness: Brightness.dark,
        ),
        isFalse,
      );
    });
  });
}
