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

  test('prefers animated webp renditions over gif and video media', () {
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

  test('picks KLIPY size-prefixed image renditions over the video source', () {
    const media = {
      'webm': sdk.GifMediaFormat(
        src: 'https://static.klipy.com/excited-ah-hd.webm',
        proxySrc: 'https://cdn.example/excited-ah-hd.webm',
        width: 498,
        height: 498,
      ),
      'mp4': sdk.GifMediaFormat(
        src: 'https://static.klipy.com/excited-ah-hd.mp4',
        proxySrc: 'https://cdn.example/excited-ah-hd.mp4',
        width: 498,
        height: 498,
      ),
      'mediumwebp': sdk.GifMediaFormat(
        src: 'https://static.klipy.com/excited-ah-md.webp',
        proxySrc: 'https://cdn.example/excited-ah-md.webp',
        width: 320,
        height: 228,
      ),
      'nanogif': sdk.GifMediaFormat(
        src: 'https://static.klipy.com/excited-ah-xs.gif',
        proxySrc: 'https://cdn.example/excited-ah-xs.gif',
        width: 90,
        height: 64,
      ),
    };

    final preview = gifPreviewMediaForPicker(
      src: 'https://static.klipy.com/excited-ah-hd.webm',
      proxySrc: 'https://cdn.example/excited-ah-hd.webm',
      width: 498,
      height: 498,
      media: media,
    );

    expect(preview.src, 'https://static.klipy.com/excited-ah-md.webp');
    expect(preview.proxySrc, 'https://cdn.example/excited-ah-md.webp');
    expect(preview.width, 320);
    expect(preview.height, 228);
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
