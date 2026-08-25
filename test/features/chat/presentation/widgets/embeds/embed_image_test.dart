import 'package:cached_network_image_ce/cached_network_image.dart';
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
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
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
    expect(animated.fit, BoxFit.contain);
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
    final image = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );
    expect(image.fit, BoxFit.contain);
  });

  testWidgets('static embed with dimensions reserves its box before load', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedImage(
          embed: Embed(
            type: EmbedType.image,
            image: EmbedMedia(
              url: 'https://x/d',
              proxyUrl: 'https://cdn/d',
              width: 200,
              height: 150,
            ),
          ),
          channelId: 'c1',
          messageId: 'm4',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    expect(
      tester.getSize(find.byType(CachedNetworkImage)),
      const Size(200, 150),
    );
  });

  testWidgets('static embed without dimensions keeps the fixed fallback box', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const EmbedImage(
          embed: Embed(
            type: EmbedType.image,
            image: EmbedMedia(url: 'https://x/e', proxyUrl: 'https://cdn/e'),
          ),
          channelId: 'c1',
          messageId: 'm5',
          embedIndex: 0,
        ),
      ),
    );
    await tester.pump();

    final Size box = tester.getSize(find.byType(CachedNetworkImage));
    expect(box.height, kEmbedMediaFallbackHeight);
    await tester.pump(const Duration(seconds: 1));
    expect(
      tester.getSize(find.byType(CachedNetworkImage)),
      box,
      reason: 'placeholder and loaded states must agree on the extent',
    );
  });
}
