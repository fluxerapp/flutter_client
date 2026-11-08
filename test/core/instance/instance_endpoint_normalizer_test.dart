import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';

void main() {
  const InstanceEndpointNormalizer normalizer = InstanceEndpointNormalizer();

  group('normalizeEndpoint', () {
    test('prepends https for bare hostnames', () {
      expect(
        normalizer.normalizeEndpoint('chat.example.com'),
        'https://chat.example.com/api',
      );
    });

    test('preserves explicit https URL with path', () {
      expect(
        normalizer.normalizeEndpoint('https://chat.example.com/v1'),
        'https://chat.example.com/v1',
      );
    });

    test('strips trailing slashes from path', () {
      expect(
        normalizer.normalizeEndpoint('https://chat.example.com/api/'),
        'https://chat.example.com/api',
      );
    });

    test('allows http for LAN installs', () {
      expect(
        normalizer.normalizeEndpoint('http://192.168.1.10'),
        'http://192.168.1.10/api',
      );
    });

    test('throws on empty input', () {
      expect(
        () => normalizer.normalizeEndpoint('  '),
        throwsA(isA<FormatException>()),
      );
    });
  });

  group('buildWellKnownUrl', () {
    test('uses api well-known for self-hosted endpoints', () {
      expect(
        normalizer.buildWellKnownUrl('https://chat.example.com/api'),
        'https://chat.example.com/api/.well-known/fluxer',
      );
    });

    test('uses api well-known for self-hosted api client endpoints', () {
      expect(
        normalizer.buildWellKnownUrl('https://chat.example.com/v1'),
        'https://chat.example.com/api/.well-known/fluxer',
      );
    });

    test('uses api well-known for official marketing api path', () {
      expect(
        normalizer.buildWellKnownUrl('https://fluxer.com/api'),
        'https://fluxer.com/api/.well-known/fluxer',
      );
    });

    test('uses api well-known for official web app host', () {
      expect(
        normalizer.buildWellKnownUrl('https://web.fluxer.app/api'),
        'https://web.fluxer.app/api/.well-known/fluxer',
      );
    });
  });

  group('isOfficialInstanceInput', () {
    test('matches official web app host', () {
      expect(normalizer.isOfficialInstanceInput('web.fluxer.app'), isTrue);
    });

    test('matches official marketing host', () {
      expect(normalizer.isOfficialInstanceInput('fluxer.app'), isTrue);
    });

    test('matches official fluxer.com host', () {
      expect(normalizer.isOfficialInstanceInput('fluxer.com'), isTrue);
    });

    test('rejects self-hosted host', () {
      expect(normalizer.isOfficialInstanceInput('chat.example.com'), isFalse);
    });
  });

  group('describeApiEndpoint', () {
    test('maps official hosts to default instance url', () {
      expect(normalizer.describeApiEndpoint('fluxer.com'), 'fluxer.com');
      expect(normalizer.describeApiEndpoint('fluxer.app'), 'fluxer.com');
      expect(
        normalizer.describeApiEndpoint('https://fluxer.com/api/v1'),
        'fluxer.com',
      );
    });

    test('keeps self-hosted host and non-default path', () {
      expect(
        normalizer.describeApiEndpoint('https://chat.example.com/api'),
        'chat.example.com',
      );
      expect(
        normalizer.describeApiEndpoint('https://chat.example.com/v1'),
        'chat.example.com/v1',
      );
    });

    test('keeps a cleartext scheme and a non-default port', () {
      expect(
        normalizer.describeApiEndpoint('http://192.168.1.20:8080/api'),
        'http://192.168.1.20:8080',
      );
      expect(
        normalizer.describeApiEndpoint('https://chat.example.com:8443/api'),
        'https://chat.example.com:8443',
      );
      expect(
        normalizer.describeApiEndpoint('http://chat.example.com/api'),
        'http://chat.example.com',
      );
    });
  });

  group('formatDisplayDomain', () {
    test('strips api subdomain prefix', () {
      expect(normalizer.formatDisplayDomain('api.fluxer.app'), 'fluxer.app');
    });

    test('leaves domains without api prefix unchanged', () {
      expect(
        normalizer.formatDisplayDomain('chat.example.com'),
        'chat.example.com',
      );
    });
  });

  group('extractDisplayDomain', () {
    test('strips api subdomain from api endpoint host', () {
      expect(
        normalizer.extractDisplayDomain('https://api.fluxer.app/v1'),
        'fluxer.app',
      );
    });
  });

  test('isLocalNetworkHost classifies hosts', () {
    expect(isLocalNetworkHost('chat.example.com'), isFalse);
    expect(isLocalNetworkHost('8.8.8.8'), isFalse);
    expect(isLocalNetworkHost('192.168.1.20'), isTrue);
    expect(isLocalNetworkHost('10.0.0.5'), isTrue);
    expect(isLocalNetworkHost('172.20.1.1'), isTrue);
    expect(isLocalNetworkHost('100.101.102.103'), isTrue);
    expect(isLocalNetworkHost('fluxer.local'), isTrue);
    expect(isLocalNetworkHost('fd00::1'), isTrue);
    expect(isLocalNetworkHost('localhost'), isTrue);
  });

  group('isGatewayTrustedForApi', () {
    test('accepts gateways on the api host or its site', () {
      for (final List<String> pair in <List<String>>[
        <String>['wss://gateway.fluxer.com', 'https://fluxer.com/api/v1'],
        <String>[
          'wss://chat.example.com/gateway',
          'https://chat.example.com/v1',
        ],
        <String>['wss://gateway.example.com', 'https://api.example.com/v1'],
        <String>['ws://192.168.1.20:8080/gateway', 'http://192.168.1.20:8080'],
        <String>['ws://localhost:8088', 'http://localhost:8088/api'],
      ]) {
        expect(
          isGatewayTrustedForApi(pair[0], pair[1]),
          isTrue,
          reason: '$pair',
        );
      }
    });

    test('rejects foreign hosts and public cleartext gateways', () {
      for (final List<String> pair in <List<String>>[
        <String>['wss://evil.example', 'https://chat.example.com/v1'],
        <String>['wss://chat.example.com.evil', 'https://chat.example.com/v1'],
        <String>['wss://evil.co.uk', 'https://chat.co.uk/v1'],
        <String>['wss://gateway.example.com', 'https://chat.example.com/v1'],
        <String>['wss://evil.10.0.0.1', 'https://10.0.0.1/api'],
        <String>['ws://gateway.example.com', 'https://api.example.com/v1'],
        <String>['https://gateway.example.com', 'https://api.example.com/v1'],
        <String>['wss://10.0.0.2', 'https://10.0.0.1/api'],
        <String>['', 'https://chat.example.com/v1'],
      ]) {
        expect(
          isGatewayTrustedForApi(pair[0], pair[1]),
          isFalse,
          reason: '$pair',
        );
      }
    });
  });
}
