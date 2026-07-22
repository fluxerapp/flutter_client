import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/message_bottom_sheet.dart';
import 'package:fluxer_app/features/chat/providers/messages/saved_message_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

void main() {
  final message = Message(
    id: 'msg-1',
    channelId: 'channel-1',
    authorId: 'user-1',
    authorName: 'user',
    content: 'hello',
    timestamp: DateTime(2026, 5, 6, 12),
    attachments: const [
      Attachment(
        id: 'att-1',
        filename: 'image.png',
        url: 'https://x/y',
        contentType: 'image/png',
      ),
      Attachment(
        id: 'att-2',
        filename: 'doc.pdf',
        url: 'https://x/z',
        contentType: 'application/pdf',
      ),
    ],
  );

  Widget buildTestApp({
    required Future<void> Function(BuildContext context) onOpen,
  }) {
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
        home: Builder(
          builder: (context) {
            return TextButton(
              onPressed: () => onOpen(context),
              child: const Text('Open'),
            );
          },
        ),
      ),
    );
  }

  group('showMessageBottomSheet attachment actions', () {
    testWidgets('shows delete and edit alt text for own attachments', (
      tester,
    ) async {
      Attachment? deletedAttachment;

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appearancePreferencesProvider.overrideWithValue(
              const AppearancePreferencesState(),
            ),
            isMessageSavedProvider(
              message.id,
            ).overrideWith((ref) => Stream<bool>.value(false)),
          ],
          child: buildTestApp(
            onOpen: (context) => showMessageBottomSheet(
              context,
              message: message,
              isOwnMessage: true,
              isDmChannel: false,
              canDelete: true,
              canReport: false,
              canAddReactions: false,
              canPinMessage: false,
              canManageMessages: false,
              canSendMessages: true,
              developerMode: false,
              attachmentCallbacks: MessageActionCallbacks(
                onDeleteAttachment: (attachment) {
                  deletedAttachment = attachment;
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      final deleteItems = find.text('Delete Attachment');
      expect(deleteItems, findsNWidgets(2));

      final editAltTextItems = find.text('Edit Alt Text');
      expect(editAltTextItems, findsOneWidget);

      await tester.ensureVisible(deleteItems.first);
      await tester.pumpAndSettle();
      await tester.tap(deleteItems.first);
      await tester.pumpAndSettle();

      expect(deletedAttachment, isNotNull);
      expect(deletedAttachment!.id, 'att-1');
    });

    testWidgets('hides delete attachment when preference is disabled', (
      tester,
    ) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            appearancePreferencesProvider.overrideWithValue(
              const AppearancePreferencesState(showMediaDeleteButton: false),
            ),
            isMessageSavedProvider(
              message.id,
            ).overrideWith((ref) => Stream<bool>.value(false)),
          ],
          child: buildTestApp(
            onOpen: (context) => showMessageBottomSheet(
              context,
              message: message,
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
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pumpAndSettle();

      expect(find.text('Delete Attachment'), findsNothing);
    });
  });
}
