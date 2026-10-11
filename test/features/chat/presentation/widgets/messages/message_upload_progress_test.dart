import 'package:cross_file/cross_file.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/message_upload_session.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/pending_attachment_preview.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_upload_progress.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_upload_sessions_provider.dart';
import 'package:fluxer_app/features/chat/utils/attachments/uploading_attachment_utils.dart';
import 'package:fluxer_app/material_ui.dart';

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

  testWidgets('a failed send shows a retry control and the failure', (
    WidgetTester tester,
  ) async {
    const String nonce = 'nonce-4';
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          messageUploadSessionsProvider
              .overrideWithValue(<String, MessageUploadSession>{
                nonce: const MessageUploadSession(
                  nonce: nonce,
                  channelId: 'channel-1',
                  attachments: <PendingAttachment>[],
                  sendingProgress: 100,
                ),
              }),
        ],
        child: _buildTestApp(
          child: const MessageUploadProgress(
            attachment: Attachment(
              id: kUploadingAttachmentPlaceholderId,
              filename: 'clip.mp4',
              url: '',
              size: 2048,
            ),
            messageId: nonce,
            messageNonce: nonce,
            failed: true,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.byKey(MessageUploadProgress.retryButtonKey), findsOneWidget);
    expect(find.byKey(MessageUploadProgress.cancelButtonKey), findsOneWidget);
    expect(find.text('Failed to send message'), findsOneWidget);
    expect(
      find.byKey(MessageUploadProgress.determinateProgressKey),
      findsNothing,
    );
  });

  testWidgets('shows the picked video thumbnail while uploading', (
    WidgetTester tester,
  ) async {
    const String nonce = 'nonce-5';
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          attachmentGallerySourceProvider.overrideWithValue(
            _ThumbnailGallerySource(),
          ),
          messageUploadSessionsProvider.overrideWithValue(
            <String, MessageUploadSession>{
              nonce: MessageUploadSession(
                nonce: nonce,
                channelId: 'channel-1',
                attachments: <PendingAttachment>[
                  PendingAttachment(
                    id: 1,
                    channelId: 'channel-1',
                    file: XFile('/nowhere/clip.mp4'),
                    filename: 'clip.mp4',
                    size: 2048,
                    contentType: 'video/mp4',
                    status: PendingAttachmentStatus.uploading,
                    uploadProgress: 0.4,
                    galleryAssetId: 'video-1',
                  ),
                ],
              ),
            },
          ),
        ],
        child: _buildTestApp(
          child: const MessageUploadProgress(
            attachment: Attachment(
              id: kUploadingAttachmentPlaceholderId,
              filename: 'clip.mp4',
              url: '',
              size: 2048,
            ),
            messageId: nonce,
            messageNonce: nonce,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.byKey(PendingAttachmentPreview.thumbnailKey), findsOneWidget);
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
    localizationsDelegates: fluxerLocalizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

class _ThumbnailGallerySource extends AttachmentGallerySource {
  @override
  Future<AttachmentGalleryAccess> requestAccess() async =>
      AttachmentGalleryAccess.granted;

  @override
  Future<List<AttachmentGalleryItem>> loadPage({
    required int page,
    required int pageSize,
  }) async => const <AttachmentGalleryItem>[];

  @override
  Future<Uint8List?> loadThumbnail(String id, {required int size}) async =>
      _transparentPng;

  @override
  Future<AttachmentGalleryFile?> resolveFile(String id) async => null;
}

final Uint8List _transparentPng = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
  0x42,
  0x60,
  0x82,
]);
