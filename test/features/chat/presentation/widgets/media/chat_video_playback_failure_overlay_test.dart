import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_video_playback_failure_overlay.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_playback_utils.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:media_kit/media_kit.dart';

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
  var mediaKitAvailable = true;

  setUpAll(() {
    try {
      MediaKit.ensureInitialized();
    } on Object {
      mediaKitAvailable = false;
    }
  });

  tearDown(() {
    debugYouTubeStreamResolver = null;
  });

  testWidgets('failure overlay shows message and open-in-browser action', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const ChatVideoPlaybackFailureOverlay(
          fallbackUrl: 'https://www.youtube.com/watch?v=abc',
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Could not play this video.'), findsOneWidget);
    expect(find.text('Open in browser'), findsOneWidget);
  });

  testWidgets(
    'failure overlay does not show open action without fallback URL',
    (tester) async {
      await tester.pumpWidget(
        _wrap(const ChatVideoPlaybackFailureOverlay(fallbackUrl: '')),
      );
      await tester.pumpAndSettle();

      expect(find.text('Could not play this video.'), findsOneWidget);
      expect(find.text('Open in browser'), findsNothing);
    },
  );

  testWidgets('open in browser shows external link warning from nested route', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          localizationsDelegates: FluxerLocalizations.localizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          home: Builder(
            builder: (BuildContext context) {
              return TextButton(
                onPressed: () {
                  Navigator.of(context).push<void>(
                    MaterialPageRoute<void>(
                      fullscreenDialog: true,
                      builder: (BuildContext routeContext) {
                        return Scaffold(
                          body: ChatVideoPlaybackFailureOverlay(
                            fallbackUrl: 'https://www.youtube.com/watch?v=abc',
                            useRootNavigator: true,
                            onClose: () => Navigator.of(routeContext).pop(),
                          ),
                        );
                      },
                    ),
                  );
                },
                child: const Text('open'),
              );
            },
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('Open in browser'));
    await tester.pumpAndSettle();

    expect(find.text('External Link Warning'), findsOneWidget);
    expect(find.text('https://www.youtube.com/watch?v=abc'), findsOneWidget);
  });

  testWidgets(
    'mobile fullscreen shows failure UI instead of auto-opening browser',
    (tester) async {
      if (!mediaKitAvailable) {
        return;
      }

      var resolveAttempts = 0;
      debugYouTubeStreamResolver = (String pageUrl) async {
        resolveAttempts++;
        throw StateError('stream unavailable');
      };

      const ChatVideoSource source = ChatVideoSource(
        pageUrl: 'https://www.youtube.com/watch?v=abc',
        fallbackUrl: 'https://www.youtube.com/watch?v=abc',
      );

      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (BuildContext context) {
              return Center(
                child: TextButton(
                  onPressed: () {
                    unawaited(
                      showChatMobileFullscreenVideo(context, source: source),
                    );
                  },
                  child: const Text('open'),
                ),
              );
            },
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(resolveAttempts, greaterThan(0));
      expect(find.text('Could not play this video.'), findsOneWidget);
      expect(find.text('Open in browser'), findsOneWidget);
      expect(find.byType(ChatVideoPlaybackFailureOverlay), findsOneWidget);
    },
  );
}
