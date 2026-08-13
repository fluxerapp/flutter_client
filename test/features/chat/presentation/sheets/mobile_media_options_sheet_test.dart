import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/media_options_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/mobile_media_options_sheet.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:riverpod/src/framework.dart' show Override;
import '../../../../helpers/test_l10n.dart';

const String _testAttachmentUrl =
    'https://fluxerusercontent.com/attachments/1427764813854588943/1531388054034460672/video.mp4';
const String _testImageUrl =
    'https://fluxerusercontent.com/attachments/1427764813854588943/1531388054034460672/image.png';
const String _externalEmbedUrl =
    'https://fxtwitter.com/i/status/2082073836472647719';

Widget _wrap(Widget child, {List<Override> overrides = const []}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      locale: kTestLocale,
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

  testWidgets('edit alt text opens on the first tap', (tester) async {
    const Attachment attachment = Attachment(
      id: 'attachment-id',
      filename: 'image.png',
      url: _testImageUrl,
      contentType: 'image/png',
    );
    final Message message = Message(
      id: 'message-id',
      channelId: 'channel-id',
      authorId: 'author-id',
      authorName: 'Author',
      content: '',
      timestamp: DateTime(2026),
      attachments: const <Attachment>[attachment],
    );

    await tester.pumpWidget(
      _wrap(
        overrides: <Override>[
          appearancePreferencesProvider.overrideWithValue(
            const AppearancePreferencesState(),
          ),
          isMessageSavedProvider(
            message.id,
          ).overrideWith((Ref ref) => Stream<bool>.value(false)),
        ],
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
                        launchContext: MediaOptionsLaunchContext(
                          fallbackUrl: _testImageUrl,
                          attachmentId: attachment.id,
                          filename: attachment.filename,
                          actionScope: MessageMediaActionScope(
                            message: message,
                            permissions: const MessageActionPermissions(
                              isOwnMessage: true,
                              isDmChannel: false,
                              canDelete: true,
                              canReport: false,
                              canAddReactions: false,
                              canPinMessage: false,
                              canManageMessages: false,
                              canSendMessages: true,
                              developerMode: false,
                            ),
                            callbacks: const MessageActionCallbacks(),
                          ),
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

    final Finder editAltText = find.text('Edit Alt Text');
    await tester.ensureVisible(editAltText);
    await tester.pumpAndSettle();
    await tester.tap(editAltText);
    await tester.pumpAndSettle();

    expect(find.text('Edit attachment'), findsOneWidget);
    expect(find.text('Edit Alt Text'), findsNothing);
  });
}
