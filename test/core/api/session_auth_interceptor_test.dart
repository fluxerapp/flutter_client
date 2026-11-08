import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/session_auth_interceptor.dart';

void main() {
  final Uri base = Uri.parse('https://a.example/api');

  test('matches requests under the token base url', () {
    expect(
      isRequestUnderBaseUrl(Uri.parse('https://a.example/api/users'), base),
      isTrue,
    );
    expect(
      isRequestUnderBaseUrl(Uri.parse('https://A.example/api'), base),
      isTrue,
    );
    expect(
      isRequestUnderBaseUrl(
        Uri.parse('https://a.example/users'),
        Uri.parse('https://a.example/'),
      ),
      isTrue,
    );
  });

  test('rejects requests to other instances or paths', () {
    for (final String url in <String>[
      'https://b.example/api/users',
      'http://a.example/api/users',
      'https://a.example:8443/api/users',
      'https://a.example/apix/users',
      'https://a.example/other',
      'https://a.example.evil/api/users',
    ]) {
      expect(isRequestUnderBaseUrl(Uri.parse(url), base), isFalse, reason: url);
    }
  });
}
