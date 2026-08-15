import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/hdr_aware_image_url.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

void main() {
  group('hdrImageProxyFormatAction', () {
    test('STANDARD always requests webp', () {
      expect(
        hdrImageProxyFormatAction(
          mode: HdrDisplayMode.standard,
          contentType: 'image/avif',
        ),
        HdrImageProxyFormatAction.setWebp,
      );
      expect(
        hdrImageProxyFormatAction(
          mode: HdrDisplayMode.standard,
          contentType: 'image/jpeg',
        ),
        HdrImageProxyFormatAction.setWebp,
      );
    });

    test('FULL strips format for native HDR types', () {
      expect(
        hdrImageProxyFormatAction(
          mode: HdrDisplayMode.full,
          contentType: 'image/avif',
        ),
        HdrImageProxyFormatAction.stripFormat,
      );
      expect(
        hdrImageProxyFormatAction(
          mode: HdrDisplayMode.full,
          contentType: 'image/heic; codecs=hevc',
        ),
        HdrImageProxyFormatAction.stripFormat,
      );
      expect(
        hdrImageProxyFormatAction(
          mode: HdrDisplayMode.full,
          contentType: 'image/jxl',
        ),
        HdrImageProxyFormatAction.stripFormat,
      );
    });

    test('FULL leaves jpeg and unknown types unchanged', () {
      expect(
        hdrImageProxyFormatAction(
          mode: HdrDisplayMode.full,
          contentType: 'image/jpeg',
        ),
        HdrImageProxyFormatAction.unchanged,
      );
      expect(
        hdrImageProxyFormatAction(mode: HdrDisplayMode.full),
        HdrImageProxyFormatAction.unchanged,
      );
    });
  });

  group('buildHdrAwareImageUrl', () {
    test('STANDARD appends webp', () {
      final String actual = buildHdrAwareImageUrl(
        url: 'https://cdn.example.com/a.avif',
        mode: HdrDisplayMode.standard,
        contentType: 'image/avif',
      );
      expect(Uri.parse(actual).queryParameters['format'], 'webp');
    });

    test('FULL strips format from native HDR urls', () {
      final String actual = buildHdrAwareImageUrl(
        url: 'https://cdn.example.com/a.avif?format=webp&width=400',
        mode: HdrDisplayMode.full,
        contentType: 'image/avif',
      );
      final Uri uri = Uri.parse(actual);
      expect(uri.queryParameters.containsKey('format'), isFalse);
      expect(uri.queryParameters['width'], '400');
    });
  });

  group('buildHdrAwareDisplayImageUrl', () {
    const String original = 'https://cdn.example.com/attachments/1/cat.gif';
    const String proxy =
        'https://cdn.example.com/attachments/1/cat.gif?width=400';
    const String animated =
        'https://cdn.example.com/attachments/1/cat.gif?format=webp&animated=true';

    test('keeps animated=true instead of falling back to proxyUrl', () {
      final String actual = buildHdrAwareDisplayImageUrl(
        url: animated,
        proxyUrl: proxy,
        mode: HdrDisplayMode.standard,
        contentType: 'image/gif',
      );
      final Uri uri = Uri.parse(actual);
      expect(uri.queryParameters['animated'], 'true');
      expect(uri.queryParameters['format'], 'webp');
    });

    test('uses proxyUrl for still images', () {
      final String actual = buildHdrAwareDisplayImageUrl(
        url: original,
        proxyUrl: proxy,
        mode: HdrDisplayMode.standard,
        contentType: 'image/gif',
      );
      expect(actual, contains('width=400'));
      expect(Uri.parse(actual).queryParameters['format'], 'webp');
    });
  });
}
