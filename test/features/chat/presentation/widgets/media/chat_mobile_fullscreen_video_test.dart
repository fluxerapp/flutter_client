import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/media/chat_mobile_fullscreen_video.dart';
import 'package:fluxer_app/features/ui/media_viewer/media_viewer_dismissible.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

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
  testWidgets('closes after a vertical dismiss fling', (tester) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    const ChatVideoSource source = ChatVideoSource(
      directMediaUrl: 'https://fluxerusercontent.com/attachments/1/2/clip.mp4',
      fallbackUrl: 'https://fluxerusercontent.com/attachments/1/2/clip.mp4',
    );

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
                        source: source,
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
    await tester.pump(const Duration(milliseconds: 50));

    expect(find.byType(MediaViewerDismissible), findsOneWidget);

    final Finder dismissFinder = find.byType(MediaViewerDismissible);
    final Offset center = tester.getCenter(dismissFinder);
    await tester.dragFrom(center, const Offset(0, 200));
    await tester.pump();
    await tester.fling(dismissFinder, const Offset(0, 1), 2000);
    await tester.pumpAndSettle();

    expect(find.byType(MediaViewerDismissible), findsNothing);
    expect(find.text('open'), findsOneWidget);
  });
}
