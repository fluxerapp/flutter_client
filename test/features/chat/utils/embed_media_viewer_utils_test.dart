import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/embed_media_viewer_utils.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';

void main() {
  const String attachmentId = '123456789012345678';
  const String originalUrl =
      'https://fluxerusercontent.com/attachments/$attachmentId/embed_original.png';
  const String proxyUrl =
      'https://fluxerusercontent.com/attachments/$attachmentId/embed_preview.webp?width=400&height=300';
  const String directUrl =
      'https://fluxerusercontent.com/attachments/$attachmentId/photo.png';

  group('embedMediaEffectiveUrl', () {
    test('prefers proxy URL when present', () {
      const EmbedMedia media = EmbedMedia(url: originalUrl, proxyUrl: proxyUrl);
      expect(embedMediaEffectiveUrl(media), proxyUrl);
    });

    test('falls back to direct URL', () {
      const EmbedMedia media = EmbedMedia(url: directUrl);
      expect(embedMediaEffectiveUrl(media), directUrl);
    });
  });

  group('canOpenEmbedMediaViewer', () {
    test('returns false when URL is empty', () {
      const EmbedMedia media = EmbedMedia(url: '');
      expect(canOpenEmbedMediaViewer(media), isFalse);
    });

    test('returns true when URL is present', () {
      const EmbedMedia media = EmbedMedia(url: directUrl);
      expect(canOpenEmbedMediaViewer(media), isTrue);
    });
  });

  group('buildEmbedMediaViewerItem', () {
    test('maps media fields and uses embed title for filename', () {
      const EmbedMedia media = EmbedMedia(
        url: directUrl,
        width: 800,
        height: 600,
      );
      final AttachmentMediaViewerItem item = buildEmbedMediaViewerItem(
        media: media,
        title: 'Sunset',
      );
      expect(item.url, directUrl);
      expect(item.filename, 'Sunset');
      expect(item.width, 800);
      expect(item.height, 600);
    });

    test('uses the proxy animated webp for an animated embed', () {
      const EmbedMedia media = EmbedMedia(url: directUrl, proxyUrl: proxyUrl);
      final AttachmentMediaViewerItem item = buildEmbedMediaViewerItem(
        media: media,
        animated: true,
      );
      expect(item.url, contains('format=webp'));
      expect(item.url, contains('animated=true'));
    });
  });

  group('resolveEmbedMediaViewerFilename', () {
    test('uses title when provided', () {
      expect(
        resolveEmbedMediaViewerFilename(url: directUrl, title: 'Custom title'),
        'Custom title',
      );
    });

    test('uses last URL path segment when title is absent', () {
      expect(
        resolveEmbedMediaViewerFilename(
          url:
              'https://fluxerusercontent.com/attachments/$attachmentId/album/photo.png',
        ),
        'photo.png',
      );
    });

    test('falls back to image when URL has no path segments', () {
      expect(
        resolveEmbedMediaViewerFilename(url: 'https://fluxerusercontent.com/'),
        'image',
      );
    });
  });
}
