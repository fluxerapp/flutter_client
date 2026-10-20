import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/embeds/embed_render_utils.dart';

void main() {
  group('shouldRenderMediaOnlyAudioEmbed', () {
    const Embed mediaOnly = Embed(
      type: EmbedType.audio,
      url: 'https://cdn.example.test/song.mp3',
      audio: EmbedMedia(
        url: 'https://cdn.example.test/song.mp3',
        proxyUrl: 'https://proxy.example.test/song.mp3',
      ),
    );

    test('is true for a direct audio link embed', () {
      expect(shouldRenderMediaOnlyAudioEmbed(mediaOnly), isTrue);
    });

    test('is false when the embed has rich fields', () {
      const Embed rich = Embed(
        type: EmbedType.audio,
        title: 'A track',
        url: 'https://cdn.example.test/song.mp3',
        audio: EmbedMedia(
          url: 'https://cdn.example.test/song.mp3',
          proxyUrl: 'https://proxy.example.test/song.mp3',
        ),
      );
      expect(shouldRenderMediaOnlyAudioEmbed(rich), isFalse);
    });

    test('is false without a proxied audio url', () {
      const Embed missingProxy = Embed(
        type: EmbedType.audio,
        url: 'https://cdn.example.test/song.mp3',
        audio: EmbedMedia(url: 'https://cdn.example.test/song.mp3'),
      );
      expect(shouldRenderMediaOnlyAudioEmbed(missingProxy), isFalse);
    });
  });
}
