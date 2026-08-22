import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/embed_youtube_utils.dart';

Embed _youtubeEmbed({
  String? providerUrl,
  EmbedMedia? video,
  EmbedMedia? thumbnail,
}) {
  return Embed(
    type: EmbedType.video,
    url: 'https://www.youtube.com/watch?v=abc',
    providerUrl: providerUrl ?? 'https://www.youtube.com',
    video:
        video ??
        const EmbedMedia(
          url: 'https://www.youtube.com/embed/abc',
          proxyUrl: 'https://proxy.example.com/video',
          width: 1280,
          height: 720,
        ),
    thumbnail:
        thumbnail ??
        const EmbedMedia(
          url: 'https://img.example.com/thumb.jpg',
          proxyUrl: 'https://proxy.example.com/thumb.jpg',
          width: 640,
          height: 360,
        ),
  );
}

extension on Embed {
  Embed copyWithProviderUrl(String? providerUrl) {
    return Embed(
      type: type,
      url: url,
      providerUrl: providerUrl,
      providerName: providerName,
      video: video,
      thumbnail: thumbnail,
    );
  }
}

void main() {
  group('getUrlHostname', () {
    test('returns hostname for valid URLs', () {
      expect(
        getUrlHostname('https://www.youtube.com/watch?v=abc'),
        'www.youtube.com',
      );
    });

    test('returns null for invalid URLs', () {
      expect(getUrlHostname('not-a-url'), isNull);
      expect(getUrlHostname(null), isNull);
    });
  });

  group('isYouTubeEmbed', () {
    test('is true when provider URL is www.youtube.com', () {
      expect(isYouTubeEmbed(_youtubeEmbed()), isTrue);
    });

    test('is false for other provider hosts', () {
      expect(
        isYouTubeEmbed(
          _youtubeEmbed().copyWithProviderUrl('https://youtube.com'),
        ),
        isFalse,
      );
      expect(
        isYouTubeEmbed(
          _youtubeEmbed().copyWithProviderUrl('https://vimeo.com'),
        ),
        isFalse,
      );
    });

    test('is false without provider URL', () {
      expect(
        isYouTubeEmbed(
          _youtubeEmbed().copyWithProviderUrl(null),
        ),
        isFalse,
      );
    });
  });

  group('isValidEmbedMedia', () {
    test('requires proxy URL, source URL, and dimensions', () {
      expect(
        isValidEmbedMedia(
          const EmbedMedia(
            url: 'https://www.youtube.com/embed/abc',
            proxyUrl: 'https://proxy.example.com/video',
            width: 1280,
            height: 720,
          ),
        ),
        isTrue,
      );
      expect(
        isValidEmbedMedia(
          const EmbedMedia(url: 'https://www.youtube.com/embed/abc'),
        ),
        isFalse,
      );
    });
  });

  group('canRenderYouTubeEmbed', () {
    test('requires provider, valid video, and thumbnail proxy URL', () {
      expect(canRenderYouTubeEmbed(_youtubeEmbed()), isTrue);
    });

    test('is false without thumbnail proxy URL', () {
      expect(
        canRenderYouTubeEmbed(
          _youtubeEmbed(
            thumbnail: const EmbedMedia(
              url: 'https://img.example.com/thumb.jpg',
              width: 640,
              height: 360,
            ),
          ),
        ),
        isFalse,
      );
    });
  });

  group('buildYouTubeAutoplayEmbedUrl', () {
    test('adds autoplay and origin params like desktop web context', () {
      final String url = buildYouTubeAutoplayEmbedUrl(
        'https://www.youtube.com/embed/abc?rel=0',
        pageOrigin: 'https://web.fluxer.app',
      );
      final Uri uri = Uri.parse(url);
      expect(uri.path, '/embed/abc');
      expect(uri.queryParameters['rel'], '0');
      expect(uri.queryParameters['autoplay'], '1');
      expect(uri.queryParameters['auto_play'], '1');
      expect(uri.queryParameters['origin'], 'https://web.fluxer.app');
    });
  });

  group('resolveYouTubeEmbedVideoUrl', () {
    test('prefers video URL over embed URL', () {
      final String? url = resolveYouTubeEmbedVideoUrl(
        _youtubeEmbed(),
        pageOrigin: 'https://web.fluxer.app',
      );
      expect(url, contains('autoplay=1'));
      expect(url, contains('auto_play=1'));
      expect(url, contains('origin=https'));
      expect(url, startsWith('https://www.youtube.com/embed/abc'));
    });
  });
}
