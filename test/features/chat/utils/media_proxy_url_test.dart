import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/media_dimension_utils.dart';
import 'package:fluxer_app/features/chat/utils/media_proxy_url.dart';

void main() {
  group('buildMediaProxyUrl', () {
    test('appends format and dimensions', () {
      const String input = 'https://cdn.example.com/media/abc/video.mp4';
      final String actual = buildMediaProxyUrl(
        input,
        format: 'webp',
        width: 400,
        height: 225,
      );
      expect(actual, contains('format=webp'));
      expect(actual, contains('width=400'));
      expect(actual, contains('height=225'));
    });

    test('merges with existing query parameters', () {
      const String input = 'https://cdn.example.com/v.mp4?foo=bar&width=100';
      final String actual = buildMediaProxyUrl(
        input,
        format: 'webp',
        width: 200,
      );
      final Uri uri = Uri.parse(actual);
      expect(uri.queryParameters['foo'], 'bar');
      expect(uri.queryParameters['format'], 'webp');
      expect(uri.queryParameters['width'], '200');
    });

    test('returns original for empty string', () {
      expect(buildMediaProxyUrl('', format: 'webp'), '');
    });

    test('returns original for non-http scheme', () {
      const String input = 'blob:https://example.com/uuid';
      expect(buildMediaProxyUrl(input, format: 'webp'), input);
    });
  });

  group('stripMediaProxyFormat', () {
    test('removes format and keeps other params', () {
      final String actual = stripMediaProxyFormat(
        'https://cdn.example.com/a.avif?format=webp&width=400',
      );
      final Uri uri = Uri.parse(actual);
      expect(uri.queryParameters.containsKey('format'), isFalse);
      expect(uri.queryParameters['width'], '400');
    });
  });

  group('buildAttachmentVideoPosterUrl', () {
    test('returns null for blob URL', () {
      expect(
        buildAttachmentVideoPosterUrl(
          proxyOrUrl: 'blob:https://x/uuid',
          attachmentWidth: 1280,
          attachmentHeight: 720,
          layoutDimensions: compactMediaDimensions,
        ),
        isNull,
      );
    });

    test('returns webp URL for https source', () {
      final String? actual = buildAttachmentVideoPosterUrl(
        proxyOrUrl: 'https://cdn.example.com/a.mp4',
        attachmentWidth: 1280,
        attachmentHeight: 720,
        layoutDimensions: compactMediaDimensions,
      );
      expect(actual, isNotNull);
      expect(actual, contains('format=webp'));
    });
  });
}
