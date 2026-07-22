import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

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
      home: child,
    ),
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
                url: 'https://example.com/image.png',
                filename: 'image.png',
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

    testWidgets('keeps desktop buttons on desktop layout', (tester) async {
      tester.view.physicalSize = const Size(1400, 900);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _app(
          const AttachmentMediaViewerShell(
            items: [
              AttachmentMediaViewerItem(
                url: 'https://example.com/image.png',
                filename: 'image.png',
              ),
            ],
            initialIndex: 0,
          ),
        ),
      );
      await tester.pump();

      expect(find.byTooltip('Media options'), findsNothing);
      expect(find.byTooltip('Open in browser'), findsOneWidget);
      expect(find.byTooltip('Close media viewer'), findsOneWidget);
    });
  });
}
