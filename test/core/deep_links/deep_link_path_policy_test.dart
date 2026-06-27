import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';
import 'package:test/test.dart';

void main() {
  group('isAllowedDeepLinkPath', () {
    test('allows channel, invite, gift, user, and settings paths', () {
      const allowedPaths = [
        '/channels/@me',
        '/channels/123456789012345678/987654321098765432',
        '/invite/abc',
        '/gift/xyz',
        '/users/123456789012345678',
        '/settings/user',
        '/settings/user?tab=appearance',
        '/notifications',
        '/you',
      ];
      for (final String path in allowedPaths) {
        expect(
          isAllowedDeepLinkPath(Uri.parse('https://web.fluxer.app$path')),
          isTrue,
          reason: path,
        );
      }
    });

    test('ignores root, auth, admin, and infra paths', () {
      for (final String path in kIgnoredDeepLinkPathExamples) {
        expect(
          isAllowedDeepLinkPath(Uri.parse('https://web.fluxer.app$path')),
          isFalse,
          reason: path,
        );
      }
    });

    test('rejects paths with blocklisted characters', () {
      expect(hasBlocklistedDeepLinkPathCharacters('/channels/"evil'), isTrue);
      expect(
        hasBlocklistedDeepLinkPathCharacters('/channels/foo\nbar'),
        isTrue,
      );
    });

    test('allows fluxer:// app protocol URLs', () {
      const allowedFluxerUrls = [
        'fluxer://channels/@me',
        'fluxer://channels/123456789012345678/987654321098765432',
        'fluxer://invite/abc',
        'fluxer://gift/xyz',
        'fluxer://users/123456789012345678',
        'fluxer://settings/user',
        'fluxer://settings/user?tab=appearance',
        'fluxer://notifications',
        'fluxer://you',
        'fluxer:/channels/@me',
      ];
      for (final String url in allowedFluxerUrls) {
        expect(isAllowedDeepLinkPath(Uri.parse(url)), isTrue, reason: url);
      }
    });

    test('ignores fluxer:// auth and infra paths', () {
      const ignoredFluxerUrls = [
        'fluxer://auth/sso/callback?code=1&state=2',
        'fluxer://login',
        'fluxer://',
      ];
      for (final String url in ignoredFluxerUrls) {
        expect(isAllowedDeepLinkPath(Uri.parse(url)), isFalse, reason: url);
      }
    });
  });

  group('normalizeAppProtocolDeepLinkUri', () {
    test('maps host-style fluxer URLs to path form', () {
      expect(
        normalizeAppProtocolDeepLinkUri(
          Uri.parse('fluxer://channels/@me/123'),
        ).path,
        '/channels/@me/123',
      );
      expect(
        normalizeAppProtocolDeepLinkUri(Uri.parse('fluxer://invite/abc')).path,
        '/invite/abc',
      );
      expect(
        normalizeAppProtocolDeepLinkUri(
          Uri.parse('fluxer://settings/user?tab=appearance'),
        ),
        Uri(path: '/settings/user', queryParameters: {'tab': 'appearance'}),
      );
    });

    test('leaves https URLs unchanged', () {
      final Uri uri = Uri.parse('https://web.fluxer.app/channels/@me');
      expect(normalizeAppProtocolDeepLinkUri(uri), uri);
    });
  });

  group('normalizeDeepLinkPath', () {
    test('trims trailing slashes and preserves root', () {
      expect(normalizeDeepLinkPath('/channels/@me/'), '/channels/@me');
      expect(normalizeDeepLinkPath('/'), '/');
      expect(normalizeDeepLinkPath(''), '/');
    });
  });
}
