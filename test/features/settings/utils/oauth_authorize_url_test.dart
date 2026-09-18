import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/features/settings/utils/oauth_authorize_url.dart';

void main() {
  group('resolveOAuthAuthorizeOrigin', () {
    test('prefers marketing URL over web app and display domain', () {
      expect(
        resolveOAuthAuthorizeOrigin(
          displayDomain: 'api.example.com',
          marketingUrl: 'https://fluxer.app/',
          webAppUrl: 'https://app.example.com',
        ),
        'https://fluxer.app',
      );
    });

    test('falls back to web app then https display domain', () {
      expect(
        resolveOAuthAuthorizeOrigin(
          displayDomain: 'example.com',
          webAppUrl: 'https://app.example.com/',
        ),
        'https://app.example.com',
      );
      expect(
        resolveOAuthAuthorizeOrigin(displayDomain: 'example.com'),
        'https://example.com',
      );
    });
  });

  group('buildOAuthAuthorizeUrl', () {
    test('returns empty when no scopes are selected', () {
      expect(
        buildOAuthAuthorizeUrl(
          origin: 'https://fluxer.app',
          clientId: '1',
          scopes: const [],
          botRequireCodeGrant: false,
        ),
        '',
      );
    });

    test('builds bot-only URL without redirect or code grant', () {
      final Uri uri = Uri.parse(
        buildOAuthAuthorizeUrl(
          origin: 'https://fluxer.app',
          clientId: '42',
          scopes: const ['bot'],
          botRequireCodeGrant: false,
        ),
      );
      expect(uri.origin, 'https://fluxer.app');
      expect(uri.path, '/oauth2/authorize');
      expect(uri.queryParameters['client_id'], '42');
      expect(uri.queryParameters['scope'], 'bot');
      expect(uri.queryParameters.containsKey('redirect_uri'), isFalse);
      expect(uri.queryParameters.containsKey('response_type'), isFalse);
      expect(uri.queryParameters.containsKey('permissions'), isFalse);
    });

    test('requires redirect when code grant is on for bot-only', () {
      expect(
        buildOAuthAuthorizeUrl(
          origin: 'https://fluxer.app',
          clientId: '42',
          scopes: const ['bot'],
          botRequireCodeGrant: true,
        ),
        '',
      );
    });

    test('adds redirect and response_type=code when a redirect is set', () {
      final Uri uri = Uri.parse(
        buildOAuthAuthorizeUrl(
          origin: 'https://fluxer.app',
          clientId: '42',
          scopes: const ['identify', 'email'],
          botRequireCodeGrant: false,
          redirectUri: 'https://example.com/callback',
        ),
      );
      expect(uri.queryParameters['scope'], 'identify email');
      expect(
        uri.queryParameters['redirect_uri'],
        'https://example.com/callback',
      );
      expect(uri.queryParameters['response_type'], 'code');
    });

    test('includes OR of selected bot permission bits', () {
      final int bits = oauthBotPermissionsValue([
        Permission.sendMessages.value,
        Permission.manageGuild.value,
      ]);
      final Uri uri = Uri.parse(
        buildOAuthAuthorizeUrl(
          origin: 'https://fluxer.app',
          clientId: '42',
          scopes: const ['bot'],
          botRequireCodeGrant: false,
          botPermissions: bits,
        ),
      );
      expect(
        uri.queryParameters['permissions'],
        (Permission.sendMessages.value | Permission.manageGuild.value)
            .toString(),
      );
    });
  });
}
