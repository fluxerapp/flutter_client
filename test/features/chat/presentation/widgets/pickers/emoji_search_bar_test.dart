import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/emoji_search_bar.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/unicode_emoji_widget.dart';

import '../../../../../helpers/test_l10n.dart';

const String _kClapEmoji = '\u{1F44F}';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

void main() {
  testWidgets('skin tone preview renders with UnicodeEmojiWidget', (
    tester,
  ) async {
    final controller = TextEditingController();
    addTearDown(controller.dispose);

    await tester.pumpWidget(
      buildTestApp(
        EmojiSearchBar(
          controller: controller,
          skinTone: kSkinToneSurrogates[2],
          onSkinToneChanged: (_) {},
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(UnicodeEmojiWidget), findsOneWidget);
    expect(find.text(_kClapEmoji + kSkinToneSurrogates[2]), findsNothing);
  });
}
