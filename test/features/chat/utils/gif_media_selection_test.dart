import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/gif_media_selection.dart';
import 'package:fluxer_dart/export.dart' as sdk;

void main() {
  test('parses GIF media formats from a resolved GIF payload', () {
    final entry = sdk.ResolvedGifEntrySchema.fromJson(const {
      'url': 'https://media.tenor.com/excited-ah.webm',
      'proxy_url': 'https://cdn.example/excited-ah.webm',
      'width': 498,
      'height': 498,
      'media': {
        'webm': {
          'src': 'https://media.tenor.com/excited-ah.webm',
          'proxy_src': 'https://cdn.example/excited-ah.webm',
          'width': 498,
          'height': 498,
        },
        'webp': {
          'src': 'https://media.tenor.com/excited-ah.webp',
          'proxy_src': 'https://cdn.example/excited-ah.webp',
          'width': 498,
          'height': 498,
        },
        'tinygif': {
          'src': 'https://media.tenor.com/excited-ah.gif',
          'proxy_src': 'https://cdn.example/excited-ah.gif',
          'width': 165,
          'height': 165,
        },
      },
    });

    expect(
      entry.media?['webp']?.proxySrc,
      'https://cdn.example/excited-ah.webp',
    );
  });

  test('prefers WebP image media over video media for GIF previews', () {
    const media = {
      'webm': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah.webm',
        proxySrc: 'https://cdn.example/excited-ah.webm',
        width: 498,
        height: 498,
      ),
      'mp4': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah.mp4',
        proxySrc: 'https://cdn.example/excited-ah.mp4',
        width: 498,
        height: 498,
      ),
      'webp': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah.webp',
        proxySrc: 'https://cdn.example/excited-ah.webp',
        width: 498,
        height: 498,
      ),
      'tinygif': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah-small.gif',
        proxySrc: 'https://cdn.example/excited-ah-small.gif',
        width: 165,
        height: 165,
      ),
    };

    final preview = gifPreviewMediaForPicker(
      src: 'https://media.tenor.com/excited-ah.webm',
      proxySrc: 'https://cdn.example/excited-ah.webm',
      width: 498,
      height: 498,
      media: media,
    );

    expect(preview.src, 'https://media.tenor.com/excited-ah.webp');
    expect(preview.proxySrc, 'https://cdn.example/excited-ah.webp');
    expect(preview.width, 498);
    expect(preview.height, 498);
  });

  test('falls back to tiny GIF media before video media', () {
    const media = {
      'tinywebm': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah.webm',
        proxySrc: 'https://cdn.example/excited-ah.webm',
        width: 320,
        height: 228,
      ),
      'tinygif': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah.gif',
        proxySrc: 'https://cdn.example/excited-ah.gif',
        width: 220,
        height: 157,
      ),
    };

    final preview = gifPreviewMediaForPicker(
      src: 'https://media.tenor.com/excited-ah.webm',
      proxySrc: 'https://cdn.example/excited-ah.webm',
      width: 320,
      height: 228,
      media: media,
    );

    expect(preview.src, 'https://media.tenor.com/excited-ah.gif');
    expect(preview.width, 220);
    expect(preview.height, 157);
  });

  test('resolved GIF entries fall back to top-level media when needed', () {
    const entry = sdk.ResolvedGifEntrySchema(
      url: 'https://media.tenor.com/excited-ah.gif',
      proxyUrl: 'https://cdn.example/excited-ah.gif',
      width: 320,
      height: 228,
    );

    final preview = resolvedGifPreviewMediaForPicker(entry);

    expect(preview.src, 'https://media.tenor.com/excited-ah.gif');
    expect(preview.proxySrc, 'https://cdn.example/excited-ah.gif');
    expect(preview.width, 320);
    expect(preview.height, 228);
  });

  test('drops video-only formats and falls back to the source url', () {
    const media = {
      'mp4': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah.mp4',
        proxySrc: 'https://cdn.example/excited-ah.mp4',
        width: 498,
        height: 498,
      ),
      'webm': sdk.GifMediaFormat(
        src: 'https://media.tenor.com/excited-ah.webm',
        proxySrc: 'https://cdn.example/excited-ah.webm',
        width: 498,
        height: 498,
      ),
    };

    final preview = gifPreviewMediaForPicker(
      src: 'https://media.tenor.com/excited-ah.gif',
      proxySrc: 'https://cdn.example/excited-ah.gif',
      width: 320,
      height: 228,
      media: media,
    );

    expect(preview.src, 'https://media.tenor.com/excited-ah.gif');
    expect(preview.proxySrc, 'https://cdn.example/excited-ah.gif');
  });
}
