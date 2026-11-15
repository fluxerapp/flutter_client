import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/attachment_request_auth.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_video_playback_failure_overlay.dart';
import 'package:fluxer_app/l10n/fluxer_localizations_delegates.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:media_kit/media_kit.dart';

import '../../../../../helpers/core_test_provider_overrides.dart';

Widget _wrap(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: coreTestProviderOverrides(),
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: fluxerLocalizationsDelegates,
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
        overrides: coreTestProviderOverrides(),
        child: MaterialApp(
          theme: buildFluxerTheme(
            colorTheme: buildDarkColorTheme(),
            textTheme: FluxerTextTheme.fromColors(buildDarkColorTheme()),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          localizationsDelegates: fluxerLocalizationsDelegates,
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

    expect(find.text('External link warning'), findsOneWidget);
    expect(find.text('https://www.youtube.com/watch?v=abc'), findsOneWidget);
  });

  testWidgets('own api attachment opens without the external link warning '
      'and never shows its file token', (tester) async {
    const MethodChannel channel = MethodChannel(
      'plugins.flutter.io/url_launcher',
    );
    final List<String> launched = <String>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(channel, (
      MethodCall call,
    ) async {
      if (call.method == 'launch') {
        launched.add(
          (call.arguments as Map<Object?, Object?>)['url']! as String,
        );
      }
      return true;
    });
    addTearDown(() {
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        channel,
        null,
      );
      AttachmentRequestAuth.update(token: null, baseUrl: null, mintToken: null);
    });
    AttachmentRequestAuth.update(
      token: 'test-session-token',
      baseUrl: 'https://api.example.test/api',
      mintToken: ({required String url}) async => AttachmentMediaToken(
        token: 'one-file-token',
        expiresAt: DateTime.now().add(const Duration(minutes: 5)),
      ),
    );
    const String attachment =
        'https://api.example.test/api/channels/11/attachments/22/clip.mp4?mid=33';

    await tester.pumpWidget(
      _wrap(
        const ChatVideoPlaybackFailureOverlay(
          fallbackUrl: attachment,
          useRootNavigator: true,
        ),
      ),
    );
    await tester.pumpAndSettle();
    await tester.tap(find.text('Open in browser'));
    await tester.pumpAndSettle();

    expect(find.text('External link warning'), findsNothing);
    expect(find.textContaining('one-file-token'), findsNothing);
    expect(launched, hasLength(1));
    expect(Uri.parse(launched.single).queryParameters['mt'], 'one-file-token');
  });

  testWidgets(
    'mobile fullscreen shows failure UI instead of auto-opening browser',
    (tester) async {
      if (!mediaKitAvailable) {
        return;
      }

      await tester.pumpWidget(
        _wrap(
          Builder(
            builder: (BuildContext context) {
              return Center(
                child: TextButton(
                  onPressed: () {
                    unawaited(
                      showChatMobileFullscreenVideo(
                        context,
                        launchContext: const ChatFullscreenVideoLaunchContext(
                          source: ChatVideoSource(
                            directMediaUrl:
                                'https://cdn.example.com/unavailable.mp4',
                            fallbackUrl:
                                'https://cdn.example.com/unavailable.mp4',
                          ),
                        ),
                      ),
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
      await tester.pump(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      expect(find.text('Could not play this video.'), findsOneWidget);
      expect(find.text('Open in browser'), findsOneWidget);
      expect(find.byType(ChatVideoPlaybackFailureOverlay), findsOneWidget);
    },
  );
}
