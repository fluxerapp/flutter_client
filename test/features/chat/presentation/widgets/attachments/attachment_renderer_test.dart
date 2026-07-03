import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_audio.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_file.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_list_renderer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_media_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_renderer.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_video.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/voice_message_player.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/forwarded_message_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/spoiler_overlay.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_constants.dart';
import 'package:fluxer_app/features/chat/utils/voice_message_waveform.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';

void main() {
  testWidgets('renders image attachment inline when enabled', (tester) async {
    final Attachment attachment = _buildAttachment(
      filename: 'image.png',
      url: 'https://cdn.example/image.png',
      width: 640,
      height: 360,
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.byType(AttachmentImage), findsOneWidget);
  });

  testWidgets('opens attachment media viewer when image is tapped', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'image.png',
      url: 'https://cdn.example/image.png',
      width: 640,
      height: 360,
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentImage(attachment: attachment, wrapWithSpoiler: false),
      ),
    );
    await tester.tap(find.byType(CachedNetworkImage).first);
    await tester.pump();
    expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
  });

  testWidgets('renders video attachment inline when enabled', (tester) async {
    final Attachment attachment = _buildAttachment(
      filename: 'clip.mp4',
      contentType: 'video/mp4',
      url: 'https://cdn.example/clip.mp4',
      width: 640,
      height: 360,
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.byType(AttachmentVideo), findsOneWidget);
  });

  testWidgets('renders voice message player for flagged voice attachments', (
    tester,
  ) async {
    final Float32List samples = Float32List(4410);
    final Uint8List waveformBytes = buildWaveformBytes(samples, 0.1);
    final Attachment attachment = _buildAttachment(
      filename: 'voice-message.wav',
      contentType: 'audio/wav',
      url: 'https://cdn.example/voice.wav',
      duration: 12,
      waveform: base64Encode(waveformBytes),
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
          messageFlags: kMessageFlagVoiceMessage,
        ),
      ),
    );
    expect(find.byType(VoiceMessagePlayer), findsOneWidget);
    expect(find.byType(AttachmentAudio), findsNothing);
    expect(find.textContaining('0:00 /'), findsOneWidget);
  });

  testWidgets('renders audio attachment inline when enabled', (tester) async {
    final Attachment attachment = _buildAttachment(
      filename: 'voice.mp3',
      contentType: 'audio/mpeg',
      url: 'https://cdn.example/voice.mp3',
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.byType(AttachmentAudio), findsOneWidget);
  });

  testWidgets('renders file label when inline media is disabled', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'image.png',
      url: 'https://cdn.example/image.png',
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: false,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.byType(AttachmentFile), findsOneWidget);
  });

  testWidgets('renders file label for image attachment without URL', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'image.png',
      url: '',
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.byType(AttachmentFile), findsOneWidget);
    expect(find.byType(AttachmentImage), findsNothing);
  });

  testWidgets('uses spoiler overlay for spoiler attachments', (tester) async {
    final Attachment attachment = _buildAttachment(
      filename: 'secret.png',
      url: 'https://cdn.example/secret.png',
      flags: attachmentFlagIsSpoiler,
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    final SpoilerOverlay spoilerOverlay = tester.widget<SpoilerOverlay>(
      find.byType(SpoilerOverlay).first,
    );
    expect(spoilerOverlay.isSpoiler, isTrue);
    expect(spoilerOverlay.initiallyRevealed, isFalse);
  });

  testWidgets('renders image grid when there are multiple inline images', (
    tester,
  ) async {
    final List<Attachment> attachments = <Attachment>[
      _buildAttachment(
        filename: 'image-1.png',
        url: 'https://cdn.example/image-1.png',
        width: 640,
        height: 360,
      ),
      _buildAttachment(
        filename: 'image-2.png',
        url: 'https://cdn.example/image-2.png',
        width: 640,
        height: 360,
      ),
    ];
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentListRenderer(
          attachments: attachments,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.byType(AttachmentMediaGrid), findsOneWidget);
    expect(find.byType(AttachmentImage), findsNothing);
  });

  testWidgets(
    'opens attachment media viewer when spoilered grid tile is revealed and tapped',
    (tester) async {
      final List<Attachment> attachments = <Attachment>[
        _buildAttachment(
          filename: 'image-1.png',
          url: 'https://cdn.example/image-1.png',
          width: 640,
          height: 360,
        ),
        _buildAttachment(
          filename: 'secret.png',
          url: 'https://cdn.example/secret.png',
          width: 640,
          height: 360,
          flags: attachmentFlagIsSpoiler,
        ),
      ];
      await tester.pumpWidget(
        _buildTestApp(
          child: AttachmentListRenderer(
            attachments: attachments,
            inlineAttachmentMedia: true,
            dimensionSize: MediaDimensionSize.small,
            revealSpoilers: false,
          ),
        ),
      );
      expect(find.byType(AttachmentMediaGrid), findsOneWidget);
      await tester.tap(find.text('SPOILER'));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(CachedNetworkImage).at(1));
      await tester.pump();
      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
    },
  );

  testWidgets(
    'renders mixed attachments with one grid and remaining media widgets',
    (tester) async {
      final List<Attachment> attachments = <Attachment>[
        _buildAttachment(
          filename: 'image-1.png',
          url: 'https://cdn.example/image-1.png',
          width: 640,
          height: 360,
        ),
        _buildAttachment(
          filename: 'voice.mp3',
          contentType: 'audio/mpeg',
          url: 'https://cdn.example/voice.mp3',
        ),
        _buildAttachment(
          filename: 'image-2.png',
          url: 'https://cdn.example/image-2.png',
          width: 640,
          height: 360,
        ),
      ];
      await tester.pumpWidget(
        _buildTestApp(
          child: AttachmentListRenderer(
            attachments: attachments,
            inlineAttachmentMedia: true,
            dimensionSize: MediaDimensionSize.small,
            revealSpoilers: false,
          ),
        ),
      );
      expect(find.byType(AttachmentMediaGrid), findsOneWidget);
      expect(find.byType(AttachmentAudio), findsOneWidget);
      expect(find.byType(AttachmentRenderer), findsOneWidget);
    },
  );

  testWidgets('grids images and videos together as media tiles', (
    tester,
  ) async {
    final List<Attachment> attachments = <Attachment>[
      _buildAttachment(
        filename: 'image-1.png',
        url: 'https://cdn.example/image-1.png',
        width: 640,
        height: 360,
      ),
      _buildAttachment(
        filename: 'clip.mp4',
        contentType: 'video/mp4',
        url: 'https://cdn.example/clip.mp4',
        width: 640,
        height: 360,
      ),
    ];
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentListRenderer(
          attachments: attachments,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.byType(AttachmentMediaGrid), findsOneWidget);
    expect(find.byType(AttachmentVideo), findsNothing);
  });

  testWidgets('renders expiry footnote text for attachment with expiration', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'report.pdf',
      url: 'https://cdn.example/report.pdf',
      expiresAt: DateTime(2026, 5, 10),
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: AttachmentRenderer(
          attachment: attachment,
          inlineAttachmentMedia: true,
          dimensionSize: MediaDimensionSize.small,
          revealSpoilers: false,
        ),
      ),
    );
    expect(find.textContaining('Expires on'), findsOneWidget);
  });

  testWidgets('forwarded content uses shared attachment renderer', (
    tester,
  ) async {
    final Message message = Message(
      id: 'message-1',
      channelId: 'channel-1',
      authorId: 'user-1',
      authorName: 'User',
      content: '',
      timestamp: DateTime(2026, 5, 9),
    );
    final MessageSnapshot snapshot = MessageSnapshot(
      timestamp: DateTime(2026, 5, 9),
      attachments: [
        _buildAttachment(
          filename: 'clip.mp4',
          contentType: 'video/mp4',
          url: 'https://cdn.example/clip.mp4',
          width: 640,
          height: 360,
        ),
      ],
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: ForwardedMessageContent(
          message: message,
          snapshot: snapshot,
          renderEmbeds: false,
          inlineAttachmentMedia: true,
          revealSpoilers: false,
          chatPreferences: const ChatPreferencesState(),
          spoilerSyncController: FluxerSpoilerSyncController(),
        ),
      ),
    );
    expect(find.byType(AttachmentRenderer), findsOneWidget);
    expect(find.byType(AttachmentVideo), findsOneWidget);
  });
}

Widget _buildTestApp({required Widget child}) {
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
      home: Scaffold(body: child),
    ),
  );
}

Attachment _buildAttachment({
  required String filename,
  required String url,
  String? contentType,
  int flags = 0,
  int? width,
  int? height,
  DateTime? expiresAt,
  int? duration,
  String? waveform,
}) {
  return Attachment(
    id: 'attachment-$filename',
    filename: filename,
    url: url,
    contentType: contentType,
    flags: flags,
    width: width,
    height: height,
    size: 1024,
    expiresAt: expiresAt,
    duration: duration,
    waveform: waveform,
  );
}
