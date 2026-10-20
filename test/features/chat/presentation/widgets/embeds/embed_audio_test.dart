import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_audio.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_audio.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

Widget _wrap(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('media-only audio embed shows the inline player', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedAudio(
          embed: Embed(
            type: EmbedType.audio,
            url: 'https://cdn.example.test/song.mp3',
            audio: EmbedMedia(
              url: 'https://cdn.example.test/song.mp3',
              proxyUrl: 'https://proxy.example.test/song.mp3',
              contentType: 'audio/mpeg',
            ),
          ),
          channelId: 'c1',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(AttachmentAudio), findsOneWidget);
  });

  testWidgets('rich audio embed does not render a player here', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedAudio(
          embed: Embed(
            type: EmbedType.audio,
            url: 'https://cdn.example.test/song.mp3',
            title: 'A track',
            audio: EmbedMedia(
              url: 'https://cdn.example.test/song.mp3',
              proxyUrl: 'https://proxy.example.test/song.mp3',
              contentType: 'audio/mpeg',
            ),
          ),
          channelId: 'c1',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(AttachmentAudio), findsNothing);
  });
}
