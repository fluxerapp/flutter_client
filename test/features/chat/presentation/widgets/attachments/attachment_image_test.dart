import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/embed_animated_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/fluxer_animated_image.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:visibility_detector/visibility_detector.dart';

Widget _app(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: Center(child: child)),
    ),
  );
}

void main() {
  setUpAll(() {
    VisibilityDetectorController.instance.updateInterval = Duration.zero;
  });

  testWidgets('caps decoded bitmap to display size times device pixel ratio', (
    tester,
  ) async {
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      _app(
        const AttachmentImage(
          attachment: Attachment(
            id: '1',
            filename: 'p.png',
            url: 'https://cdn.example/p.png',
            width: 4000,
            height: 3000,
          ),
          dimensionSize: MediaDimensionSize.large,
          wrapWithSpoiler: false,
        ),
      ),
    );

    final image = tester.widget<CachedNetworkImage>(
      find.byType(CachedNetworkImage),
    );
    expect(image.memCacheWidth, 1600);
    expect(image.memCacheHeight, 1200);
  });

  testWidgets('gif attachment renders a visibility-gated animated image', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        const AttachmentImage(
          attachment: Attachment(
            id: 'gif-1',
            filename: 'loop.gif',
            url: 'https://cdn.example/loop.gif',
            proxyUrl: 'https://proxy.example/loop.gif',
            contentType: 'image/gif',
            width: 400,
            height: 300,
          ),
          channelId: 'c1',
          messageId: 'm1',
          wrapWithSpoiler: false,
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
    expect(animated.staticUrl, contains('animated=false'));
  });

  testWidgets('static image attachment renders a cached network image', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        const AttachmentImage(
          attachment: Attachment(
            id: 'png-1',
            filename: 'photo.png',
            url: 'https://cdn.example/photo.png',
            width: 400,
            height: 300,
          ),
          wrapWithSpoiler: false,
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(EmbedAnimatedImage), findsNothing);
    expect(find.byType(CachedNetworkImage), findsOneWidget);
  });
}
