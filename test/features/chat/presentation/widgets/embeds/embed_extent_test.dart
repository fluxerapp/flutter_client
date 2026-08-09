import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_link.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_rich.dart';
import 'package:fluxer_app/features/chat/utils/embed_gallery_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

/// The reservation contract: a media tile's box exists at first layout and
/// never changes when (or whether) the bytes arrive. In the test environment
/// the network image never resolves, which IS the pre-load state - the box
/// must already be final, or late-loading images shift the chat.
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

Size _imageBox(WidgetTester tester) =>
    tester.getSize(find.byType(CachedNetworkImage));

EmbedMedia _media({int? width, int? height}) => EmbedMedia(
  url: 'https://x/img',
  proxyUrl: 'https://cdn/img',
  width: width,
  height: height,
);

void main() {
  group('EmbedRich large image', () {
    Future<void> pumpRich(WidgetTester tester, EmbedMedia media) async {
      final Embed embed = Embed(
        type: EmbedType.rich,
        url: 'https://example.com/post',
        title: 'Post',
        image: media,
      );
      await tester.pumpWidget(
        _wrap(
          EmbedRich(
            embed: embed,
            galleryIndex: EmbedGalleryIndex(<Embed>[embed]),
            embedIndex: 0,
          ),
        ),
      );
      await tester.pump();
    }

    testWidgets('reserves the metadata extent before any bytes arrive', (
      tester,
    ) async {
      await pumpRich(tester, _media(width: 400, height: 300));
      final Size? expected = constrainMediaSize(
        dimensions: compactMediaDimensions,
        width: 400,
        height: 300,
      );
      expect(_imageBox(tester), expected);
      await tester.pump(const Duration(seconds: 1));
      expect(_imageBox(tester), expected, reason: 'the box never changes');
    });

    testWidgets('caps tall portrait metadata at the layout max height', (
      tester,
    ) async {
      await pumpRich(tester, _media(width: 400, height: 1200));
      final Size box = _imageBox(tester);
      expect(
        box.height,
        lessThanOrEqualTo(compactMediaDimensions.maxHeight),
        reason: 'portrait metadata must not reserve unbounded height',
      );
      expect(
        box,
        constrainMediaSize(
          dimensions: compactMediaDimensions,
          width: 400,
          height: 1200,
        ),
      );
    });

    testWidgets('reserves the fixed fallback when dimensions are missing', (
      tester,
    ) async {
      await pumpRich(tester, _media());
      expect(_imageBox(tester).height, kEmbedMediaFallbackHeight);
    });

    testWidgets('opens the media viewer when tapped', (tester) async {
      await pumpRich(tester, _media(width: 400, height: 300));
      await tester.tap(find.byType(CachedNetworkImage));
      await tester.pump();
      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
    });
  });

  group('EmbedLink thumbnail', () {
    Future<void> pumpLink(WidgetTester tester, EmbedMedia media) async {
      final Embed embed = Embed(
        type: EmbedType.link,
        url: 'https://example.com/post',
        title: 'Post',
        thumbnail: media,
      );
      await tester.pumpWidget(
        _wrap(
          EmbedLink(
            embed: embed,
            galleryIndex: EmbedGalleryIndex(<Embed>[embed]),
            embedIndex: 0,
          ),
        ),
      );
      await tester.pump();
    }

    testWidgets('reserves the metadata extent capped by the layout', (
      tester,
    ) async {
      await pumpLink(tester, _media(width: 400, height: 1200));
      final Size box = _imageBox(tester);
      expect(box.height, lessThanOrEqualTo(compactMediaDimensions.maxHeight));
      expect(
        box,
        constrainMediaSize(
          dimensions: compactMediaDimensions,
          width: 400,
          height: 1200,
        ),
      );
    });

    testWidgets('reserves the fixed fallback when dimensions are missing', (
      tester,
    ) async {
      await pumpLink(tester, _media());
      expect(_imageBox(tester).height, kEmbedMediaFallbackHeight);
    });

    testWidgets('opens the media viewer when tapped', (tester) async {
      await pumpLink(tester, _media(width: 400, height: 300));
      await tester.tap(find.byType(CachedNetworkImage));
      await tester.pump();
      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
    });
  });
}
