import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_upload_progress.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/utils/uploading_attachment_utils.dart';
import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets(
    'shows filename and indeterminate progress without session progress',
    (WidgetTester tester) async {
      const String nonce = 'nonce-1';
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            messageUploadSessionsProvider.overrideWithValue(
              const <String, MessageUploadSession>{},
            ),
          ],
          child: _buildTestApp(
            child: const MessageUploadProgress(
              attachment: Attachment(
                id: kUploadingAttachmentPlaceholderId,
                filename: 'notes.txt',
                url: '',
                size: 2048,
              ),
              messageId: nonce,
              messageNonce: nonce,
              channelId: 'channel-1',
            ),
          ),
        ),
      );
      await tester.pump();
      expect(find.text('notes.txt'), findsOneWidget);
      expect(
        find.byKey(MessageUploadProgress.indeterminateProgressKey),
        findsOneWidget,
      );
    },
  );

  testWidgets('shows determinate progress when session has percent', (
    WidgetTester tester,
  ) async {
    const String nonce = 'nonce-2';
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          messageUploadSessionsProvider
              .overrideWithValue(<String, MessageUploadSession>{
                nonce: const MessageUploadSession(
                  nonce: nonce,
                  channelId: 'channel-1',
                  attachments: <PendingAttachment>[],
                  sendingProgress: 50,
                ),
              }),
        ],
        child: _buildTestApp(
          child: const MessageUploadProgress(
            attachment: Attachment(
              id: kUploadingAttachmentPlaceholderId,
              filename: 'notes.txt',
              url: '',
              size: 2048,
            ),
            messageId: nonce,
            messageNonce: nonce,
            channelId: 'channel-1',
          ),
        ),
      ),
    );
    await tester.pump();
    expect(
      find.byKey(MessageUploadProgress.determinateProgressKey),
      findsOneWidget,
    );
    expect(
      find.byKey(MessageUploadProgress.indeterminateProgressKey),
      findsNothing,
    );
  });

  testWidgets('shows cancel control', (WidgetTester tester) async {
    const String nonce = 'nonce-3';
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          messageUploadSessionsProvider.overrideWithValue(
            const <String, MessageUploadSession>{},
          ),
        ],
        child: _buildTestApp(
          child: const MessageUploadProgress(
            attachment: Attachment(
              id: kUploadingAttachmentPlaceholderId,
              filename: 'notes.txt',
              url: '',
            ),
            messageId: nonce,
            messageNonce: nonce,
            channelId: 'channel-1',
          ),
        ),
      ),
    );
    await tester.pump();
    expect(find.byKey(MessageUploadProgress.cancelButtonKey), findsOneWidget);
  });
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}
