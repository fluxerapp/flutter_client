import 'package:fluxer_app/core/deep_links/deep_link_log_sanitizer.dart';
import 'package:test/test.dart';

void main() {
  group('sanitizeDeepLinkForLog', () {
    test('drops fragment and redacts reset token in query', () {
      final Uri uri = Uri.parse(
        'https://web.fluxer.app/reset?token=secret-token#token=fragment-token',
      );
      expect(
        sanitizeDeepLinkForLog(uri),
        'https://web.fluxer.app/reset?token=%3Credacted%3E',
      );
    });

    test('redacts SSO callback query params', () {
      final Uri uri = Uri.parse(
        'fluxer://auth/sso/callback?code=auth-code&state=csrf-state',
      );
      expect(
        sanitizeDeepLinkForLog(uri),
        'fluxer://auth/sso/callback?code=%3Credacted%3E&state=%3Credacted%3E',
      );
    });

    test('redacts invite and gift path segments', () {
      expect(
        sanitizeDeepLinkForLog(
          Uri.parse('https://web.fluxer.app/invite/abc123'),
        ),
        'https://web.fluxer.app/invite/<redacted>',
      );
      expect(
        sanitizeDeepLinkForLog(Uri.parse('fluxer://gift/xyz789')),
        'fluxer://gift/<redacted>',
      );
    });

    test('keeps non-sensitive query params', () {
      final Uri uri = Uri.parse(
        'https://web.fluxer.app/settings/user?tab=appearance',
      );
      expect(
        sanitizeDeepLinkForLog(uri),
        'https://web.fluxer.app/settings/user?tab=appearance',
      );
    });
  });
}
