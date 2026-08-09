import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/favorite_media_picker_content.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/utils/inline_expression_panel_scroll_physics.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart' as mkv;
import 'package:riverpod/src/framework.dart' show Override;
import '../../../../../helpers/test_l10n.dart';

void main() {
  var mediaKitAvailable = true;

  setUpAll(() {
    try {
      MediaKit.ensureInitialized();
    } on Object {
      mediaKitAvailable = false;
    }
  });

  testWidgets('video-like saved media tiles fit in narrow columns', (
    tester,
  ) async {
    if (!mediaKitAvailable) {
      return;
    }
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          favoriteMemesProvider.overrideWith(
            (ref) => Stream.value([
              _meme(
                id: '1',
                filename: 'very-long-saved-video-file-name.mp4',
                contentType: 'video/mp4',
              ),
            ]),
          ),
        ],
        child: const SizedBox(
          width: 220,
          height: 320,
          child: FavoriteMediaPickerContent(),
        ),
      ),
    );
    await tester.pump();

    expect(tester.takeException(), isNull);
  });

  testWidgets(
    'video-like saved media tiles render media instead of filename fallback',
    (tester) async {
      if (!mediaKitAvailable) {
        return;
      }
      const filename = 'animated-favorite.gif';

      await tester.pumpWidget(
        _buildTestApp(
          overrides: [
            favoriteMemesProvider.overrideWith(
              (ref) => Stream.value([
                _meme(id: '1', filename: filename, contentType: 'video/mp4'),
              ]),
            ),
          ],
          child: const SizedBox(
            width: 260,
            height: 320,
            child: FavoriteMediaPickerContent(),
          ),
        ),
      );
      await tester.pump();

      expect(find.text(filename), findsNothing);
    },
  );

  testWidgets('gifv WebP saved media uses image rendering', (tester) async {
    const filename = 'animated-favorite.webp';

    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          favoriteMemesProvider.overrideWith(
            (ref) => Stream.value([
              _meme(
                id: '1',
                filename: filename,
                contentType: 'image/webp',
                isGifv: true,
              ),
            ]),
          ),
        ],
        child: const SizedBox(
          width: 260,
          height: 320,
          child: FavoriteMediaPickerContent(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(mkv.Video), findsNothing);
    expect(find.text(filename), findsNothing);
  });

  testWidgets('image GIF saved media uses image rendering', (tester) async {
    const filename = 'animated-favorite.gif';

    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          favoriteMemesProvider.overrideWith(
            (ref) => Stream.value([
              _meme(
                id: '1',
                filename: filename,
                contentType: 'image/gif',
                isGifv: true,
              ),
            ]),
          ),
        ],
        child: const SizedBox(
          width: 260,
          height: 320,
          child: FavoriteMediaPickerContent(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(mkv.Video), findsNothing);
    expect(find.text(filename), findsNothing);
  });

  testWidgets(
    'short favorite grids emit scroll notifications for panel drags',
    (tester) async {
      var sawOverscroll = false;

      await tester.pumpWidget(
        _buildTestApp(
          overrides: [
            favoriteMemesProvider.overrideWith(
              (ref) => Stream.value([
                _meme(
                  id: '1',
                  filename: 'favorite.png',
                  contentType: 'image/png',
                ),
              ]),
            ),
          ],
          child: Builder(
            builder: (context) {
              return SizedBox(
                width: 260,
                height: 320,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    physics: inlineExpressionPanelContentScrollPhysics(
                      isSheetExpanded: true,
                    ),
                  ),
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (notification) {
                      sawOverscroll =
                          sawOverscroll ||
                          notification is OverscrollNotification &&
                              notification.overscroll > 0;
                      return false;
                    },
                    child: const FavoriteMediaPickerContent(),
                  ),
                ),
              );
            },
          ),
        ),
      );
      await tester.pump();

      await tester.drag(
        find.byType(FavoriteMediaPickerContent),
        const Offset(0, -80),
      );
      await tester.pump();

      expect(sawOverscroll, isTrue);
    },
  );
}

Widget _buildTestApp({
  required Widget child,
  List<Override> overrides = const [],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      locale: kTestLocale,
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

FavoriteMeme _meme({
  required String id,
  required String filename,
  required String contentType,
  bool isGifv = false,
}) => FavoriteMeme(
  id: id,
  userId: 'user-1',
  name: 'Saved video',
  altText: null,
  tags: const [],
  attachmentId: 'attachment-$id',
  filename: filename,
  contentType: contentType,
  contentHash: null,
  size: 1,
  width: 320,
  height: 180,
  duration: null,
  isGifv: isGifv,
  url: 'https://cdn.example/$filename',
  klipySlug: null,
  tenorSlugId: null,
);
