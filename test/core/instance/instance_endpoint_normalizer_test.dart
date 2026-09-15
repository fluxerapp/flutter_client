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

    test('uses root well-known for official api host', () {
      expect(
        normalizer.buildWellKnownUrl('https://api.fluxer.app/v1'),
        'https://api.fluxer.app/.well-known/fluxer',
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

    test('matches official api host with path', () {
      expect(normalizer.isOfficialInstanceInput('api.fluxer.app/v1'), isTrue);
    });

    test('matches official fluxer.com api host', () {
      expect(normalizer.isOfficialInstanceInput('api.fluxer.com/v1'), isTrue);
    });

    test('rejects self-hosted host', () {
      expect(normalizer.isOfficialInstanceInput('chat.example.com'), isFalse);
    });
  });

  group('describeApiEndpoint', () {
    test('maps official api hosts to fluxer.app', () {
      expect(
        normalizer.describeApiEndpoint('https://api.fluxer.app/api'),
        'fluxer.app',
      );
      expect(
        normalizer.describeApiEndpoint('https://api.fluxer.app/v1'),
        'fluxer.app',
      );
      expect(normalizer.describeApiEndpoint('fluxer.app'), 'fluxer.app');
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
}
