import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_shared.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_inline_video_player.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

Widget _wrap(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
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

bool _hasEmbedChrome(WidgetTester tester) {
  return tester.widgetList<Container>(find.byType(Container)).any((
    Container container,
  ) {
    final Decoration? decoration = container.decoration;
    if (decoration is! BoxDecoration) {
      return false;
    }
    final Border? border = decoration.border is Border
        ? decoration.border! as Border
        : null;
    return border != null && border.left.width == 4;
  });
}

void main() {
  testWidgets('media-only video embed looks like an uploaded video', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedVideo(
          embed: Embed(
            type: EmbedType.video,
            url: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
            video: EmbedMedia(
              url: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
              proxyUrl: 'https://cdn.fluxer.app/attachments/1/2/clip.mp4',
              width: 1280,
              height: 720,
            ),
          ),
          channelId: 'c1',
          messageId: 'm1',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(ChatInlineVideoPlayer), findsOneWidget);
    expect(find.byType(EmbedTitle), findsNothing);
    expect(_hasEmbedChrome(tester), isFalse);
  });

  testWidgets('rich video embed keeps embed chrome and title', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedVideo(
          embed: Embed(
            type: EmbedType.video,
            url: 'https://www.youtube.com/watch?v=abc',
            providerName: 'YouTube',
            providerUrl: 'https://www.youtube.com',
            title: 'A clip',
            video: EmbedMedia(
              url: 'https://www.youtube.com/embed/abc',
              proxyUrl: 'https://proxy.example.com/video',
              width: 1280,
              height: 720,
            ),
          ),
          channelId: 'c1',
          messageId: 'm1',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(EmbedTitle), findsOneWidget);
    expect(_hasEmbedChrome(tester), isTrue);
  });
}
