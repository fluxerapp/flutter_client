import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/chat_fullscreen_video_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/domain/media_options_launch_context.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';

const String _testAttachmentImageUrl =
    'https://fluxerusercontent.com/attachments/1427764813854588943/1531388054034460672/CleanShot_2026-07-27_at_19.49.162x.png';
const String _testAttachmentImageFilename =
    'CleanShot_2026-07-27_at_19.49.162x.png';
const String _testAttachmentImageProxyUrl =
    'https://fluxerusercontent.com/attachments/1427764813854588943/1531388054034460672/CleanShot_2026-07-27_at_19.49.162x.webp?width=1200';

void main() {
  group('MediaOptionsLaunchContext', () {
    final DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(0);
    final MessageMediaActionScope actionScope = MessageMediaActionScope(
      message: Message(
        id: 'message-id',
        channelId: 'channel-id',
        authorId: 'author-id',
        authorName: 'Author',
        content: '',
        timestamp: timestamp,
      ),
      permissions: const MessageActionPermissions(
        isOwnMessage: false,
        isDmChannel: false,
        canDelete: false,
        canReport: false,
        canAddReactions: false,
        canPinMessage: false,
        canManageMessages: false,
        canSendMessages: false,
        developerMode: false,
      ),
      callbacks: const MessageActionCallbacks(),
    );

    group('fromVideoLaunchContext', () {
      test('copies attachment metadata and action scope', () {
        const Attachment attachment = Attachment(
          id: 'attachment-id',
          filename: _testAttachmentImageFilename,
          url: _testAttachmentImageUrl,
          proxyUrl: _testAttachmentImageProxyUrl,
          expired: true,
        );
        final ChatFullscreenVideoLaunchContext videoContext =
            ChatFullscreenVideoLaunchContext(
              source: const ChatVideoSource(
                fallbackUrl: _testAttachmentImageUrl,
              ),
              attachment: attachment,
              actionScope: actionScope,
            );

        final MediaOptionsLaunchContext context =
            MediaOptionsLaunchContext.fromVideoLaunchContext(videoContext);

        expect(context.fallbackUrl, _testAttachmentImageUrl);
        expect(context.attachmentId, 'attachment-id');
        expect(context.embedIndex, isNull);
        expect(context.filename, _testAttachmentImageFilename);
        expect(context.proxyUrl, _testAttachmentImageProxyUrl);
        expect(context.isExpired, isTrue);
        expect(context.actionScope, actionScope);
        expect(context.hasOptionsMenu, isTrue);
      });

      test('copies embed metadata and action scope', () {
        final ChatFullscreenVideoLaunchContext videoContext =
            ChatFullscreenVideoLaunchContext(
              source: const ChatVideoSource(
                fallbackUrl: 'https://example.com/video',
              ),
              embedIndex: 2,
              actionScope: actionScope,
            );

        final MediaOptionsLaunchContext context =
            MediaOptionsLaunchContext.fromVideoLaunchContext(videoContext);

        expect(context.fallbackUrl, 'https://example.com/video');
        expect(context.attachmentId, isNull);
        expect(context.embedIndex, 2);
        expect(context.proxyUrl, isNull);
        expect(context.isExpired, isFalse);
        expect(context.actionScope, actionScope);
        expect(context.hasOptionsMenu, isTrue);
      });
    });

    group('fromImageViewerItem', () {
      test('copies item metadata and action scope', () {
        const AttachmentMediaViewerItem item = AttachmentMediaViewerItem(
          url: _testAttachmentImageUrl,
          filename: _testAttachmentImageFilename,
          attachmentId: 'attachment-id',
          embedIndex: 3,
          proxyUrl: _testAttachmentImageProxyUrl,
          isExpired: true,
        );

        final MediaOptionsLaunchContext context =
            MediaOptionsLaunchContext.fromImageViewerItem(
              item,
              actionScope: actionScope,
            );

        expect(context.fallbackUrl, _testAttachmentImageUrl);
        expect(context.attachmentId, 'attachment-id');
        expect(context.embedIndex, 3);
        expect(context.filename, _testAttachmentImageFilename);
        expect(context.proxyUrl, _testAttachmentImageProxyUrl);
        expect(context.isExpired, isTrue);
        expect(context.actionScope, actionScope);
        expect(context.hasOptionsMenu, isTrue);
      });
    });

    group('hasOptionsMenu', () {
      test('returns true when fallbackUrl is non-empty', () {
        const MediaOptionsLaunchContext context = MediaOptionsLaunchContext(
          fallbackUrl: _testAttachmentImageUrl,
        );

        expect(context.hasOptionsMenu, isTrue);
      });

      test('returns true when actionScope is non-null', () {
        final MediaOptionsLaunchContext context = MediaOptionsLaunchContext(
          fallbackUrl: '',
          actionScope: actionScope,
        );

        expect(context.hasOptionsMenu, isTrue);
      });

      test(
        'returns false when neither fallbackUrl nor actionScope are set',
        () {
          const MediaOptionsLaunchContext context = MediaOptionsLaunchContext(
            fallbackUrl: '',
          );

          expect(context.hasOptionsMenu, isFalse);
        },
      );
    });
  });
}
