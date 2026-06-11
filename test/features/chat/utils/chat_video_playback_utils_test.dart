import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/chat_video_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/chat_video_playback_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';

void main() {
  group('resolveChatVideoAspectRatio', () {
    test('returns ratio from width and height', () {
      expect(
        resolveChatVideoAspectRatio(width: 1920, height: 1080),
        closeTo(1920 / 1080, 0.001),
      );
    });

    test('falls back to 16:9 when dimensions are missing', () {
      expect(resolveChatVideoAspectRatio(), kDefaultChatVideoAspectRatio);
      expect(
        resolveChatVideoAspectRatio(width: 0, height: 720),
        kDefaultChatVideoAspectRatio,
      );
    });
  });

  group('isYouTubeUrl', () {
    test('detects youtube.com hosts', () {
      expect(isYouTubeUrl('https://www.youtube.com/watch?v=abc'), isTrue);
    });

    test('detects youtu.be hosts', () {
      expect(isYouTubeUrl('https://youtu.be/abc'), isTrue);
    });

    test('returns false for non-YouTube URLs', () {
      expect(isYouTubeUrl('https://cdn.example.com/video.mp4'), isFalse);
    });
  });

  group('ChatVideoSource.fromEmbed', () {
    test('maps video, thumbnail, and page URL fields', () {
      const Embed embed = Embed(
        type: EmbedType.video,
        url: 'https://www.youtube.com/watch?v=abc',
        video: EmbedMedia(
          url: 'https://www.youtube.com/watch?v=abc',
          proxyUrl: 'https://proxy.example.com/video',
          width: 1280,
          height: 720,
        ),
        thumbnail: EmbedMedia(
          url: 'https://img.example.com/thumb.jpg',
          proxyUrl: 'https://proxy.example.com/thumb.jpg',
          width: 640,
          height: 360,
        ),
      );
      final ChatVideoSource source = ChatVideoSource.fromEmbed(embed);
      expect(source.directMediaUrl, 'https://proxy.example.com/video');
      expect(source.pageUrl, 'https://www.youtube.com/watch?v=abc');
      expect(source.posterUrl, 'https://proxy.example.com/thumb.jpg');
      expect(source.width, 1280);
      expect(source.height, 720);
      expect(source.fallbackUrl, 'https://www.youtube.com/watch?v=abc');
      expect(source.hasPlayableContent, isTrue);
    });

    test('uses thumbnail dimensions when video dimensions are absent', () {
      const Embed embed = Embed(
        type: EmbedType.video,
        url: 'https://example.com/watch',
        thumbnail: EmbedMedia(url: 'https://img.example.com/thumb.jpg'),
      );
      final ChatVideoSource source = ChatVideoSource.fromEmbed(embed);
      expect(source.directMediaUrl, isNull);
      expect(source.pageUrl, 'https://example.com/watch');
      expect(source.posterUrl, 'https://img.example.com/thumb.jpg');
    });
  });

  group('ChatVideoSource.fromAttachment', () {
    test('maps attachment fields and builds poster URL', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'clip.mp4',
        url: 'https://cdn.example.com/clip.mp4',
        proxyUrl: 'https://proxy.example.com/clip.mp4',
        width: 1920,
        height: 1080,
        placeholder: 'thumbhash',
      );
      final ChatVideoSource source = ChatVideoSource.fromAttachment(
        attachment,
        compactMediaDimensions,
      );
      expect(source.directMediaUrl, 'https://cdn.example.com/clip.mp4');
      expect(source.posterUrl, isNotNull);
      expect(source.posterUrl, contains('format=webp'));
      expect(source.placeholder, 'thumbhash');
      expect(source.width, 1920);
      expect(source.height, 1080);
      expect(source.fallbackUrl, 'https://cdn.example.com/clip.mp4');
      expect(source.hasPlayableContent, isTrue);
    });

    test('reports no playable content for empty URL', () {
      const Attachment attachment = Attachment(
        id: '1',
        filename: 'clip.mp4',
        url: '',
      );
      final ChatVideoSource source = ChatVideoSource.fromAttachment(
        attachment,
        compactMediaDimensions,
      );
      expect(source.hasPlayableContent, isFalse);
    });
  });

  group('resolvePlaybackUrl', () {
    test('returns direct media URL for non-YouTube sources', () async {
      const ChatVideoSource source = ChatVideoSource(
        directMediaUrl: 'https://cdn.example.com/video.mp4',
        fallbackUrl: 'https://cdn.example.com/video.mp4',
      );
      final String url = await resolvePlaybackUrl(source);
      expect(url, 'https://cdn.example.com/video.mp4');
    });

    test('throws when no URL is available', () async {
      const ChatVideoSource source = ChatVideoSource(fallbackUrl: '');
      expect(resolvePlaybackUrl(source), throwsA(isA<StateError>()));
    });
  });
}
