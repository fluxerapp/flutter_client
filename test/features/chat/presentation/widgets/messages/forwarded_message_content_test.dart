import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/embeds/embed_image.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/forwarded_message_content.dart';
import 'package:fluxer_app/features/chat/providers/pickers/favorite_media_provider.dart';
import 'package:fluxer_app/features/chat/utils/save_message_media_favorite.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../../helpers/test_l10n.dart';
import '../../../../../helpers/wide_layout_test_sizes.dart';

const String _channelId = 'channel-1';
const String _messageId = 'message-1';

void main() {
  testWidgets(
    'snapshot attachment forwards against the forwarded message by id',
    (tester) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final Attachment attachment = _imageAttachment(filename: 'image.png');
      final MessageSnapshot snapshot = MessageSnapshot(
        timestamp: DateTime(2026, 5, 9),
        attachments: [attachment],
      );

      await tester.pumpWidget(
        _buildTestApp(child: _content(snapshot: snapshot, renderEmbeds: false)),
      );

      final AttachmentImage image = tester.widget<AttachmentImage>(
        find.byType(AttachmentImage),
      );
      expect(image.channelId, _channelId);
      expect(image.messageId, _messageId);
      expect(image.imageGallery, isNotNull);
      expect(image.imageGallery!.single.id, attachment.id);

      await tester.tap(find.byType(CachedNetworkImage).first);
      await tester.pump();

      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
      expect(find.byTooltip(_forwardTooltip(tester)), findsOneWidget);
    },
  );

  testWidgets(
    'snapshot embeds forward by their position within the snapshot embeds',
    (tester) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final MessageSnapshot snapshot = MessageSnapshot(
        timestamp: DateTime(2026, 5, 9),
        embeds: const [
          Embed(
            type: EmbedType.image,
            image: EmbedMedia(
              url: 'https://cdn.example/embed-0.png',
              width: 400,
              height: 300,
            ),
          ),
          Embed(
            type: EmbedType.image,
            image: EmbedMedia(
              url: 'https://cdn.example/embed-1.png',
              width: 400,
              height: 300,
            ),
          ),
        ],
      );

      await tester.pumpWidget(
        _buildTestApp(child: _content(snapshot: snapshot, renderEmbeds: true)),
      );

      final List<EmbedImage> embeds = tester
          .widgetList<EmbedImage>(find.byType(EmbedImage))
          .toList();
      expect(embeds, hasLength(2));
      expect(embeds[0].embedIndex, 0);
      expect(embeds[1].embedIndex, 1);
      for (final EmbedImage embed in embeds) {
        expect(embed.channelId, _channelId);
        expect(embed.messageId, _messageId);
      }

      await tester.tap(find.byType(CachedNetworkImage).first);
      await tester.pump();

      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
      expect(find.byTooltip(_forwardTooltip(tester)), findsOneWidget);
    },
  );

  testWidgets(
    'snapshot media exposes the media action scope and viewer favorite button',
    (tester) async {
      tester.view.physicalSize = kWideTestViewportSize;
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      final Attachment attachment = _imageAttachment(filename: 'image.png');
      final MessageSnapshot snapshot = MessageSnapshot(
        timestamp: DateTime(2026, 5, 9),
        attachments: [attachment],
      );
      final MessageMediaActionScope scope = MessageMediaActionScope(
        message: Message(
          id: _messageId,
          channelId: _channelId,
          authorId: 'user-1',
          authorName: 'User',
          content: '',
          timestamp: DateTime(2026, 5, 9),
          attachments: [attachment],
          messageSnapshots: [snapshot],
        ),
        permissions: const MessageActionPermissions(
          isOwnMessage: false,
          isDmChannel: true,
          canDelete: false,
          canReport: false,
          canAddReactions: false,
          canPinMessage: false,
          canManageMessages: false,
          canSendMessages: true,
          developerMode: false,
        ),
        callbacks: const MessageActionCallbacks(),
      );

      await tester.pumpWidget(
        _buildTestApp(
          overrides: [
            favoriteMemesProvider.overrideWith((ref) => Stream.value(const [])),
          ],
          child: _content(
            snapshot: snapshot,
            renderEmbeds: false,
            mediaActionScope: scope,
          ),
        ),
      );

      final AttachmentImage image = tester.widget<AttachmentImage>(
        find.byType(AttachmentImage),
      );
      expect(image.mediaActionScope, same(scope));

      await tester.tap(find.byType(CachedNetworkImage).first);
      await tester.pump();

      expect(find.byType(AttachmentMediaViewerShell), findsOneWidget);
      expect(find.byType(SavedMediaFavoriteToolbarButton), findsOneWidget);
    },
  );
}

String _forwardTooltip(WidgetTester tester) {
  return FluxerLocalizations.of(
    tester.element(find.byType(AttachmentMediaViewerShell)),
  ).mediaViewerForward;
}

Widget _content({
  required MessageSnapshot snapshot,
  required bool renderEmbeds,
  MessageMediaActionScope? mediaActionScope,
}) {
  return ForwardedMessageContent(
    message: Message(
      id: _messageId,
      channelId: _channelId,
      authorId: 'user-1',
      authorName: 'User',
      content: '',
      timestamp: DateTime(2026, 5, 9),
    ),
    snapshot: snapshot,
    renderEmbeds: renderEmbeds,
    inlineAttachmentMedia: true,
    revealSpoilers: false,
    chatPreferences: const ChatPreferencesState(),
    spoilerSyncController: FluxerSpoilerSyncController(),
    mediaActionScope: mediaActionScope,
  );
}

Attachment _imageAttachment({required String filename}) {
  return Attachment(
    id: 'attachment-$filename',
    filename: filename,
    url: 'https://cdn.example/$filename',
    width: 640,
    height: 360,
    size: 1024,
  );
}

Widget _buildTestApp({
  required Widget child,
  List<Override> overrides = const [],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: SingleChildScrollView(child: child)),
    ),
  );
}
