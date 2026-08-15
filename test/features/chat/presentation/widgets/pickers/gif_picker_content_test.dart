import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/gif_picker_content.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/providers/pickers/gif_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart' as sdk;
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

Widget buildTestApp({
  required Widget child,
  List<Override> overrides = const [],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
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
  const locale = sdk.Locale.enUs;

  testWidgets('landing page starts with favorites and trending tiles', (
    tester,
  ) async {
    var favoritesTapped = false;

    await tester.pumpWidget(
      buildTestApp(
        overrides: [
          favoriteMemesProvider.overrideWith((ref) => Stream.value(const [])),
          activeGifProviderProvider.overrideWith(
            (ref) => GifProviderKind.tenor,
          ),
          gifFeaturedProvider(locale).overrideWith(
            (ref) => const GifPickerFeatured(
              gifs: [
                GifPickerGif(
                  provider: GifProviderKind.tenor,
                  id: 'gif-1',
                  title: 'Trollface',
                  url: 'https://tenor.com/view/trollface-gif-1',
                  src: 'https://media.tenor.com/trollface.gif',
                  proxySrc: 'https://cdn.example/trollface.gif',
                  width: 220,
                  height: 202,
                ),
              ],
              categories: [],
            ),
          ),
        ],
        child: GifPickerContent(
          onClose: () {},
          onFavoritesTap: () => favoritesTapped = true,
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Favorites'), findsOneWidget);
    expect(find.text('Trending GIFs'), findsOneWidget);

    await tester.tap(find.text('Favorites'));

    expect(favoritesTapped, isTrue);
  });

  testWidgets('loading states use a skeleton grid instead of a spinner', (
    tester,
  ) async {
    final pendingFeatured = Completer<GifPickerFeatured>();
    addTearDown(() {
      if (!pendingFeatured.isCompleted) {
        pendingFeatured.complete(
          const GifPickerFeatured(gifs: [], categories: []),
        );
      }
    });

    await tester.pumpWidget(
      buildTestApp(
        overrides: [
          favoriteMemesProvider.overrideWith((ref) => Stream.value(const [])),
          activeGifProviderProvider.overrideWith(
            (ref) => GifProviderKind.tenor,
          ),
          gifFeaturedProvider(
            locale,
          ).overrideWith((ref) => pendingFeatured.future),
        ],
        child: GifPickerContent(onClose: () {}),
      ),
    );
    await tester.pump();

    expect(
      find.byKey(const ValueKey('gif-picker-skeleton-grid')),
      findsOneWidget,
    );
    expect(find.byType(CircularProgressIndicator), findsNothing);
  });

  testWidgets('content is painted on the picker primary surface', (
    tester,
  ) async {
    await tester.pumpWidget(
      buildTestApp(
        overrides: [
          favoriteMemesProvider.overrideWith((ref) => Stream.value(const [])),
          activeGifProviderProvider.overrideWith(
            (ref) => GifProviderKind.tenor,
          ),
          gifFeaturedProvider(locale).overrideWith(
            (ref) => const GifPickerFeatured(gifs: [], categories: []),
          ),
        ],
        child: GifPickerContent(onClose: () {}),
      ),
    );
    await tester.pump();

    expect(
      find.byKey(const ValueKey('gif-picker-content-surface')),
      findsOneWidget,
    );
  });
}
