import 'package:flutter_test/flutter_test.dart';
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

  testWidgets('ChatSurfaceTheme builder uses the app theme', (
    WidgetTester tester,
  ) async {
    final ThemeData overlay = overlayChatWallpaperTextTheme(
      theme: lightTheme,
      source: darkColors,
    );
    late Color captured;
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Theme(
          data: overlay,
          child: ChatAppThemeScope(
            theme: lightTheme,
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
    expect(
      overlay.extension<FluxerColorTheme>()!.textChat,
      darkColors.textChat,
    );
  });
}
