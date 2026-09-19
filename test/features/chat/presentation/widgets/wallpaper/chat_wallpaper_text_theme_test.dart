import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_override_scope.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/wallpaper/chat_wallpaper_text_theme.dart';
import 'package:fluxer_app/features/chat/utils/wallpaper/chat_wallpaper_text_overlay.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  final FluxerColorTheme lightColors = buildLightColorTheme();
  final FluxerColorTheme darkColors = buildDarkColorTheme();
  final ThemeData lightTheme = buildFluxerTheme(
    colorTheme: lightColors,
    textTheme: FluxerTextTheme.fromColors(lightColors),
    layoutTheme: FluxerLayoutTheme.scaled(),
    brightness: Brightness.light,
  );

  testWidgets('override colors leave ThemeData on the app theme', (
    WidgetTester tester,
  ) async {
    final FluxerColorTheme mixed = overlayChatWallpaperColors(
      current: lightColors,
      source: darkColors,
    );
    late Color fluxerColor;
    late Color themeColor;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Theme(
          data: lightTheme,
          child: FluxerColorOverrideScope(
            colors: mixed,
            textStyles: overlayChatWallpaperTextStyles(
              current: FluxerTextTheme.fromColors(lightColors),
              colors: mixed,
            ),
            child: Builder(
              builder: (BuildContext context) {
                fluxerColor = context.colors.textChat;
                themeColor = Theme.of(
                  context,
                ).extension<FluxerColorTheme>()!.textChat;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
    expect(fluxerColor, darkColors.textChat);
    expect(themeColor, lightColors.textChat);
  });

  testWidgets('ChatSurfaceTheme builder uses the app theme', (
    WidgetTester tester,
  ) async {
    final FluxerColorTheme mixed = overlayChatWallpaperColors(
      current: lightColors,
      source: darkColors,
    );
    late Color captured;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Theme(
          data: lightTheme,
          child: FluxerColorOverrideScope(
            colors: mixed,
            textStyles: overlayChatWallpaperTextStyles(
              current: FluxerTextTheme.fromColors(lightColors),
              colors: mixed,
            ),
            child: ChatSurfaceTheme(
              builder: (BuildContext context) {
                captured = context.colors.textChat;
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
    expect(captured, lightColors.textChat);
  });
}
