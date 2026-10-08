import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/instance/instance_endpoints.dart';
import 'package:fluxer_app/core/instance/well_known_compat.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/well_known_fixture.dart';

void main() {
  group('InstanceConfigSnapshot.fromWellKnown', () {
    test('uses api_public for official Fluxer instead of api_client', () {
      final WellKnownFluxerResponse wellKnown = parseWellKnownFluxer(
        <String, dynamic>{
          'api_code_version': 1,
          'endpoints': <String, dynamic>{
            'api': 'https://fluxer.com/api',
            'api_client': 'https://fluxer.com/api/v1',
            'api_public': 'https://fluxer.com/api',
            'gateway': 'wss://gateway.fluxer.com',
            'media': 'https://fluxerusercontent.com',
            'static_cdn': 'https://fluxerstatic.com',
            'marketing': 'https://fluxer.com',
            'admin': 'https://admin.fluxer.com',
            'invite': 'https://fluxer.gg',
            'gift': 'https://fluxer.gift',
            'webapp': 'https://web.fluxer.com',
          },
          'captcha': <String, dynamic>{
            'provider': 'none',
            'hcaptcha_site_key': null,
            'turnstile_site_key': null,
          },
          'features': <String, dynamic>{
            'voice_enabled': true,
            'stripe_enabled': true,
            'premium_enabled': true,
            'stripe_serviceable': true,
            'self_hosted': false,
            'presigned_attachment_uploads': true,
            'emails_enabled': true,
          },
          'registration': <String, dynamic>{
            'mode': 'open',
            'admin_registration_urls_enabled': true,
          },
          'community': <String, dynamic>{
            'single_community': false,
            'single_community_guild_id': null,
            'direct_messages_disabled': false,
            'guild_create_access': true,
          },
          'services': <String, dynamic>{
            'gif_enabled': true,
            'youtube_enabled': true,
            'bluesky_enabled': true,
          },
          'gif': <String, dynamic>{
            'provider': 'klipy',
            'display_name': 'KLIPY',
            'attribution_required': true,
          },
          'sso': <String, dynamic>{
            'enabled': false,
            'enforced': false,
            'display_name': null,
            'redirect_uri': '',
          },
          'limits': <String, dynamic>{
            'version': 2,
            'traitDefinitions': <String>[],
            'rules': <Map<String, dynamic>>[],
            'defaultsHash': 'hash',
          },
          'push': <String, dynamic>{'public_vapid_key': null},
          'app_public': <String, dynamic>{
            'branding': <String, dynamic>{
              'product_name': 'Fluxer',
              'icon_url': null,
              'symbol_url': null,
              'logo_url': null,
              'wordmark_url': null,
              'favicon_url': null,
              'theme_color': null,
              'premium_product_name': 'Plutonium',
              'premium_info_url': null,
            },
            'setup': <String, dynamic>{'configured': true, 'admin_url': null},
            'legal': <String, dynamic>{'terms_url': null, 'privacy_url': null},
            'registration': <String, dynamic>{'collect_date_of_birth': true},
          },
        },
      );

      final InstanceConfigSnapshot snapshot =
          InstanceConfigSnapshot.fromWellKnown(
            wellKnown: wellKnown,
            normalizer: const InstanceEndpointNormalizer(),
          );

      expect(snapshot.apiBaseUrl, InstanceConstants.defaultApiBaseUrl);
      expect(snapshot.gatewayUrl, InstanceConstants.defaultGatewayUrl);
      expect(snapshot.displayDomain, 'fluxer.com');
    });
  });

  group('InstanceConfigSnapshot JSON round-trip', () {
    tearDown(InstanceEndpoints.resetToDefaults);

    test('restores well-known media endpoints after jsonDecode', () {
      final InstanceConfigSnapshot restored = InstanceConfigSnapshot.fromJson(
        selfHostedInstanceSnapshot().toJson(),
      );

      expect(restored.wellKnown, isNotNull);
      expect(restored.wellKnown!.endpoints.media, 'https://chat.example/media');
      expect(
        restored.wellKnown!.endpoints.staticCdn,
        'https://chat.example/static',
      );

      restored.apply();
      expect(InstanceEndpoints.media, 'https://chat.example/media');
      expect(InstanceEndpoints.staticCdn, 'https://chat.example/static');
    });

    test('restores well_known cached before the premium fields existed', () {
      final Map<String, dynamic> wellKnown =
          jsonDecode(
                jsonEncode(
                  wellKnownFixture(
                    media: 'https://chat.example/media',
                    staticCdn: 'https://chat.example/static',
                  ).toJson(),
                ),
              )
              as Map<String, dynamic>;
      (wellKnown['features'] as Map<String, dynamic>)
        ..remove('premium_enabled')
        ..remove('stripe_serviceable')
        ..remove('phone_verification_enabled');
      ((wellKnown['app_public'] as Map<String, dynamic>)['branding']
              as Map<String, dynamic>)
          .remove('premium_product_name');

      final InstanceConfigSnapshot restored = InstanceConfigSnapshot.fromJson(
        jsonEncode(<String, dynamic>{
          'api_base_url': 'https://chat.example/api',
          'gateway_url': 'wss://chat.example/gateway',
          'display_domain': 'chat.example',
          'well_known': wellKnown,
        }),
      );

      expect(restored.wellKnown?.features.premiumEnabled, isFalse);
      expect(restored.wellKnown?.features.stripeServiceable, isFalse);
      expect(restored.wellKnown?.features.phoneVerificationEnabled, isFalse);
      expect(restored.wellKnown?.endpoints.media, 'https://chat.example/media');
    });

    test('drops unreadable well_known without losing the instance URL', () {
      final InstanceConfigSnapshot restored = InstanceConfigSnapshot.fromJson(
        jsonEncode(<String, dynamic>{
          'api_base_url': 'https://chat.example/api',
          'gateway_url': 'wss://chat.example/gateway',
          'display_domain': 'chat.example',
          'well_known': <String, dynamic>{'nope': true},
        }),
      );

      expect(restored.apiBaseUrl, 'https://chat.example/api');
      expect(restored.wellKnown, isNull);
    });
  });
}
