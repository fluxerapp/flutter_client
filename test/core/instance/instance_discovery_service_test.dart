import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
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
        'app_public': <String, dynamic>{},
      };
    }

    Dio buildDio({
      required Map<String, dynamic> responseJson,
      int statusCode = 200,
    }) {
      return Dio()
        ..httpClientAdapter = _DiscoveryAdapter(
          responseJson: responseJson,
          statusCode: statusCode,
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

    test('connectToEndpoint throws on 404', () async {
      final InstanceDiscoveryService service = InstanceDiscoveryService(
        dio: buildDio(responseJson: <String, dynamic>{}, statusCode: 404),
      );

      expect(
        () => service.connectToEndpoint('chat.example.com'),
        throwsA(isA<InstanceDiscoveryException>()),
      );
    });

    test('connectToEndpoint throws on incompatible api code version', () async {
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
  });
}

class _DiscoveryAdapter implements HttpClientAdapter {
  const _DiscoveryAdapter({
    required this.responseJson,
    required this.statusCode,
  });

  final Map<String, dynamic> responseJson;
  final int statusCode;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    expect(options.method, 'GET');
    expect(options.uri.path, '/api/.well-known/fluxer');

    return ResponseBody.fromString(
      jsonEncode(responseJson),
      statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>[Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}
