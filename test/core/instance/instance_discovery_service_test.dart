import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_discovery_service.dart';

void main() {
  group('InstanceDiscoveryService', () {
    Map<String, dynamic> buildDiscovery({int apiCodeVersion = 1}) {
      return <String, dynamic>{
        'api_code_version': apiCodeVersion,
        'endpoints': <String, dynamic>{
          'api': 'https://chat.example.com/api',
          'api_client': 'https://chat.example.com/v1',
          'api_public': 'https://chat.example.com/api',
          'gateway': 'wss://gateway.chat.example.com',
          'media': 'https://media.chat.example.com',
          'static_cdn': 'https://static.chat.example.com',
          'marketing': 'https://chat.example.com',
          'admin': 'https://chat.example.com/admin',
          'invite': 'https://chat.example.com',
          'gift': 'https://chat.example.com',
          'webapp': 'https://chat.example.com',
        },
        'captcha': <String, dynamic>{
          'provider': 'none',
          'hcaptcha_site_key': null,
          'turnstile_site_key': null,
        },
        'features': <String, dynamic>{
          'voice_enabled': true,
          'stripe_enabled': false,
          'self_hosted': true,
          'presigned_attachment_uploads': true,
          'emails_enabled': true,
        },
        'registration': <String, dynamic>{
          'mode': 'open',
          'admin_registration_urls_enabled': false,
        },
        'community': <String, dynamic>{
          'single_community': false,
          'single_community_guild_id': null,
          'direct_messages_disabled': false,
        },
        'services': <String, dynamic>{
          'gif_enabled': true,
          'youtube_enabled': true,
          'bluesky_enabled': false,
        },
        'gif': <String, dynamic>{
          'provider': 'tenor',
          'display_name': 'Tenor',
          'attribution_required': false,
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
          },
          'setup': <String, dynamic>{'configured': true, 'admin_url': null},
          'legal': <String, dynamic>{'terms_url': null, 'privacy_url': null},
          'registration': <String, dynamic>{'collect_date_of_birth': false},
        },
      };
    }

    Dio buildDio({
      required Map<String, dynamic> responseJson,
      int statusCode = 200,
      String expectedPath = '/api/.well-known/fluxer',
    }) {
      return Dio()
        ..httpClientAdapter = _DiscoveryAdapter(
          responseJson: responseJson,
          statusCode: statusCode,
          expectedPath: expectedPath,
        );
    }

    test('connectToEndpoint returns snapshot on success', () async {
      final InstanceDiscoveryService service = InstanceDiscoveryService(
        dio: buildDio(responseJson: buildDiscovery()),
      );

      final snapshot = await service.connectToEndpoint('chat.example.com');

      expect(snapshot.apiBaseUrl, 'https://chat.example.com/v1');
      expect(snapshot.gatewayUrl, 'wss://gateway.chat.example.com');
      expect(snapshot.displayDomain, 'chat.example.com');
    });

    test('connectToEndpoint throws on 404', () {
      final InstanceDiscoveryService service = InstanceDiscoveryService(
        dio: buildDio(responseJson: <String, dynamic>{}, statusCode: 404),
      );

      expect(
        () => service.connectToEndpoint('chat.example.com'),
        throwsA(isA<InstanceDiscoveryException>()),
      );
    });

    test('connectToEndpoint throws on incompatible api code version', () {
      final InstanceDiscoveryService service = InstanceDiscoveryService(
        dio: buildDio(responseJson: buildDiscovery(apiCodeVersion: 0)),
      );

      expect(
        () => service.connectToEndpoint('chat.example.com'),
        throwsA(
          predicate<InstanceDiscoveryException>(
            (InstanceDiscoveryException error) =>
                error.message.contains('Incompatible server'),
          ),
        ),
      );
    });

    test(
      'connectToEndpoint short-circuits official input without HTTP',
      () async {
        final InstanceDiscoveryService service = InstanceDiscoveryService(
          dio: buildDio(responseJson: buildDiscovery()),
        );

        final InstanceConfigSnapshot snapshot = await service.connectToEndpoint(
          'api.fluxer.app/v1',
        );

        expect(snapshot.apiBaseUrl, InstanceConstants.defaultApiBaseUrl);
        expect(snapshot.displayDomain, 'fluxer.app');
      },
    );

    test(
      'connectToEndpoint resolves official api_public from well-known',
      () async {
        final InstanceDiscoveryService service = InstanceDiscoveryService(
          dio: buildDio(responseJson: buildOfficialDiscovery()),
        );

        final InstanceConfigSnapshot snapshot = await service.connectToEndpoint(
          'chat.example.com',
        );

        expect(snapshot.apiBaseUrl, InstanceConstants.defaultApiBaseUrl);
        expect(snapshot.displayDomain, 'fluxer.app');
      },
    );
  });
}

Map<String, dynamic> buildOfficialDiscovery({int apiCodeVersion = 1}) {
  return <String, dynamic>{
    'api_code_version': apiCodeVersion,
    'endpoints': <String, dynamic>{
      'api': 'https://web.fluxer.app/api',
      'api_client': 'https://web.fluxer.app/api',
      'api_public': 'https://api.fluxer.app',
      'gateway': 'wss://gateway.fluxer.app',
      'media': 'https://fluxerusercontent.com',
      'static_cdn': 'https://fluxerstatic.com',
      'marketing': 'https://fluxer.app',
      'admin': 'https://admin.fluxer.app',
      'invite': 'https://fluxer.gg',
      'gift': 'https://fluxer.gift',
      'webapp': 'https://web.fluxer.app',
    },
    'captcha': <String, dynamic>{
      'provider': 'none',
      'hcaptcha_site_key': null,
      'turnstile_site_key': null,
    },
    'features': <String, dynamic>{
      'voice_enabled': true,
      'stripe_enabled': true,
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
      },
      'setup': <String, dynamic>{'configured': true, 'admin_url': null},
      'legal': <String, dynamic>{'terms_url': null, 'privacy_url': null},
      'registration': <String, dynamic>{'collect_date_of_birth': true},
    },
  };
}

class _DiscoveryAdapter implements HttpClientAdapter {
  const _DiscoveryAdapter({
    required this.responseJson,
    required this.statusCode,
    this.expectedPath = '/api/.well-known/fluxer',
  });

  final Map<String, dynamic> responseJson;
  final int statusCode;
  final String expectedPath;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) {
    expect(options.method, 'GET');
    expect(options.uri.path, expectedPath);

    return Future<ResponseBody>.value(
      ResponseBody.fromString(
        jsonEncode(responseJson),
        statusCode,
        headers: <String, List<String>>{
          Headers.contentTypeHeader: <String>[Headers.jsonContentType],
        },
      ),
    );
  }

  @override
  void close({bool force = false}) {}
}
