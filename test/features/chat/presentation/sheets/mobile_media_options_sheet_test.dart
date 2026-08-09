import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/media_options_launch_context.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/mobile_media_options_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

const String _testAttachmentUrl =
    'https://fluxerusercontent.com/attachments/1427764813854588943/1531388054034460672/video.mp4';
const String _externalEmbedUrl =
    'https://fxtwitter.com/i/status/2082073836472647719';

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
      home: child,
    ),
  );
}

void main() {
  testWidgets(
    'open in browser shows external link warning after sheet closes',
    (tester) async {
      await tester.pumpWidget(
        _wrap(
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              return Scaffold(
                body: Center(
                  child: TextButton(
                    onPressed: () {
                      unawaited(
                        showMobileMediaOptionsSheet(
                          context: context,
                          ref: ref,
                          launchContext: const MediaOptionsLaunchContext(
                            fallbackUrl: _externalEmbedUrl,
                          ),
                        ),
                      );
                    },
                    child: const Text('open'),
                  ),
                ),
              );
            },
          ),
        ),
      );
      await tester.tap(find.text('open'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open in browser'));
      await tester.pumpAndSettle();

      expect(find.text('External Link Warning'), findsOneWidget);
      expect(find.text(_externalEmbedUrl), findsOneWidget);
    },
  );

  testWidgets('download is hidden for external embed media', (tester) async {
    await tester.pumpWidget(
      _wrap(
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () {
                    unawaited(
                      showMobileMediaOptionsSheet(
                        context: context,
                        ref: ref,
                        launchContext: const MediaOptionsLaunchContext(
                          fallbackUrl: _externalEmbedUrl,
                          embedIndex: 0,
                        ),
                      ),
                    );
                  },
                  child: const Text('open'),
                ),
              ),
            );
          },
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Download'), findsNothing);
    expect(find.text('Open in browser'), findsOneWidget);
  });

  testWidgets('download is shown for uploaded attachments', (tester) async {
    await tester.pumpWidget(
      _wrap(
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            return Scaffold(
              body: Center(
                child: TextButton(
                  onPressed: () {
                    unawaited(
                      showMobileMediaOptionsSheet(
                        context: context,
                        ref: ref,
                        launchContext: const MediaOptionsLaunchContext(
                          fallbackUrl: _testAttachmentUrl,
                          attachmentId: 'attachment-id',
                          filename: 'video.mp4',
                        ),
                      ),
                    );
                  },
                  child: const Text('open'),
                ),
              ),
            );
          },
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();

    expect(find.text('Download'), findsOneWidget);
  });
}
