import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/favorite_meme.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/media_load_error_placeholder.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_app/features/ui/media_viewer/touch_media_viewer_page.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

import '../../../helpers/open_test_database.dart';
import '../../../helpers/test_l10n.dart';

class _TouchPrimaryModality extends InputModalityNotifier {
  @override
  bool build() => true;
}

class _MousePrimaryModality extends InputModalityNotifier {
  @override
  bool build() => false;
}

const String _testAttachmentImageUrl =
    'https://fluxerusercontent.com/attachments/1427764813854588943/1531388054034460672/CleanShot_2026-07-27_at_19.49.162x.png';
const String _testAttachmentImageFilename =
    'CleanShot_2026-07-27_at_19.49.162x.png';

Widget _app(Widget child) {
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
      home: child,
    ),
  );
}

Widget _touchApp(Widget child) {
  return ProviderScope(
    overrides: [inputModalityProvider.overrideWith(_TouchPrimaryModality.new)],
    child: _materialApp(child),
  );
}

Widget _mouseApp(Widget child) {
  return ProviderScope(
    overrides: [inputModalityProvider.overrideWith(_MousePrimaryModality.new)],
    child: _materialApp(child),
  );
}

Widget _touchAppWithFavorites(Widget child) {
  return ProviderScope(
    overrides: [
      inputModalityProvider.overrideWith(_TouchPrimaryModality.new),
      favoriteMemesProvider.overrideWith(
        (Ref ref) => Stream<List<FavoriteMeme>>.value(const <FavoriteMeme>[]),
      ),
    ],
    child: _materialApp(child),
  );
}

Widget _mouseAppWithFavorites(Widget child) {
  final database = fluxerDatabaseProvider.overrideWithValue(openTestDatabase());
  return ProviderScope(
    overrides: [
      inputModalityProvider.overrideWith(_MousePrimaryModality.new),
      database,
      favoriteMemesProvider.overrideWith(
        (Ref ref) => Stream<List<FavoriteMeme>>.value(const <FavoriteMeme>[]),
      ),
    ],
    child: _materialApp(child),
  );
}

final Message _favoriteViewerMessage = Message(
  id: 'message',
  channelId: 'channel',
  authorId: 'author',
  authorName: 'Author',
  content: '',
  timestamp: DateTime(2026),
  attachments: const [
    Attachment(
      id: 'attachment',
      filename: _testAttachmentImageFilename,
      url: _testAttachmentImageUrl,
      contentType: 'image/png',
    ),
  ],
);

final MessageMediaActionScope _favoriteViewerActionScope =
    MessageMediaActionScope(
      message: _favoriteViewerMessage,
      permissions: const MessageActionPermissions(
        isOwnMessage: true,
        isDmChannel: false,
        canDelete: false,
        canReport: false,
        canAddReactions: false,
        canPinMessage: false,
        canManageMessages: false,
        canSendMessages: true,
        developerMode: false,
      ),
      callbacks: const MessageActionCallbacks(),
    );

Widget _materialApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: child,
  );
}

