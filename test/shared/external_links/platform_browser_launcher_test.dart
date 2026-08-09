import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/settings/domain/default_web_browser.dart';
import 'package:fluxer_app/shared/external_links/platform_browser_launcher.dart';

void main() {
  group('browserLaunchUrlForIos', () {
    test('builds chrome launch url for https links', () {
      expect(
        browserLaunchUrlForIos(
          DefaultWebBrowser.chrome,
          Uri.parse('https://example.com/path?q=1#section'),
        ),
        'googlechromes://example.com/path?q=1#section',
      );
    });

    test('builds firefox launch url', () {
      expect(
        browserLaunchUrlForIos(
          DefaultWebBrowser.firefox,
          Uri.parse('https://example.com'),
        ),
        'firefox://open-url?url=https%3A%2F%2Fexample.com',
      );
    });

    test('builds duckduckgo launch url', () {
      expect(
        browserLaunchUrlForIos(
          DefaultWebBrowser.duckDuckGo,
          Uri.parse('https://example.com'),
        ),
        'ddgQuickLink://https://example.com',
      );
    });

    test('builds qwant launch url', () {
      expect(
        browserLaunchUrlForIos(
          DefaultWebBrowser.qwant,
          Uri.parse('https://example.com'),
        ),
        'qwantbrowser://open?url=https%3A%2F%2Fexample.com',
      );
    });
  });

  group('androidBrowserPackageName', () {
    test('maps supported browsers to package names', () {
      expect(
        androidBrowserPackageName(DefaultWebBrowser.chrome),
        'com.android.chrome',
      );
      expect(
        androidBrowserPackageName(DefaultWebBrowser.qwant),
        'com.qwant.liberty',
      );
      expect(androidBrowserPackageName(DefaultWebBrowser.inApp), isNull);
    });
  });
}
