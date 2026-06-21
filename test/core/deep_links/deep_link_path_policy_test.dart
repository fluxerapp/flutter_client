import 'package:test/test.dart';
import 'package:fluxer_app/core/deep_links/deep_link_path_policy.dart';

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
      expect(hasBlocklistedDeepLinkPathCharacters('/channels/foo\nbar'), isTrue);
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