void main() {
  group('AttachmentMediaViewerShell', () {
    testWidgets('shows mobile options button when a URL is available', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _app(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: _testAttachmentImageUrl,
                filename: _testAttachmentImageFilename,
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Media options'), findsOneWidget);
    });

    testWidgets('hides mobile options button when no URL is available', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _app(
          const AttachmentMediaViewerShell(
            items: [AttachmentMediaViewerItem(url: '', filename: 'image.png')],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Media options'), findsNothing);
    });

    testWidgets('shows a load-failed placeholder when the image URL is empty', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _app(
          const AttachmentMediaViewerShell(
            items: [AttachmentMediaViewerItem(url: '', filename: 'image.png')],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(MediaLoadErrorPlaceholder), findsWidgets);
    });

    testWidgets('keeps desktop buttons on desktop layout', (tester) async {
      tester.view.physicalSize = const Size(1400, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _mouseApp(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: _testAttachmentImageUrl,
                filename: _testAttachmentImageFilename,
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Media options'), findsOneWidget);
      expect(find.byTooltip('Open in browser'), findsOneWidget);
      expect(find.byTooltip('Close media viewer'), findsOneWidget);
      expect(find.byType(TouchMediaViewerPage), findsNothing);
    });

    testWidgets('shows attachment description in the desktop info pill', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1400, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _mouseApp(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: _testAttachmentImageUrl,
                filename: _testAttachmentImageFilename,
                description: 'A waving cat',
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('A waving cat'), findsOneWidget);
    });

    testWidgets('shows attachment description on mobile layouts', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _touchApp(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: _testAttachmentImageUrl,
                filename: _testAttachmentImageFilename,
                description: 'A waving cat',
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.text('A waving cat'), findsOneWidget);
    });

    testWidgets('shows favorite button when message action scope is provided', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1400, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _mouseAppWithFavorites(
          AttachmentMediaViewerShell(
            items: const [
              AttachmentMediaViewerItem(
                url: _testAttachmentImageUrl,
                filename: _testAttachmentImageFilename,
                attachmentId: 'attachment',
              ),
            ],
            initialIndex: 0,
            actionScope: _favoriteViewerActionScope,
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Add to favorites'), findsOneWidget);
      await releaseTestWidgetTree(tester);
    });

    testWidgets('uses touch gesture page when touch is primary', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _touchApp(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: _testAttachmentImageUrl,
                filename: _testAttachmentImageFilename,
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(TouchMediaViewerPage), findsOneWidget);
    });

    testWidgets('long-pressing the media opens the options sheet', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _touchAppWithFavorites(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: _testAttachmentImageUrl,
                filename: _testAttachmentImageFilename,
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();
      expect(find.text('Copy link'), findsNothing);

      await tester.longPress(find.byType(TouchMediaViewerPage));
      await tester.pumpAndSettle();

      expect(find.text('Copy link'), findsOneWidget);
    });

    testWidgets(
      'uses touch gesture page on wide layout when touch is primary',
      (tester) async {
        tester.view.physicalSize = const Size(1400, 900);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(tester.view.reset);

        await tester.pumpWidget(
          _touchApp(
            const AttachmentMediaViewerShell(
              items: [
                AttachmentMediaViewerItem(
                  url: _testAttachmentImageUrl,
                  filename: _testAttachmentImageFilename,
                ),
              ],
              initialIndex: 0,
            ),
          ),
        );
        await tester.pump();

        expect(find.byType(TouchMediaViewerPage), findsOneWidget);
        expect(find.byTooltip('Open in browser'), findsOneWidget);
      },
    );

    testWidgets('closes after a vertical dismiss fling on touch', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _touchApp(
          Builder(
            builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      unawaited(
                        showAttachmentMediaViewer(
                          context,
                          items: const [
                            AttachmentMediaViewerItem(
                              url: _testAttachmentImageUrl,
                              filename: _testAttachmentImageFilename,
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Open viewer'),
                  ),
                ),
              );
            },
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open viewer'));
      await tester.pumpAndSettle();

      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);

      final Finder pageFinder = find.byType(TouchMediaViewerPage);
      final Offset center = tester.getCenter(pageFinder);
      await tester.dragFrom(center, const Offset(0, 200));
      await tester.pump();
      await tester.fling(pageFinder, const Offset(0, 1), 2000);
      await tester.pumpAndSettle();

      expect(find.byType(AttachmentMediaViewerShell), findsNothing);
    });

    testWidgets('viewer thumbnails decode at strip size, not full resolution', (
      tester,
    ) async {
      _useLowEndPhoneSurface(tester);

      await tester.pumpWidget(
        _touchApp(
          const AttachmentMediaViewerShell(
            items: [_landscapePhoto, _portraitPhoto, _unknownSizePhoto],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(_decodeCaps(tester, BoxFit.cover), [
        (null, 112),
        (112, null),
        (112, null),
      ]);
    });

    testWidgets('viewer page decodes at most twice the screen size', (
      tester,
    ) async {
      _useLowEndPhoneSurface(tester);

      for (final (AttachmentMediaViewerItem item, (int?, int?) expected) in [
        (_landscapePhoto, (3200, null)),
        (_portraitPhoto, (null, 3200)),
        (_unknownSizePhoto, (3200, null)),
      ]) {
        await tester.pumpWidget(
          _touchApp(
            AttachmentMediaViewerShell(
              key: ValueKey<String>(item.filename),
              items: [item],
              initialIndex: 0,
            ),
          ),
        );
        await tester.pump();

        expect(_decodeCaps(tester, BoxFit.contain), [
          expected,
        ], reason: item.filename);
      }
    });

    testWidgets('animated viewer items keep full-resolution decode', (
      tester,
    ) async {
      _useLowEndPhoneSurface(tester);

      await tester.pumpWidget(
        _touchApp(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: 'https://cdn.example.com/attachments/1/clip.gif',
                filename: 'clip.gif',
                width: 4000,
                height: 3000,
                contentType: 'image/gif',
              ),
              AttachmentMediaViewerItem(
                url:
                    'https://media.example.com/external/a?format=webp&animated=true',
                filename: 'a',
                width: 4000,
                height: 3000,
              ),
              AttachmentMediaViewerItem(
                url: 'https://cdn.example.com/attachments/1/sticker.webp',
                filename: 'sticker.webp',
                width: 4000,
                height: 3000,
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(_decodeCaps(tester, BoxFit.contain), [(null, null)]);
      expect(_decodeCaps(tester, BoxFit.cover), [
        (null, null),
        (null, null),
        (null, null),
      ]);
    });

    testWidgets('viewer page animates GIFs when reduced motion is on', (
      tester,
    ) async {
      _useLowEndPhoneSurface(tester);

      await tester.pumpWidget(
        _touchApp(
          Builder(
            builder: (BuildContext context) => MediaQuery(
              data: MediaQuery.of(context).copyWith(disableAnimations: true),
              child: const AttachmentMediaViewerShell(
                items: [
                  AttachmentMediaViewerItem(
                    url: 'https://cdn.example.com/attachments/1/clip.gif',
                    filename: 'clip.gif',
                    width: 400,
                    height: 300,
                    contentType: 'image/gif',
                  ),
                  _landscapePhoto,
                ],
                initialIndex: 0,
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(_disableAnimations(tester, BoxFit.contain), [false]);
      expect(_disableAnimations(tester, BoxFit.cover), [true, true]);
    });
  });

  group('touch pinch zoom', () {
    Future<void> pumpTouchViewer(WidgetTester tester) async {
      tester.view.physicalSize = const Size(400, 800);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        _touchApp(
          const AttachmentMediaViewerShell(
            items: [_landscapePhoto, _landscapePhoto],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();
    }

    double currentScale(WidgetTester tester) {
      final InteractiveViewer viewer = tester.widget<InteractiveViewer>(
        find.byType(InteractiveViewer).first,
      );
      return viewer.transformationController!.value.getMaxScaleOnAxis();
    }

    double currentPage(WidgetTester tester) {
      final PageView pageView = tester.widget<PageView>(find.byType(PageView));
      return pageView.controller!.page!;
    }

    Future<void> pinchMovingOneFinger(
      WidgetTester tester,
      Offset fingerDelta,
    ) async {
      final Offset center = tester.getCenter(
        find.byType(TouchMediaViewerPage).first,
      );
      final TestGesture anchor = await tester.startGesture(
        center - const Offset(30, 30),
        pointer: 1,
      );
      final TestGesture mover = await tester.startGesture(
        center + const Offset(30, 30),
        pointer: 2,
      );
      for (int i = 0; i < 12; i++) {
        await mover.moveBy(fingerDelta / 12);
        await tester.pump(const Duration(milliseconds: 16));
      }
      final double scale = currentScale(tester);
      await mover.up();
      await anchor.up();
      await tester.pump();
      expect(scale, greaterThan(1.2));
    }

    testWidgets('pinch zooms when one finger moves vertically', (tester) async {
      await pumpTouchViewer(tester);
      await pinchMovingOneFinger(tester, const Offset(0, 90));
      await tester.pumpAndSettle();
      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
    });

    testWidgets('pinch zooms when one finger moves horizontally', (
      tester,
    ) async {
      await pumpTouchViewer(tester);
      await pinchMovingOneFinger(tester, const Offset(90, 0));
      await tester.pumpAndSettle();
      expect(currentPage(tester), 0);
    });

    testWidgets('a one finger horizontal swipe still pages', (tester) async {
      await pumpTouchViewer(tester);
      await tester.fling(
        find.byType(TouchMediaViewerPage).first,
        const Offset(-300, 0),
        1500,
      );
      await tester.pumpAndSettle();
      expect(currentPage(tester), 1);
    });
  });
}

const AttachmentMediaViewerItem _landscapePhoto = AttachmentMediaViewerItem(
  url: 'https://cdn.example.com/attachments/1/landscape.jpg',
  filename: 'landscape.jpg',
  width: 4000,
  height: 3000,
  contentType: 'image/jpeg',
);

const AttachmentMediaViewerItem _portraitPhoto = AttachmentMediaViewerItem(
  url: 'https://cdn.example.com/attachments/1/portrait.jpg',
  filename: 'portrait.jpg',
  width: 3000,
  height: 4000,
  contentType: 'image/jpeg',
);

const AttachmentMediaViewerItem _unknownSizePhoto = AttachmentMediaViewerItem(
  url: 'https://cdn.example.com/attachments/1/unknown.png',
  filename: 'unknown.png',
  contentType: 'image/png',
);

void _useLowEndPhoneSurface(WidgetTester tester) {
  tester.view.physicalSize = const Size(720, 1600);
  tester.view.devicePixelRatio = 2;
  addTearDown(tester.view.reset);
}

List<(int?, int?)> _decodeCaps(WidgetTester tester, BoxFit fit) {
  return tester
      .widgetList<CachedNetworkImage>(find.byType(CachedNetworkImage))
      .where((CachedNetworkImage image) => image.fit == fit)
      .map(
        (CachedNetworkImage image) =>
            (image.memCacheWidth, image.memCacheHeight),
      )
      .toList();
}

List<bool> _disableAnimations(WidgetTester tester, BoxFit fit) {
  return tester
      .elementList(find.byType(CachedNetworkImage))
      .where(
        (Element element) => (element.widget as CachedNetworkImage).fit == fit,
      )
      .map(MediaQuery.disableAnimationsOf)
      .toList();
}
