import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_media_viewer_utils.dart';
import 'package:fluxer_app/features/ui/media_viewer/attachment_media_viewer.dart';

void main() {
  const String attachmentId = '123456789012345678';
  const String originalUrl =
      'https://fluxerusercontent.com/attachments/$attachmentId/embed_original.png';
  const String proxyUrl =
      'https://fluxerusercontent.com/attachments/$attachmentId/embed_preview.webp?width=400&height=300';
  const String directUrl =
      'https://fluxerusercontent.com/attachments/$attachmentId/photo.png';

  group('embedMediaShareableUrl', () {
    test('prefers embed page URL for gif providers', () {
      const EmbedMedia media = EmbedMedia(
        url: 'https://media.tenor.com/wave.gif',
        proxyUrl: 'https://fluxerusercontent.com/external/sig/v2/wave',
      );
      expect(
        embedMediaShareableUrl(
          media: media,
          embedPageUrl: 'https://tenor.com/view/wave-gif-1',
        ),
        'https://tenor.com/view/wave-gif-1',
      );
    });

    test('falls back to direct media URL when page URL is absent', () {
      const EmbedMedia media = EmbedMedia(url: directUrl, proxyUrl: proxyUrl);
      expect(embedMediaShareableUrl(media: media), directUrl);
    });
  });

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

    test('keeps shareable URL separate from display URL', () {
      const EmbedMedia media = EmbedMedia(
        url: 'https://media.tenor.com/wave.gif',
        proxyUrl: 'https://fluxerusercontent.com/external/sig/v2/wave',
      );
      final AttachmentMediaViewerItem item = buildEmbedMediaViewerItem(
        media: media,
        embedPageUrl: 'https://tenor.com/view/wave-gif-1',
        animated: true,
      );
      expect(item.url, contains('fluxerusercontent.com'));
      expect(item.shareableUrl, 'https://tenor.com/view/wave-gif-1');
    });

    test('downloads the original proxied media, not the display variant', () {
      const EmbedMedia media = EmbedMedia(
        url: 'https://media.klipy.com/wave.gif',
        proxyUrl:
            'https://fluxerusercontent.com/external/sig/https/media.klipy.com/wave.gif',
      );
      final AttachmentMediaViewerItem item = buildEmbedMediaViewerItem(
        media: media,
        embedPageUrl: 'https://klipy.com/gifs/wave',
        animated: true,
      );
      expect(item.url, contains('animated=true'));
      expect(
        item.downloadUrl,
        'https://fluxerusercontent.com/external/sig/https/media.klipy.com/wave.gif',
      );
    });

    test('downloads the direct URL when the embed is not proxied', () {
      const EmbedMedia media = EmbedMedia(url: directUrl);
      final AttachmentMediaViewerItem item = buildEmbedMediaViewerItem(
        media: media,
      );
      expect(item.downloadUrl, directUrl);
    });

    test('downloads the gifv video when one is given', () {
      const EmbedMedia thumbnail = EmbedMedia(
        url: 'https://media.tenor.com/wave.webp',
        proxyUrl:
            'https://fluxerusercontent.com/external/sig/https/media.tenor.com/wave.webp',
      );
      const EmbedMedia video = EmbedMedia(
        url: 'https://media.tenor.com/wave.mp4',
        proxyUrl:
            'https://fluxerusercontent.com/external/sig/https/media.tenor.com/wave.mp4',
      );
      final AttachmentMediaViewerItem item = buildEmbedMediaViewerItem(
        media: thumbnail,
        animated: true,
        downloadMedia: video,
      );
      expect(item.url, contains('wave.webp'));
      expect(
        item.downloadUrl,
        'https://fluxerusercontent.com/external/sig/https/media.tenor.com/wave.mp4',
      );
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
