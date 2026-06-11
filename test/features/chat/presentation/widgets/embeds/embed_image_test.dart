import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:visibility_detector/visibility_detector.dart';

Widget _wrap(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  testWidgets('gifv embed renders an animated webp image', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedImage(
          embed: Embed(
            type: EmbedType.gifv,
            image: EmbedMedia(
              url: 'https://x/a',
              proxyUrl: 'https://cdn/a',
              width: 200,
              height: 150,
            ),
          ),
          channelId: 'c1',
          messageId: 'm1',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(EmbedAnimatedImage), findsOneWidget);
    final animated = tester.widget<FluxerAnimatedImage>(
      find.byType(FluxerAnimatedImage),
    );
    expect(animated.animatedUrl, contains('format=webp'));
    expect(animated.animatedUrl, contains('animated=true'));
  });

  testWidgets('image embed with animated flag renders animated', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedImage(
          embed: Embed(
            type: EmbedType.image,
            image: EmbedMedia(
              url: 'https://x/b',
              proxyUrl: 'https://cdn/b',
              width: 200,
              height: 150,
              flags: kEmbedMediaAnimatedFlag,
            ),
          ),
          channelId: 'c1',
          messageId: 'm2',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(EmbedAnimatedImage), findsOneWidget);
  });

  testWidgets('plain image embed renders a static image', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedImage(
          embed: Embed(
            type: EmbedType.image,
            image: EmbedMedia(
              url: 'https://x/c',
              proxyUrl: 'https://cdn/c',
              width: 200,
              height: 150,
            ),
          ),
          channelId: 'c1',
          messageId: 'm3',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(EmbedAnimatedImage), findsNothing);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
