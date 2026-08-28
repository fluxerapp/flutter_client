import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/external_links/external_url_launcher.dart';

void main() {
  group('parseExternalLinkUri', () {
    test('normalizes bare emails to mailto', () {
      expect(
        parseExternalLinkUri('hello@example.com'),
        Uri(scheme: 'mailto', path: 'hello@example.com'),
      );
    });

    test('keeps explicit mailto links', () {
      final Uri? uri = parseExternalLinkUri('mailto:hello@example.com');
      expect(uri?.scheme, 'mailto');
      expect(uri?.path, 'hello@example.com');
    });
  });
}
